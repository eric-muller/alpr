. ../../scripts/00_common.sh

schema="lakewood_wa_pd"
dataorg='Lakewood WA PD'
dataorg_short='LPD'

recent="no"
recent_queries="search_time > '2025-02-12 00:00:00-07'"
recent_cases="first_"$recent_queries
