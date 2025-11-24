. ../../scripts/00_common.sh

schema='san_diego_ca_pd'
dataorg='San Diego CA PD'
dataorg_short='SDPD'

# the last non-SDPD query is 2024-01-17 09:10:53-08

recent="January 18, 2024"
recent_queries="search_time >= '2024-01-18 00:00:00-08'"
recent_cases="first_"$recent_queries
