. 00_common.sh

query sharing_yn "
  select agency from $schema.sharing
  where shared_with_me = '' and me_sharing <> ''
  order by agency
  "
query sharing_yn_neighbors "
  select sharing.agency from $schema.sharing, $schema.neighbors
  where $schema.sharing.agency = $schema.neighbors.agency
    and shared_with_me = '' and me_sharing <> ''
  order by agency
  "

query sharing_ny "
  select agency from $schema.sharing
  where shared_with_me <> '' and me_sharing = ''
  order by agency
  "
query sharing_ny_neighbors "
  select sharing.agency from $schema.sharing, $schema.neighbors
  where $schema.sharing.agency = $schema.neighbors.agency
    and shared_with_me <> '' and me_sharing = ''
  order by agency
  "

query sharing_yy "
  select agency from $schema.sharing
  where shared_with_me <> '' and me_sharing <> ''
  order by agency
  "
query sharing_yy_neighbors "
  select sharing.agency from $schema.sharing, $schema.neighbors
  where $schema.sharing.agency = $schema.neighbors.agency
    and shared_with_me <> '' and me_sharing <> ''
  order by agency
  "


query sharing_total "
  select * from $schema.sharing
  order by agency
  "

query sharing_nn_neighbors "
  select agency from $schema.neighbors
  where not exists (select from $schema.sharing
                    where $schema.sharing.agency = $schema.neighbors.agency)
        and agency <> '$dataorg'
  order by agency
  "
