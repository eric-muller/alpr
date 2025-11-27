psql alpr <<EOF
drop view if exists g.ca_logs;

drop table if exists g.logs;

create table g.logs (schema text not null,
                     state text not null,
                     agency text not null);

insert into g.logs (schema, state, agency) values

('danville_il_pd',           'IL', 'Danville IL PD'),
('denver_co_pd',             'CO', 'Denver CO PD'),
('fairfield_ca_pd',          'CA', 'Fairfield CA PD'),
('lakewood_wa_pd',           'WA', 'Lakewood WA PD'),
('los_altos_ca_pd',          'CA', 'Los Altos CA PD'),
('oakland_ca_pd',            'CA', 'Oakland CA PD'),
('olympia_wa_pd',            'WA', 'Olympia WA PD'),
('san_diego_ca_pd',          'CA', 'San Diego CA PD'),
('san_francisco_ca_pd',      'CA', 'San Francisco CA PD'),
('santa_clara_ca_pd',        'CA', 'Santa Clara CA PD'),
('santa_clara_county_ca_so', 'CA', 'Santa Clara County CA SO'),
('vacaville_ca_pd',          'CA', 'Vacaville CA PD');

create view g.ca_logs as select * from g.logs where state = 'CA';

EOF
