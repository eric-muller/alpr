. ../../scripts/00_common.sh

schema='santa_clara_county_ca_so'
dataorg="Santa Clara County CA SO"
dataorg_short='SCCOS'

# the last non-org query is 2024-10-21 13:18:13-07

recent="October 22, 2024"
recent_queries="search_time > '2024-10-22 00:00:00-07'"
recent_cases="first_"$recent_queries
