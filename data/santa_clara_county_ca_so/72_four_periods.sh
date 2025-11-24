. 00_common.sh

psql $db -c "
  select agency, count(*), min(search_time) as f, max(search_time) as l
  from $schema.net_queries
  where '2000-01-01' <= search_time and search_time < '2024-03-26'
  group by agency order by f
  " > reports/72_period_1.txt

psql $db -c "
  select agency, count(*), min(search_time) as f, max(search_time) as l
  from $schema.net_queries
  where '2024-03-26' <= search_time and search_time < '2024-05-08'
  group by agency order by f
  " > reports/72_period_2.txt

psql $db -c "
  select agency, count(*), min(search_time) as f, max(search_time) as l
  from $schema.net_queries
  where '2024-05-08' <= search_time and search_time < '2024-10-22'
  group by agency order by f
  " > reports/72_period_3.txt

psql $db -c "
  select agency, count(*), min(search_time) as f, max(search_time) as l
  from $schema.net_queries
  where '2024-10-22' <= search_time and search_time <= '2100-01-01'
  group by agency order by f
  " > reports/72_period_4.txt
