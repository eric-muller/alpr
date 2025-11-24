. 00_common.sh

f=data-25-886/SharedNetworks_2025_August_13.xlsx

echo === loading $f

csv_file=$(mktemp)

ssconvert -T Gnumeric_stf:stf_csv "$f" "$csv_file"

tail -n +2 "$csv_file" |\
    psql $db -c "copy $schema.sharing from STDIN with (format csv, force_not_null (agency, shared_with_me, me_sharing));"

rm -f "$csv_file"
