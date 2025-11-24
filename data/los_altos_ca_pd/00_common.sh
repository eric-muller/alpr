. ../../scripts/00_common.sh

schema="los_altos_ca_pd"
dataorg='Los Altos CA PD'
dataorg_short='LAPD'

# notable change is the end of sharing with
# non-CA agency. Last such query is 2025-02-11 09:23:45-08

recent="February 12, 2025"
recent_queries="search_time > '2025-02-12 00:00:00-07'"
recent_cases="first_"$recent_queries
