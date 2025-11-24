. 00_common.sh


columns="(name, agency, nets, devs, time_frame, license_plate, reason, case_number, filters, search_time, search_type, text_prompt, moderation)"


load_queries "data-p222366-090425/8-24_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/9-24_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/10-24_FAN_REDACTED.csv"      net_queries "$columns"
load_queries "data-p222366-090425/11-24_FAM_REDACTED.csv"      net_queries "$columns"
load_queries "data-p222366-090425/12-24_FAN_REDACTED.csv"      net_queries "$columns"
load_queries "data-p222366-090425/1-25_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/2-25_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/3-25_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/4-25_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/5-25_FAN_REDACTED.csv"       net_queries "$columns"
load_queries "data-p222366-090425/6-25_FAN_REDACTED_Jun2.csv"  net_queries "$columns"

load_queries "data-p222366-090425/8-24_FA_REDACTED.csv"        org_queries "$columns"
load_queries "data-p222366-090425/9-24_FA_REDACTED.csv"        org_queries "$columns"
load_queries "data-p222366-090425/10-24_FA_REDACTED.csv"       org_queries "$columns"
load_queries "data-p222366-090425/11-24_FA_REDACTED.csv"       org_queries "$columns"
load_queries "data-p222366-090425/12-24_REDACTED.csv"          org_queries "$columns"
load_queries "data-p222366-090425/1-25_REDACTED.csv"           org_queries "$columns"
load_queries "data-p222366-090425/2-25_REDACTED.csv"           org_queries "$columns"
load_queries "data-p222366-090425/3-25_FA_REDACTED.csv"        org_queries "$columns"
load_queries "data-p222366-090425/4-25_REDACTED.csv"           org_queries "$columns"
load_queries "data-p222366-090425/5-25_FA_REDACTED.csv"        org_queries "$columns"
load_queries "data-p222366-090425/6-25_FA_REDACTED_Jun2.csv"   org_queries "$columns"

psql $db <<EOF
--- all REDACTED
update $schema.org_queries set reason='';
update $schema.org_queries set case_number='';

update $schema.net_queries set reason='';
update $schema.net_queries set case_number='';

EOF
