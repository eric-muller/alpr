. 00_common.sh

# How many queries has MOCIC made each month?

query_net mocic_cases_by_month "
  select month, count (*) as cases, sum (nb_queries) as queries from (
       select concat (extract (year from first_search_time),
                      '-',
                      right (concat ('00', extract (month from first_search_time)), 2)) as month,
              nb_queries
       from $schema.ORGNET_cases

       where agency = 'MOCIC') as foo
  group by month
  order by month
  "
