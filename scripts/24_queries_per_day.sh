. 00_common.sh

query_org_and_net queries_by_day "
  select day, count (*) as queries from (
       select concat (extract (year from search_time),
                      '-',
                      right (concat ('00', extract (month from search_time)), 2),
                      '-',
                      right (concat ('00', extract (day from search_time)), 2)) as day
       from $schema.ORGNET_queries) as foo
  group by day
  order by day
  "
