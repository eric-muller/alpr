. 00_common.sh

psql $db <<EOF

drop table if exists ${schema}.net_queries;

create table ${schema}.net_queries
   (name          text,
    agency        text,
    nets          integer,
    devs          integer,
    time_frame    text,
    license_plate text,
    reason        text not null default '',
    case_number   text not null default '',
    filters       text,
    search_time   timestamp with time zone,
    search_type   text,
    text_prompt   text,
    moderation    text);

drop table if exists ${schema}.org_queries;

create table ${schema}.org_queries
   (name          text,
    agency        text,
    nets          integer,
    devs          integer,
    time_frame    text,
    license_plate text,
    reason        text not null default '',
    case_number   text not null default '',
    filters       text,
    search_time   timestamp with time zone,
    search_type   text,
    text_prompt   text,
    moderation    text);

EOF
