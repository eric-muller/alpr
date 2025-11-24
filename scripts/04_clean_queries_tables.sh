. 00_common.sh

psql $db <<EOF

-- those columns are typically redacted, we don't need them

alter table $schema.org_queries drop column license_plate;
alter table $schema.net_queries drop column license_plate;


-- enforce constraints

alter table $schema.org_queries alter column search_time set not null;
alter table $schema.net_queries alter column search_time set not null;

alter table $schema.org_queries alter column agency set not null;
alter table $schema.net_queries alter column agency set not null;

-- normalize spaces in agency

update $schema.org_queries set agency = regexp_replace (trim (agency), E' +', ' ', 'g');
update $schema.net_queries set agency = regexp_replace (trim (agency), E' +', ' ', 'g');


-- At some point in August 2025, the Orange County Sheriff
-- changed from "OC Sheriff CA" to "Orange County SO CA".
-- Normalize to the latter.

update $schema.net_queries set agency = 'Orange County SO CA' where agency = 'OC Sheriff CA';

EOF
