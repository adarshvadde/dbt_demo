{% macro copy_dealer() %}

{% set sql %}
COPY INTO mkmotors_dev.staging.stg_dealership
FROM @mkmotors_dev.staging.s3dealers
FILE_FORMAT = (
    FORMAT_NAME = mkmotors_dev.staging.ff_csv_hdr
);
{% endset %}

{% do run_query(sql) %}

{% endmacro %}