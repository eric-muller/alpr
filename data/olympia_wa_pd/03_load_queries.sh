. 00_common.sh

columns="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time)"

load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_1_1_2025_2_1_2025.csv"  net_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_12_1_2024_1_1_2025.csv"  net_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_2_1_2025_3_1_2025.csv"  net_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_3_1_2025_4_1_2025.csv"  net_queries "$columns"

columns="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time, text_prompt, moderation)"

load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_4_1_2025_5_1_2025.csv"  net_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_5_1_2025_6_1_2025.csv"  net_queries "$columns"

columns="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time)"

load_queries "data-W047498-051825/Olympia_WA_PD__Network_Audit_6_1_2025_6_4_2025.csv"  net_queries "$columns"


columns="(name, nets, time_frame, license_plate, case_number, filters, reason, search_time)"

load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2024-12-01_2025-01-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-01-01_2025-02-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-02-01_2025-03-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-03-01_2025-04-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-04-01_2025-05-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-05-01_2025-06-01.csv"  org_queries "$columns"
load_queries "data-W047498-051825/Olympia_WA_PD__Organization_Audit_2025-06-01_2025-06-04.csv"  org_queries "$columns"

psql $db <<EOF
update $schema.org_queries set agency='Olympia WA PD';
EOF
