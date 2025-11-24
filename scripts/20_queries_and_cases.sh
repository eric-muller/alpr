. 00_common.sh

query_net queries_all "
  select search_time, agency, case_number, reason
  from $schema.ORGNET_queries
  order by search_time
  "
if [ "$recent" != "no" ] ; then
query_net queries_recent "
  select search_time, agency, case_number, reason
  from $schema.ORGNET_queries
  where $recent_queries
  order by search_time
  "
fi

query_net cases_all "
  select first_search_time, agency, case_number, reason
  from $schema.ORGNET_cases
  order by first_search_time
  "
if [ "$recent" != "no" ] ; then
query_net cases_recent "
  select first_search_time, agency, case_number, reason
  from $schema.ORGNET_cases
  where $recent_cases
  order by first_search_time
  "
fi
