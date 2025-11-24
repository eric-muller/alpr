. 00_common.sh

psql $db > reports/org.first_query.html <<EOF
     select to_char (min (search_time), 'FMMonth FMDD, YYYY') as first from $schema.org_queries
     \gset
     \echo <span>:first</span>
EOF

psql $db > reports/org.last_query.html <<EOF
     select to_char (max (search_time), 'FMMonth FMDD, YYYY') as last from $schema.org_queries
     \gset
     \echo <span>:last</span>
EOF

psql $db > reports/net.first_query.html <<EOF
     select to_char (min (search_time), 'FMMonth FMDD, YYYY') as first from $schema.net_queries
     \gset
     \echo <span>:first</span>
EOF

psql $db > reports/net.last_query.html <<EOF
     select to_char (max (search_time), 'FMMonth FMDD, YYYY') as last from $schema.net_queries
     \gset
     \echo <span>:last</span>
EOF
