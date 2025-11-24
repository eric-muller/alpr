. 00_common.sh


columns1="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time)"
columns2="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time, search_type, text_prompt, moderation)"
columns3="(name, agency, nets, devs, time_frame, license_plate, case_number, filters, reason, search_time, search_type)"

columns10="(name, agency, nets, devs, time_frame, license_plate, reason, case_number, filters, search_time, search_type, text_prompt, moderation)"


load_queries "data/3_1_2024-3_31_2024-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries "$columns10"
load_queries "data/4_1_2024-4_30_2024-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"
load_queries "data/5_1_2024-5_31_2024-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"
load_queries "data/Santa Clara County CA SO_Network_Audit_6_1_2024_7_1_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_7_2_2024_8_1_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_8_2_2024_9_1_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_9_2_2024_10_2_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_10_3_2024_11_2_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_11_3_2024_12_3_2024_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/Santa Clara County CA SO_Network_Audit_12_4_2024_1_3_2025_Redacted.xlsx" net_queries  "$columns3"
load_queries "data/processed/Santa Clara County CA SO_Network_Audit_1_20_2025_2_19_2025_Redacted.xlsx" net_queries "$columns1"
load_queries "data/processed/Santa Clara County CA SO_Network_Audit_2_20_2025_3_22_2025_Redacted.xlsx" net_queries "$columns1"
load_queries "data/processed/Santa Clara County CA SO_Network_Audit_3_23_2025_4_22_2025_Redacted.xlsx" net_queries "$columns1"
load_queries "data/processed/Santa Clara County CA SO_Network_Audit_4_23_2025_5_23_2025_Redacted.xlsx" net_queries "$columns1"
load_queries "data/processed/Santa Clara County CA SO_Network_Audit_5_24_2025_6_5_2025_Redacted.xlsx" net_queries "$columns1"
load_queries "data/Santa Clara County CA SO_Network_Audit_6_6_2025_6_23_2025_Redacted.xlsx" net_queries  "$columns2"
load_queries "data/6_24_2025-6_30_2025-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"
load_queries "data/7_1_2025-7_31_2025-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"
load_queries "data/8_1_2025-8_31_2025-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"
load_queries "data/9_1_2025-9_15_2025-Santa Clara County CA SO-Network-Audit_Redacted.xlsx" net_queries  "$columns10"


columns4="(name, agency, nets, devs, time_frame, license_plate, reason, case_number, filters, search_time, search_type, text_prompt, moderation)"
columns5="(name, nets, time_frame, license_plate, case_number, filters, reason, search_time, search_type)"
columns6="(name, nets, time_frame, license_plate, case_number, filters, reason, search_time)"
columns7="(name, nets, time_frame, license_plate, case_number, filters, reason, search_time, search_type, text_prompt, moderation)"

load_queries "data/3_1_2024-3_31_2024-Santa Clara County CA SO-Audit_Redacted.xlsx" org_queries "$columns4"
load_queries "data/4_1_2024-4_30_2024-Santa Clara County CA SO-Audit_Redacted.xlsx" org_queries "$columns4"
load_queries "data/5_1_2024-5_31_2024-Santa Clara County CA SO-Audit_ Redacted.xlsx" org_queries "$columns4"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-06-01_2024-07-01_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-07-02_2024-07-31_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-08-01_2024-08-31_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-09-01_2024-10-01_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-10-02_2024-11-01_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-11-02_2024-12-02_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2024-12-03_2025-01-02_Redacted.xlsx" org_queries "$columns5"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2025-01-03_2025-01-19_Redacted.xlsx" org_queries "$columns5"
load_queries "data/processed/Santa Clara County CA SO_Organization_Audit_2025-01-20_2025-02-19_Redacted.xlsx" org_queries "$columns6"
load_queries "data/processed/Santa Clara County CA SO_Organization_Audit_2025-02-20_2025-03-22_Redacted.xlsx" org_queries "$columns6"
load_queries "data/processed/Santa Clara County CA SO_Organization_Audit_2025-03-23_2025-04-22_Redacted.xlsx" org_queries "$columns6"
load_queries "data/processed/Santa Clara County CA SO_Organization_Audit_2025-04-23_2025-05-23_Redacted.xlsx" org_queries "$columns6"
load_queries "data/processed/Santa Clara County CA SO_Organization_Audit_2025-05-24_2025-06-05_Redacted.xlsx" org_queries "$columns6"
load_queries "data/Santa Clara County CA SO_Organization_Audit_2025-06-06_2025-06-23_Redacted.xlsx" org_queries "$columns7"
load_queries "data/6_24_2025-6_30_2025-Santa Clara County CA SO-Organization Audit_Redacted.xlsx" org_queries "$columns4"
load_queries "data/7_1_2025-7_31_2025-Santa Clara County CA SO-Organization Audit_Redacted.xlsx" org_queries "$columns4"
load_queries "data/8_1_2025-8_31_2025-Santa Clara County CA SO-Organization Audit_Redacted.xlsx" org_queries "$columns4"
load_queries "data/9_1_2025-9_15_2025-Santa Clara County CA SO-Organization Audit_Redacted.xlsx" org_queries "$columns4"

# some of the Organization files do not contain the agency

psql $db <<EOF
update $schema.org_queries set agency='$dataorg' where agency is null;
EOF

# reason and case_number have been redacted
# we have some spurious data from the OCR of pdfs.

psql $db <<EOF

update $schema.net_queries set reason = '';
update $schema.net_queries set case_number = '';

update $schema.org_queries set reason = '';
update $schema.org_queries set case_number = '';

EOF
