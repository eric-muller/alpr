function do_one () {
    echo ================= $1
    if [ -d $1 ]; then
        echo $1
        (cd $1 ; sh ../../scripts/98_full.sh)
    else
        echo data/$1
        (cd data/$1; sh ../../scripts/98_full.sh)
    fi
}


do_one danville_il_pd
do_one denver_co_pd
do_one lakewood_wa_pd
do_one olympia_wa_pd

do_one fairfield_ca_pd
do_one los_altos_ca_pd
do_one oakland_ca_pd
do_one san_diego_ca_pd
do_one san_francisco_ca_pd
do_one santa_clara_ca_pd
do_one santa_clara_county_ca_so
do_one vacaville_ca_pd
