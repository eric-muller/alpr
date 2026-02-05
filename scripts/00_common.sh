# we don't really know what the last two orgs are, but
# the search_time do not match the other
# non-CA agencies.

db=alpr

outsideca="((
        agency !~ '.* CA .*'
   and  agency !~ '.* CA'
   and  agency !~ '.*-CA'
   and  agency !~ 'CA .*'
   and  agency !~ '.*\(CA\).*'
   and  agency !~ 'California .*'
   and  agency !~ 'Cal Fire'
   and  agency !~ 'Solano County Special Investigations Bureau'
   and  agency !~ 'Monterey County District Attorney.*'
   and  agency !~ 'Yuba County Sheriffs Office'
   and  agency !~ 'Blue Lake Rancheria Tribal PD'
   and  agency !~ 'NCRIC'
   and  agency !~ 'University of California, Berkeley')
 or agency = 'Western States Information Network (CA)'
 or agency = 'Loma Linda Healthcare System CA Veterans Affairs PD [Federal]')"


# some agencies made changes such that there are two different periods
# e.g Los Altos exiting Nationwide Lookup
# it is then useful to run queries both on the whole log
# and on the most recent period, after the change
#
# recent is either "no" (do not run most recent queries)
#    or the human-readable start of the recent period
#
# recent_queries and recent_cases are conditions to
#    used in the SQL statements. If there is no
#    recent period, they should be a date encompassing
#    all the data

recent="no"
recent_queries="search_time > '2010-01-11 00:00:00-07'"
recent_cases="first_"$recent_queries


# to print numbers with thousand separators

count_of="select to_char (count(*), 'fm999G999G999') as c"




function load_queries()
{
    file="$1"
    table=$2
    cols=$3
    header=${4:-^Name}

    temp_dir=../../temp
    rm -fr $temp_dir
    mkdir -p $temp_dir

    echo "=== loading $file"

    if [[ "$file" == *.xlsx ]]; then
        ssconvert -S -T Gnumeric_stf:stf_csv "$file" "$temp_dir/%n.csv"
    else
        cp "$file" "$temp_dir"
    fi

    if [[ "$cols" =~ "case_number" && "$cols" =~ "reason" ]] ; then
        force=", force_not_null (case_number, reason)"
    elif [[ "$cols" =~ "case_number" ]] ; then
        force=", force_not_null (case_number)"
    elif [[ "$cols" =~ "reason" ]] ; then
        force=", force_not_null (reason)"
    else
        force=""
    fi

    for f in "$temp_dir"/* ; do
        echo == $f
        cat "$f" | grep -v "$header" | sed 's/\r$//g' | grep -v '^$' |\
            psql $db -c "copy $schema.$table $cols from STDIN with (format csv $force)"
    done

    rm -fr "$temp_dir"

    psql $db <<EOF

-- spurious data
delete from $schema.$table where search_time is null;
EOF
}

function load_sharing()
{
    file="$1"
    columns="${2:-agency, shared_with_me, me_sharing}"

    temp_dir=../../temp
    rm -fr $temp_dir
    mkdir -p $temp_dir

    if [[ "$file" == *.xlsx ]]; then
        ssconvert -S -T Gnumeric_stf:stf_csv "$file" "$temp_dir/%n.csv"
    else
        cp "$file" "$temp_dir"
    fi

    for f in "$temp_dir"/* ; do
        echo == $f
        tail -n +2 "$f" |\
            psql $db -c "copy $schema.sharing ($columns) from STDIN with (format csv, force_not_null ($columns));"
    done

    rm -fr "$temp_dir"
}


function query()
{
    outfile="reports/$1"
    query="$2"

    psql $db > $outfile.count <<EOF
\pset numericlocale on
\pset footer off

$query \g (format=aligned) $outfile.txt

$query \g (format=html) $outfile.html.nbsp

select to_char (count(*), 'fm999G999G999') as count from ($query) as x \gset
\echo <span>:count</span>

EOF

    sed -e 's/&nbsp;//g' < $outfile.html.nbsp > $outfile.html
    rm $outfile.html.nbsp
}

function query_org_and_net ()
{
  query org.$1 "$( echo "$2" | sed -e 's/ORGNET/org/' )"
  query net.$1 "$( echo "$2" | sed -e 's/ORGNET/net/' )"
}

function query_org ()
{
  query org.$1 "$( echo "$2" | sed -e 's/ORGNET/org/' )"
}

function query_net ()
{
  query net.$1 "$( echo "$2" | sed -e 's/ORGNET/net/' )"
}
