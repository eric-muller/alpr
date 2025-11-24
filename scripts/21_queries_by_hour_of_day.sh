. 00_common.sh

# The search_time in the original XSL looks like "08/05/2025, 03:54:06 AM UTC"
# (this is actually the last search time in the Los Altos data)
#
# We import that in Postgres as "timestamp with time zone".
#
# We can verify that the import preseved the time zone correctly:


psql $db > reports/check_timezones.txt <<EOF
select max (search_time) at time zone 'UTC' as utc from $schema.net_queries;
select max (search_time) at time zone 'America/New_York' as new_york from $schema.net_queries;
select max (search_time) at time zone 'America/Los_Angeles' as los_angeles from $schema.net_queries;
select max (search_time) as local from $schema.net_queries;

select extract (hour from h at time zone 'UTC') as utc_hour
     from (select max (search_time) as h from $schema.net_queries) as a;
select extract (hour from h at time zone 'America/New_York') as new_york_hour
     from (select max (search_time) as h from $schema.net_queries) as a;
select extract (hour from h at time zone 'America/Los_Angeles') as los_angeles_hour
     from (select max (search_time) as h from $schema.net_queries) as a;
EOF

# We get back:
#
# 2025-08-05 06:59:55
# 2025-08-05 02:59:55
# 2025-08-04 23:59:55
# 2025-08-04 23:59:55-07
# 6
# 2
# 23
#
# which is indeed correct.

# Let's see how the search activity is distributed throughout the day

query_org_and_net queries_by_hour_of_day "
  select pacific_time_hour, count(*) as number_of_queries
    from (select extract (hour from search_time at time zone 'America/Los_Angeles') as pacific_time_hour
          from $schema.ORGNET_queries
          where $recent_queries) as foo
  group by pacific_time_hour
  order by pacific_time_hour
  "
