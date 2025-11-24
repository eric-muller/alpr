. 00_common.sh

query_net cases_by_org_all "
  select agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  group by agency
  order by count(*) desc
  "
if [ "$recent" != "no" ] ; then
query_net cases_by_org_recent "
  select agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where $recent_cases
  group by agency
  order by count(*) desc
  "
query_net cases_by_org_recent_25 "
  select agency as agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where $recent_cases
  group by agency
  order by count(*) desc limit 25
  "
query_net cases_by_org_recent_neighbors "
  select ORGNET_cases.agency as agency, count(*) as cases,
         sum(nb_queries) as queries
  from $schema.ORGNET_cases, $schema.neighbors
  where $schema.ORGNET_cases.agency = $schema.neighbors.agency
    and $recent_cases
    and $schema.ORGNET_cases.agency <> '$dataorg'
  group by $schema.ORGNET_cases.agency
  order by count(*) desc
  "
fi

query_net first_and_last "
select * from
  (select min (search_time) as \"first\",
          max (search_time) as \"last\"
  from $schema.ORGNET_queries) as a,

  (select min (search_time) as \"first non ca\",
          max (search_time) as \"last non ca\"
  from $schema.ORGNET_queries
  where $outsideca) as b
  "


# to get the outside agencies (mostly the count)
query_net cases_by_org_non_ca "
  select agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where $outsideca
  group by agency
  order by count(*) desc, queries desc
  "

# to get the outside agencies, with time frames
query_net cases_by_org_non_ca_with_timeframe "
  select agency, count(*) as cases, sum(nb_queries) as queries, min (first_search_time), max (last_search_time)
  from $schema.ORGNET_cases
  where $outsideca
  group by agency
  order by count(*) desc
  "

# to get the most active non_ca agencies
query_net cases_by_org_non_ca_25 "
  select agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where $outsideca
  group by agency
  order by cases desc
  limit 25
  "
# to get the federal agencies
query_net cases_by_org_federal "
  select agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where agency like '%[Federal]%'
  group by agency
  order by agency
  "

# to get the most active ca agencies
query_net cases_by_org_ca_25 "
  select agency as agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where not ($outsideca)
  group by agency
  order by cases desc
  limit 25
  "

# to get the most active agencies
query_net cases_by_org_25 "
  select agency as agency, count(*) as cases, sum(nb_queries) as queries
  from $schema.ORGNET_cases
  group by agency
  order by cases desc
  limit 25
  "

# to get the number of queries and cases from outside agencies
# we case only about the count, so we can select any field(s)

query_net queries_non_ca "
  select agency
  from $schema.ORGNET_queries
  where $outsideca
  "
query_net cases_non_ca "
  select agency
  from $schema.ORGNET_cases
  where $outsideca
  "
