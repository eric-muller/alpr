. 00_common.sh


columns="(name, agency, nets, devs, time_frame, license_plate, reason, case_number, filters, search_time, search_type, text_prompt, moderation)"


load_queries "data-25-513/REDACTED-12_1_2024-12_31_2024-Lakewood WA PD-Network-Audit .csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 1_1_2025-1_31_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 2_1_2025-2_28_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 3_1_2025-3_31_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 4_1_2025-4_30_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 5_1_2025-5_31_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 6_1_2025-6_30_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 7_1_2025-7_31_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
load_queries "data-25-513/REDACTED - 8_1_2025-8_14_2025-Lakewood WA PD-Network-Audit.csv"  net_queries  "$columns"
