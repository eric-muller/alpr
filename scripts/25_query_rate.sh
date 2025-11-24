. 00_common.sh


for ORGNET in org net ; do

psql $db > reports/${ORGNET}.query_rate.txt <<EOF

select
  extract (year from (select min (search_time) from $schema.${ORGNET}_queries)) as "from",

  (  (select max(search_time) from $schema.${ORGNET}_queries)::date
   - (select min(search_time) from $schema.${ORGNET}_queries)::date
   + 1) as days,

  (select count(*) from $schema.${ORGNET}_cases) as cases,

  (select count(*) from $schema.${ORGNET}_queries) as queries,

  (select count(*) from
     (select distinct agency from $schema.${ORGNET}_cases) as x) as orgs

  \gset

select (round (:days * 24 * 3600 / :cases)) as sec_case,
       (round (:days * 24 * 3600 / :queries)) as sec_query
  \gset


select to_char (:cases, 'fm999G999G999') as cases_f,
       to_char (:queries,  'fm999G999G999') as queries_f,
       to_char (:orgs,  'fm999G999G999') as orgs_f
  \gset

\echo days=:days cases=:cases_f queries=:queries_f orgs=:orgs_f  sec between cases :sec_case sec between queries :sec_query

EOF


if [ "$recent" != "no" ] ; then

psql $db > reports/${ORGNET}.query_rate_recent.txt <<EOF

select
  extract (year from (select min (search_time) from $schema.${ORGNET}_queries
                      where $recent_queries)) as "from",

  (  (select max(search_time) from $schema.${ORGNET}_queries where $recent_queries)::date
   - (select min(search_time) from $schema.${ORGNET}_queries where $recent_queries)::date
   + 1) as days,

  (select count(*) from $schema.${ORGNET}_cases where $recent_cases) as cases,

  (select count(*) from $schema.${ORGNET}_queries where $recent_queries) as queries,

  (select count(*) from
     (select distinct agency from $schema.${ORGNET}_cases where $recent_cases) as x) as orgs

  \gset

select (round (:days * 24 * 3600 / :cases)) as sec_case,
       (round (:days * 24 * 3600 / :queries)) as sec_query
  \gset


select to_char (:cases, 'fm999G999G999') as cases_f,
       to_char (:queries,  'fm999G999G999') as queries_f,
       to_char (:orgs,  'fm999G999G999') as orgs_f
  \gset

\echo days=:days cases=:cases_f queries=:queries_f orgs=:orgs_f  sec between cases :sec_case sec between queries :sec_query

EOF

fi

done
