
psql alpr <<EOF

\pset format csv

\o reports/70_el_cajon.csv
select to_char(search_time, 'YYYY-MM-DD hh:mm:ss') as time, devs as "El Cajon"
from los_altos_ca_pd.net_queries
where agency = 'El Cajon CA PD'
order by search_time;

\o reports/70_riverside_county_da.csv
select to_char(search_time, 'YYYY-MM-DD hh:mm:ss') as time, devs as "Riverside DA"
from los_altos_ca_pd.net_queries
where agency = 'Riverside County CA District Attorney'
order by search_time;

\o reports/70_vacaville.csv
select to_char(search_time, 'YYYY-MM-DD hh:mm:ss') as time, devs as "Vacaville"
from los_altos_ca_pd.net_queries
where agency = 'Vacaville CA PD'
order by search_time;

\o reports/70_others.csv
select to_char(search_time, 'YYYY-MM-DD hh:mm:ss') as time, devs as others
from los_altos_ca_pd.net_queries
where agency <> 'El Cajon CA PD'
  and agency <> 'Riverside County CA District Attorney'
  and agency <> 'Vacaville CA PD'
order by search_time;

EOF


gnuplot <<EOF
set term png size 1200,800
set output "reports/70_devs.png"

set datafile separator comma
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'

set style data dots

set xtics rotate by -90
set xtics autofreq timedate
set xtics format '%Y-%m'

set xrange noextend

set key top left autotitle columnhead

set mouse mouseformat 6

plot "reports/70_others.csv"     using 1:2 with point pointtype 7 linecolor rgb "#03d626",\
     "reports/70_el_cajon.csv"   using 1:2 with point pointtype 7 linecolor rgb "#ff8000",\
     "reports/70_riverside_county_da.csv"  using 1:2 with point pointtype 7 linecolor rgb "#1c70e0",\
     "reports/70_vacaville.csv"    using 1:2 with point pointtype 7 linecolor rgb "#d67ccd"

EOF

cp reports/70_devs.png ../../efele.net/summaries/los_altos_ca_pd_70_devs.png



# the two blobs at the top

psql alpr <<EOF
select min (search_time) from los_altos_ca_pd.net_queries where devs > 60000;

select max (search_time) from los_altos_ca_pd.net_queries where devs > 65000;

select max (search_time) from los_altos_ca_pd.net_queries where devs > 70000 and devs < 75000;

select max (search_time) from los_altos_ca_pd.net_queries where devs > 70000 and devs < 75000;

select distinct agency from los_altos_ca_pd.net_queries  where search_time > '2025-02-12' and devs > 65000;

EOF
