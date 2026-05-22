{{ config(

    pre_hook = "
        copy into mkmotors_dev.staging.STG_DEALERSHIP from @mkmotors_dev.staging.S3DEALERS/dealership.dat FILE_FORMAT=(FORMAT_NAME=mkmotors_dev.staging.ff_csv_nohdr_dq ERROR_ON_COLUMN_COUNT_MISMATCH=false)
;
    ",

    post_hook = [
    "
        update mkmotors_dev.staging.stg_dealership
        set updated_date = current_timestamp()
    "]

) }}

select * from mkmotors_dev.staging.stg_dealership