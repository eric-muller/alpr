. 00_common.sh

function execute()
{
    script="$1"
    shift

    echo ===== "$script"

    if [ -f "$script" ]; then
        sh "$script" "$@"
    else
        sh ../../scripts/"$script" "$@"
    fi
}


rm -fr reports
mkdir reports

echo "<span>$recent</span>" > reports/recent.html

echo "<span>${dataorg_short}</span>" > reports/dataorg_short.html

execute 01_create_database.sh

execute 02_create_queries_tables.sh

execute 03_load_queries.sh

execute 04_clean_queries_tables.sh

execute 05_create_sharing_table.sh

execute 06_load_sharing.sh

execute 07_clean_sharing_table.sh

execute 10_compare_network_and_org.sh

execute 11_construct_cases.sh

execute 12_load_neighbors.sh

execute 13_orgs.sh

execute 20_queries_and_cases.sh

execute 21_queries_by_hour_of_day.sh

execute 22_queries_by_month.sh

execute 23_cases_by_org.sh

execute 25_query_rate.sh

execute 26_first_and_last.sh

execute 30_devices_by_month.sh

execute 40_shares.sh

execute 50_keywords.sh

execute 51_statewide_sharing.sh

execute 54_users.sh

for f in 7[0-9]_*.sh ; do
    if [ -f "$f" ] ; then
        sh "$f" ;
    fi
done

execute 90_summary.sh
