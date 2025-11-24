. 00_common.sh

columns="(name,agency,nets,devs,time_frame,license_plate,reason,case_number,filters,search_time,search_type,text_prompt,moderation)"

load_queries "data-p000388-100525/4_1_2025-4_30_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/5_1_2025-5_31_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/6_1_2025-6_30_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/7_1_2025-7_31_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/8_1_2025-8_31_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/9_1_2025-9_30_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"
load_queries "data-p000388-100525/10_1_2025-10_6_2025-Vacaville_CA_PD-Network-Audit.csv" net_queries "$columns"




load_queries "data-p000388-100525/4_1_2025-4_30_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/5_1_2025-5_31_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/6_1_2025-6_30_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/7_1_2025-7_31_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/8_1_2025-8_31_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/9_1_2025-9_30_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"
load_queries "data-p000388-100525/10_1_2025-10_6_2025-Vacaville_CA_PD-Audit.csv" org_queries "$columns"


exit 0

psql $db <<EOF
--- all REDACTED
update $schema.org_queries set reason='';
update $schema.org_queries set case_number='';

update $schema.net_queries set reason='';
update $schema.net_queries set case_number='';

EOF
