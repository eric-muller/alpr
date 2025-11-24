. 00_common.sh

# normalize white space

psql $db <<EOF
update $schema.sharing set agency = regexp_replace (trim (agency), E' +', ' ', 'g');
update $schema.sharing set shared_with_me = regexp_replace (trim (shared_with_me), E' +', ' ', 'g');
update $schema.sharing set me_sharing = regexp_replace (trim (me_sharing), E' +', ' ', 'g');
EOF
