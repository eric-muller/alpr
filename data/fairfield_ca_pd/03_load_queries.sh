. 00_common.sh

columns="(case_number, name, search_time, devs, reason)"

load_queries "data-2025-11-20/2025-11-20_search_audit.csv"  org_queries  "$columns"

psql $db <<EOF

update $schema.org_queries set agency = 'Fairfield CA PD';

-- we used the filters column to absorb a query id
update $schema.org_queries set case_number = '';

EOF
