. 00_common.sh

query orgs_all "
  select distinct (agency)
  from $schema.net_queries
  order by agency
  "

if [ "$recent" != "no" ] ; then
query orgs_recent "
  select distinct (agency)
  from $schema.net_queries
  where $recent_queries
  order by agency
  "
fi
