. 00_common.sh

psql $db <<EOF
drop table if exists $schema.shared_with_me;
create table $schema.shared_with_me
  (agency text, shared_with_me text, dummy1 text, dummy2 text, dummy3 text);
EOF

tail -n +2 data-25-6339/processed/OPD_Orgs_ThatHaveSharedWithUs.csv |\
    psql $db -c "copy $schema.shared_with_me from STDIN with (format csv);"



psql $db <<EOF
drop table if exists $schema.we_have_shared;
create table $schema.we_have_shared
  (agency text);
EOF

tail -n +2 data-25-6339/processed/OPD_Orgs_WeHaveSharedWith.csv |\
    psql $db -c "copy $schema.we_have_shared from STDIN with (format csv);"


psql $db <<EOF
delete from $schema.shared_with_me where agency is null;
delete from $schema.we_have_shared where agency is null;


drop table if exists $schema.sharing;

create table $schema.sharing as
select * from
( select $schema.shared_with_me.agency as agency,
         $schema.shared_with_me.shared_with_me as shared_with_me,
         $schema.we_have_shared.agency as agency2
  from $schema.shared_with_me full outer join $schema.we_have_shared
  on  $schema.shared_with_me.agency = $schema.we_have_shared.agency ) as foo,
( select '$dataorg' as me_sharing) as bar;

update $schema.sharing set agency = agency2 where agency is null;
update $schema.sharing set shared_with_me = '' where shared_with_me is null;
update $schema.sharing set me_sharing = '' where me_sharing is null;

alter table $schema.sharing drop column agency2;
alter table $schema.sharing alter column agency         set not null;
alter table $schema.sharing alter column shared_with_me set not null;
alter table $schema.sharing alter column me_sharing     set not null;


EOF
