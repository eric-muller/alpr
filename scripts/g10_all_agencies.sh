psql alpr <<EOF

drop table if exists g.all_agencies;

create table g.all_agencies (agency text primary key);

select format ('insert into g.all_agencies'
               ' select distinct agency'
               ' from %I.net_queries'
               ' on conflict do nothing',
               schema)
from g.logs

\gexec

EOF
