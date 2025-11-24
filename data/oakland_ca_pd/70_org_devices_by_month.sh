. 00_common.sh

# the number of cameras is redacted in the org queries, so
# we use the net queries instead

query org.devices_by_month "
  select month,
    count (distinct agency) as \"agencies\",
    max (devs) as \"max cameras\",
    100 * count (devs) FILTER (WHERE                   devs <   100) / greatest (1, count (devs)) as \"% 0-100\",
    100 * count (devs) FILTER (WHERE   100 <= devs and devs <  1000) / greatest (1, count (devs)) as \"% 100-1k\",
    100 * count (devs) FILTER (WHERE  1000 <= devs and devs < 10000) / greatest (1, count (devs)) as \"% 1k-10k\",
    100 * count (devs) FILTER (WHERE 10000 <= devs                 ) / greatest (1, count (devs)) as \"% 10k+\"

  from (
     select concat (extract (year from search_time),
                    '-',
                    right (concat ('00', extract (month from search_time)), 2)) as month,
            devs,
            nets,
            agency
     from $schema.net_queries
     where agency = '$dataorg' ) as foo
  group by month
  order by month
  "

#          percentile_disc (0.5) within group (order by devs) as median,
