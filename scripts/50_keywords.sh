. 00_common.sh

keyword="(    'ice' = any (string_to_array (lower (case_number), ' ' ))
          or  'ice' = any (string_to_array (lower (reason),      ' ' ))
          or  'dhs' = any (string_to_array (lower (case_number), ' ' ))
          or  'dhs' = any (string_to_array (lower (reason),      ' ' ))
          or  'hsi' = any (string_to_array (lower (case_number), ' ' ))
          or  'hsi' = any (string_to_array (lower (reason),      ' ' ))
          or  'cbp' = any (string_to_array (lower (case_number), ' ' ))
          or  'cbp' = any (string_to_array (lower (reason),      ' ' ))
          or  'fbi' = any (string_to_array (lower (case_number), ' ' ))
          or  'fbi' = any (string_to_array (lower (reason),      ' ' ))
          or  'aft' = any (string_to_array (lower (case_number), ' ' ))
          or  'aft' = any (string_to_array (lower (reason),      ' ' ))
          or  'atf' = any (string_to_array (lower (case_number), ' ' ))
          or  'atf' = any (string_to_array (lower (reason),      ' ' ))
          or  'marshal' = any (string_to_array (lower (case_number), ' ' ))
          or  'marshal' = any (string_to_array (lower (reason),      ' ' ))
          or  'marshals' = any (string_to_array (lower (case_number), ' ' ))
          or  'marshals' = any (string_to_array (lower (reason),      ' ' ))
          or  'marshall' = any (string_to_array (lower (case_number), ' ' ))
          or  'marshall' = any (string_to_array (lower (reason),      ' ' ))
          or  'marshalls' = any (string_to_array (lower (case_number), ' ' ))
          or  'marshalls' = any (string_to_array (lower (reason),      ' ' ))
          or  'border' = any (string_to_array (lower (case_number), ' ' ))
          or  'border' = any (string_to_array (lower (reason),      ' ' ))
          or  'immigration' = any (string_to_array (lower (case_number), ' ' ))
          or  'immigration' = any (string_to_array (lower (reason),      ' ' )))"


query_org_and_net keywords_query_all "
  select search_time, agency, case_number, reason
  from $schema.ORGNET_queries
  where $keyword
  order by search_time
  "

if [ "$recent" != "no" ] ; then
query_org_and_net keywords_query_recent "
  select search_time, agency, case_number, reason
  from $schema.ORGNET_queries
  where $keyword and $recent_queries
  order by search_time
  "
fi


query_org_and_net keywords_case_all "
  select last_search_time, nb_queries, agency, case_number, reason
  from $schema.ORGNET_cases
  where $keyword
  order by first_search_time
  "

if [ "$recent" != "no" ] ; then
query_org_and_net keywords_case_recent "
  select first_search_time::date as date, agency, case_number as case, reason
  from $schema.ORGNET_cases
  where $keyword and $recent_cases
  order by first_search_time
  "
fi
