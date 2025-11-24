. 00_common.sh

psql "$db" > reports/periods.txt <<EOF

  select max (search_time) from $schema.net_queries where agency <> '$dataorg';

  select distinct agency from $schema.net_queries;
EOF
