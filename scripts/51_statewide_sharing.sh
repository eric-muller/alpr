. 00_common.sh

query_net statewide_sharing "
  select agency,
         min (first_search_time) as first_query,
         max (last_search_time) as last_query,
         count(*) as cases,
         sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where not exists (select agency from $schema.sharing
                    where $schema.sharing.agency = $schema.net_cases.agency
                      and me_sharing <> '')
    and not $outsideca
    and agency <> '$dataorg'
  group by agency
  order by agency
  "

if [ "$recent" != "no" ] ; then
query_net recent_statewide_sharing "
  select agency,
         min (first_search_time) as first_query,
         max (last_search_time) as last_query,
         count(*) as cases,
         sum(nb_queries) as queries
  from $schema.ORGNET_cases
  where $recent_cases
    and not exists (select agency from $schema.sharing
                    where $schema.sharing.agency = $schema.net_cases.agency
                      and me_sharing <> '')
    and not $outsideca
    and agency <> '$dataorg'
  group by agency
  order by agency
  "
fi
