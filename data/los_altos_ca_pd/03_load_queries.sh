. 00_common.sh


columns="(name, agency, nets, devs, time_frame, license_plate, reason, case_number, filters, search_time, search_type, text_prompt, moderation)"


load_queries "data-25-312/Los Altos CA PD_NETWORK AUDIT 2024.xlsx" net_queries "$columns"
load_queries "data-25-312/Los Altos CA PD_NETWORK AUDIT 2025.xlsx" net_queries "$columns"

load_queries "data-25-312/Los Altos CA PD_ORG AUDIT 2024.xlsx" org_queries "$columns"
load_queries "data-25-312/Los Altos CA PD_ORG AUDIT 2025.xlsx" org_queries "$columns"

psql $db <<EOF
-- the data files cover a few days in August
-- which are also in the next set of files

delete from $schema.net_queries where search_time >= '2025-08-01 00:00:00-07';
delete from $schema.org_queries where search_time >= '2025-08-01 00:00:00-07';
EOF

load_queries "data-25-402/Los Altos NETWORK Audit_ PRA  25-402_with reason.xlsx" net_queries "$columns"

load_queries "data-25-402/Los Altos ORG Audit_PRA 25-402_with reason.xlsx" org_queries "$columns"


psql $db <<EOF
-- the data files cover partially September 3

delete from $schema.net_queries where search_time >= '2025-09-01 00:00:00-07';
delete from $schema.org_queries where search_time >= '2025-09-01 00:00:00-07';
EOF
