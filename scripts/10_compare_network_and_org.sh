. 00_common.sh

query in_org "
  select search_time, nets, devs, reason, case_number
  from $schema.org_queries
  order by search_time
  "

query in_org_not_in_network "
  select search_time, nets, devs, reason, case_number
  from $schema.org_queries
  where not exists (
    select from $schema.net_queries
    where $schema.org_queries.agency = $schema.net_queries.agency
      and $schema.org_queries.search_time = $schema.net_queries.search_time
      and $schema.org_queries.case_number = $schema.net_queries.case_number
      and $schema.org_queries.reason = $schema.net_queries.reason )
  order by search_time
  "
query in_network_not_in_org "
  select search_time, nets, devs, reason, case_number
  from $schema.net_queries
  where agency = '$dataorg'
    and not exists ( select from $schema.org_queries
                     where $schema.org_queries.search_time = $schema.net_queries.search_time
                       and $schema.org_queries.case_number = $schema.net_queries.case_number
                       and $schema.org_queries.reason = $schema.net_queries.reason )
  order by search_time
  "
