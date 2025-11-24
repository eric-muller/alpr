. 00_common.sh

columns="(name, agency, nets, devs, time_frame, case_number, reason, search_time)"

load_queries data-181213/rDan_Network_Audit_1.csv          net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_10.csv         net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_11.csv         net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_12.csv         net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_2.csv          net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_6_XqJtjD0.csv  net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_6.csv          net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_7.csv          net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_8_urTxeGE.csv  net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_8_uUOxY3q.csv  net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_8.csv          net_queries "$columns"
load_queries data-181213/rDan_Network_Audit_9.csv          net_queries "$columns"

columns="(name, nets, time_frame, case_number, reason, search_time)"

load_queries data-181213/Muckrock_181213.xlsx org_queries "$columns"


psql $db <<EOF
update $schema.org_queries set agency='Danville CA PD';
EOF
