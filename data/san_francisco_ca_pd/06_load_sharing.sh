. 00_common.sh

f=data-p222366-090425/SharedNetworks_FLOCK_SAFETY.csv

echo === loading $f

tail -n +2 $f |\
    psql $db -c "copy $schema.sharing from STDIN with (format csv, force_not_null (agency, shared_with_me, me_sharing));"
