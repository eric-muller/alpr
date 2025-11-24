. 00_common.sh

f=data-25-189/'SharedNetworks Fairfield Police Department_2025_October_27.csv'

echo === loading $f

tail -n +2 "$f" |\
    psql $db -c "copy $schema.sharing from STDIN with (format csv, force_not_null (agency, shared_with_me, me_sharing));"
