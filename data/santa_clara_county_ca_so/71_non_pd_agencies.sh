. 00_common.sh

query non_pd_agencies "
  select agency, shared_with_me as \"networks shared\"

  from $schema.sharing
  where shared_with_me <> ''
    and agency !~ '.* PD.*'
    and agency !~ '.* SO.*'
  order by agency
  "

query pd_agencies_non_ca "
  select agency
  from $schema.sharing
  where shared_with_me <> ''
    and (   agency ~ '.* PD.*'
         or agency ~ '.* SO.*')
    and agency !~ '.* CA'
  order by agency
  "
query pd_agencies_ca "
  select agency, shared_with_me as \"networks shared\"

  from $schema.sharing
  where shared_with_me <> ''
    and (   agency ~ '.* PD.*'
         or agency ~ '.* SO.*')
    and agency ~ '.* CA'
  order by agency
  "
