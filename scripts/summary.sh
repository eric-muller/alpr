function do_one () {
    echo ================= $1
    if [ -d $1 ]; then
        (cd $1 ; sh ../../scripts/90_summary.sh)
    else
        (cd data/$1; sh ../../scripts/90_summary.sh)
    fi
}



do_one lakewood_wa_pd

do_one fairfield_ca_pd
do_one los_altos_ca_pd
do_one oakland_ca_pd
do_one san_diego_ca_pd
do_one san_francisco_ca_pd
do_one santa_clara_county_ca_so
do_one santa_clara_ca_pd
do_one vacaville_ca_pd
