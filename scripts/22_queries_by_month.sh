. 00_common.sh

query_org_and_net cases_by_month "
  select month, count (*) as cases, sum (nb_queries) as queries from (
       select to_char (first_search_time, 'YYYY-MM') as month,
              nb_queries
       from $schema.ORGNET_cases) as foo
  group by month
  order by month
  "
