. ../../scripts/00_common.sh

schema='san_francisco_ca_pd'
dataorg='San Francisco CA PD'
dataorg_short='SFPD'

# the last non-CA query is 2025-02-11 09:34:26-08

recent="February 12, 2025"
recent_queries="search_time > '2025-02-12 00:00:00-08'"
recent_cases="first_"$recent_queries
