. 00_common.sh

columns="(agency, nets, devs, search_time, search_type, reason)"

load_queries "data-145/Denver_ALPR_Network_Searches_1.csv" net_queries "$columns" "^Org Name"
load_queries "data-145/Denver_ALPR_Network_Searches_2.csv" net_queries "$columns" "^Org Name"
load_queries "data-145/Denver_ALPR_Network_Searches_3.csv" net_queries "$columns" "^Org Name"
load_queries "data-145/Denver_ALPR_Network_Searches_4.csv" net_queries "$columns" "^Org Name"

# it seems that those entries are a subset of the previous set
# but it is unclear how that subset is defined
# it does not seem to be by time nor by types of agencies

#load_queries "data-145/01_Requested_Organization_Logs.xlsx" net_queries "$columns" '^"ORG NAME'
#load_queries "data-145/02_Requested_Organization_Logs.xlsx" net_queries "$columns" '^"ORG NAME'
