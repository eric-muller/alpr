. 00_common.sh

# How many queries has the US Postal Inspection Service made each month?

query_net usps_cases_by_month "
  select month, count (*) as cases, sum (nb_queries) as queries from (
       select concat (extract (year from first_search_time),
                      '-',
                      right (concat ('00', extract (month from first_search_time)), 2)) as month,
              nb_queries
       from $schema.ORGNET_cases
       where agency = 'US Postal Inspection Service [Federal]') as foo
  group by month
  order by month
  "
