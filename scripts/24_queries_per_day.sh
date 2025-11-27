. 00_common.sh

query_org_and_net queries_by_day "
  select day, count (*) as queries from (
       select to_char (search_time, 'YYYY-MM-DD') as day
       from $schema.ORGNET_queries) as foo
  group by day
  order by day
  "
