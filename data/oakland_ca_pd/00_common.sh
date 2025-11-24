. ../../scripts/00_common.sh

schema='oakland_ca_pd'
dataorg='Oakland CA PD'
dataorg_short='OPD'

# the last non-CA query is 2024-10-21 13:18:13-07

recent="October 10, 2024"
recent_queries="search_time > '2024-10-22 00:00:00-07'"
recent_cases="first_"$recent_queries
