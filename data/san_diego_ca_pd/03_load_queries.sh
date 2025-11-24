. 00_common.sh

columns="(name,agency,nets,devs,time_frame,license_plate,case_number,filters,reason,search_time)"
columns2="(name,agency,nets,devs,time_frame,license_plate,case_number,filters,reason,search_time,text_prompt,moderation)"
columns5="(name,agency,nets,devs,time_frame,license_plate,case_number,filters,reason,search_time,search_type,text_prompt,moderation)"
columns6="(name,nets,time_frame,license_plate,case_number,filters,reason,search_time,search_type,text_prompt,moderation)"


load_queries "data-25-6890/San Diego CA PD_Network_Audit_5_1_2025_5_28_2025_REDACTED.xlsx" net_queries "$columns2"
load_queries "data-25-6890/6_1_2025-6_30_2025-San Diego CA PD-Network-Audit_Redacted.xlsx" net_queries "$columns5"
load_queries "data-25-6890/7_1_2025-7_31_2025-San Diego CA PD-Network-Audit_Redacted.xlsx" net_queries "$columns5"
load_queries "data-25-6890/8_1_2025-8_31_2025-San Diego CA PD-Network-Audit_Redacted.xlsx" net_queries "$columns5"
load_queries "data-25-6890/9_1_2025-9_4_2025-San Diego CA PD-Network-Audit_Redacted.xlsx" net_queries "$columns5"

load_queries "data-25-6890/San Diego CA PD_Organization_Audit_2025-05-01_2025-05-28_REDACTED.xlsx" org_queries "$columns6"
load_queries "data-25-6890/6_1_2025-6_30_2025-San Diego CA PD-ORG Audit_Redacted.xlsx" org_queries "$columns5"
load_queries "data-25-6890/7_1_2025-7_31_2025-San Diego CA PD-ORG Audit_Redacted.xlsx" org_queries "$columns5"
load_queries "data-25-6890/8_1_2025-8_31_2025-San Diego CA PD-ORG Audit_Redacted.xlsx" org_queries "$columns5"
load_queries "data-25-6890/9_1_2025-9_4_2025-San Diego CA PD-ORG Audit_Redacted.xlsx" org_queries "$columns5"

psql $db <<EOF
-- data for the 27 is partial and does not align between net and org
-- data for rest of month is missing

delete from $schema.net_queries where search_time >= '2025-05-27 00:00:00-07'
                                  and search_time <  '2025-06-01 00:00:00-07';

delete from $schema.org_queries where search_time >= '2025-05-27 00:00:00-07'
                                  and search_time <  '2025-06-01 00:00:00-07';

-- only a few days, make monthly numbers weird

delete from $schema.net_queries where search_time >= '2025-09-01 00:00:00-07';

delete from $schema.org_queries where search_time >= '2025-09-01 00:00:00-07';

EOF

load_queries "data-25-4039/San Diego CA PD_Network_Audit_1_1_2024_2_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_2_1_2024_3_1_2024_ REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_3_1_2024_4_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_4_1_2024_5_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_5_1_2024_6_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_6_1_2024_7_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_7_1_2024_8_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_8_1_2024_9_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_9_1_2024_10_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_10_1_2024_11_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_11_1_2024_12_1_2024_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_12_1_2024_1_1_2025_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_1_1_2025_2_1_2025_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_2_1_2025_3_1_2025_REDACTED.xlsx" net_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_3_1_2025_4_1_2025_REDACTED.xlsx" net_queries "${columns2}"
load_queries "data-25-4039/San Diego CA PD_Network_Audit_4_1_2025_5_1_2025_REDACTED.xlsx" net_queries "${columns2}"
#load_queries "data-25-4039/San Diego CA PD_Network_Audit_5_1_2025_5_20_2025_REDACTED.xlsx" net_queries "${columns2}"
#load_queries "data-25-4039/San Diego CA PD_Network_Audit_5_1_2025_5_28_2025_REDACTED.xlsx" net_queries "${columns2}"


columns="(name,nets,time_frame,license_plate,case_number,filters,reason,search_time)"
columns2="(name,nets,time_frame,license_plate,case_number,filters,reason,search_time,search_type)"
columns3="(name,nets,time_frame,license_plate,case_number,filters,reason,search_time,search_type,text_prompt,moderation)"

load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-06-01_2024-07-01_REDACTED.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-07-01_2024-08-01_REDACTED.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-08-01_2024-09-01_REDACTED.xlsx" org_queries "${columns}"
pload_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-09-01_2024-10-01_REDACTED.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-10-01_2024-11-01_REDACTED_.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-11-01_2024-12-01_REDACTED.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2024-12-01_2025-01-01_REDACTED.xlsx" org_queries "${columns}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2025-01-01_2025-02-01_REDACTED.xlsx" org_queries "${columns2}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2025-02-01_2025-03-01_REDACTED.xlsx" org_queries "${columns2}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2025-03-01_2025-04-01_REDACTED.xlsx" org_queries "${columns3}"
load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2025-04-01_2025-05-01_REDACTED.xlsx" org_queries "${columns3}"
#load_queries "data-25-4039/San Diego CA PD_Organization_Audit_2025-05-01_2025-05-28_REDACTED.xlsx" org_queries "${columns3}"


psql $db <<EOF
update $schema.org_queries set agency='San Diego CA PD';
EOF
