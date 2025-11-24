. 00_common.sh

query_org_and_net users  "
  select name from $schema.ORGNET_queries
  where name not ilike '%peregrine%' and name not like '%API%'
  group by name
  "
query_org_and_net api_users "
  select name from $schema.ORGNET_queries
  where name ilike '%peregrine%' or name like '%API%'
  group by name
  order by name
  "
query_org_and_net api_queries "
  select agency, search_time, name from $schema.ORGNET_queries
  where name ilike '%peregrine%' or name like '%API%'
  order by search_time
  "
query_org_and_net search_types "
  select search_type from $schema.ORGNET_queries
  group by search_type
  "
