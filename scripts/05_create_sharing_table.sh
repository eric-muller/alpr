. 00_common.sh

psql $db <<EOF
drop table if exists $schema.sharing;

create table $schema.sharing
  (agency         text not null default '',
   shared_with_me   text not null default '',
   me_sharing       text not null default '');
EOF
