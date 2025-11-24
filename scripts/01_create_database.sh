. 00_common.sh

# create the database alpr if it does not exist

psql postgres <<EOF
 select 'create database ${db}'
 where not exists (select from pg_database where datname = '${db}')
 \gexec
EOF

psql ${db} <<EOF
 drop schema if exists $schema cascade;

 create schema $schema;
EOF
