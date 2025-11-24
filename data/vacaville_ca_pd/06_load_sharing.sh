. 00_common.sh

f=data-p000388-100525/SharedNetworks_2025_October_6.csv

echo === loading $f

tail -n +2 $f |\
    psql $db -c "copy $schema.sharing from STDIN with (format csv, force_not_null (agency, shared_with_me, me_sharing));"
