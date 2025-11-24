. 00_common.sh


columns="(agency, nets, devs, case_number, reason, search_time)"

load_queries "data-25-6339/processed/25-6339_Flock_NetworkAudi.csv"       net_queries "$columns"


columns="(agency, name, nets, time_frame, case_number, reason, search_time)"

load_queries "data-25-6339/processed/25-6339_Flock_OrganizationAudit.csv" org_queries "$columns" '^Name'

psql $db <<EOF
update $schema.org_queries set agency='Oakland CA PD';
EOF

# there has been some 8 bit encoding / UTF-8 confusion

psql $db <<EOF
update $schema.org_queries set reason = regexp_replace (reason, E'Â§', '§', 'g');
update $schema.net_queries set reason = regexp_replace (reason, E'Â§', '§', 'g');

update $schema.org_queries set reason = regexp_replace (reason, E'â€“', '–', 'g');
update $schema.net_queries set reason = regexp_replace (reason, E'â€“', '–', 'g');

update $schema.org_queries set reason = regexp_replace (reason, E'â€', '–', 'g');
update $schema.net_queries set reason = regexp_replace (reason, E'â€', '–', 'g');

update $schema.org_queries set reason = regexp_replace (reason, E' ', '–,', 'g');
update $schema.net_queries set reason = regexp_replace (reason, E' ', '–,', 'g');

-- U+201a by U+002C

update $schema.org_queries set reason = regexp_replace (reason, E'‚', ',', 'g');
update $schema.net_queries set reason = regexp_replace (reason, E'‚', ',', 'g');

EOF
