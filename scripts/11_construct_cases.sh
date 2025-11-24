. 00_common.sh

for ORGNET in org net; do

psql $db > reports/${ORGNET}.queries.txt <<EOF

copy (select agency,
             reason,
             case_number,
             extract (epoch from search_time),
             search_time,
             devs,
             nets
      from $schema.${ORGNET}_queries
      order by agency, reason, case_number, search_time)
to STDOUT with (format csv);

EOF

gawk --csv '
  BEGIN { agency=""; }
  {  if (   $1 == agency && $2 == reason && $3 == case_number && (reason != ""  || case_number != "") && ($4 - case_number_start) < 10*24*3600) {
        last_search_time = $5;
        nb_queries++;
        if ($6 > devs) devs = $6;
        if ($7 > nets) nets = $7; }
     else {
        if (agency != "") {
             gsub (/"/, "\"\"", agency);
             gsub (/"/, "\"\"", reason);
             gsub (/"/, "\"\"", case_number);
             printf ("\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",%d,%d,%d\n",
                     agency, reason, case_number,
                     first_search_time, last_search_time, nb_queries, devs, nets); }
        agency = $1;
        reason = $2;
        case_number = $3;
        case_number_start = $4;
        first_search_time = $5;
        last_search_time = $5;
        nb_queries = 1;
        devs = $6;
        nets = $7; }}
   END {
        if (agency != "") {
             gsub (/"/, "\"\"", agency);
             gsub (/"/, "\"\"", reason);
             gsub (/"/, "\"\"", case_number);
             printf ("\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",%d,%d,%d\n",
                     agency, reason, case_number,
                     first_search_time, last_search_time, nb_queries, devs, nets); }}' \
  < reports/${ORGNET}.queries.txt > reports/${ORGNET}.cases.txt

psql $db <<EOF
drop table if exists $schema.${ORGNET}_cases;

create table $schema.${ORGNET}_cases
   (agency              text not null,
    reason              text not null default '',
    case_number         text not null default '',
    first_search_time   timestamp with time zone,
    last_search_time    timestamp with time zone,
    nb_queries          integer,
    devs                integer,
    nets                integer);
EOF

cat reports/${ORGNET}.cases.txt | psql $db -c "copy $schema.${ORGNET}_cases from STDIN with (format csv);"

#rm -f reports/${ORGNET}.queries.txt
#rm -f reports/${ORGNET}.cases.txt

done
