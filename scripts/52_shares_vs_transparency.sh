. 00_common.sh

psql $db -c "
  select agency,
         min(first_search_time) as first_query,
         max(last_search_time) as last_query,
         count(*) as cases,
         sum(nb_queries) as queries
  from $schema.net_cases
  where $recent_cases
    and not exists (select agency from $schema.sharing_t
                    where $schema.sharing_t.agency = $schema.cases.agency)
    and agency <> '$dataorg'
  group by rollup (agency)
  order by agency
  " > reports/unauthorized_orgs2.txt
