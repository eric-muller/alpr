. 00_common.sh

psql $db <<EOF
drop table if exists $schema.neighbors;

create table $schema.neighbors (agency text not null);

insert into $schema.neighbors (agency)
values

('Atherton CA PD'),
('Campbell CA PD'),
('East Palo Alto CA PD'),
('Los Altos CA PD'),
('Los Altos Hills - Town'),
('Los Gatos Monte Sereno PD - CA'),
('Menlo Park CA PD'),
('Mountain View CA PD (Santa Clara County)'),
('Palo Alto CA PD'),
('San Jose CA PD'),
('San Mateo County CA SO'),
('Santa Clara CA PD'),
('Santa Clara DA CA'),
('Santa Clara County CA SO'),
('Saratoga - City'),
('Stanford University CA PD'),
('Sunnyvale CA PD');

EOF
