with ctes_supplies as(
    select * from {{ source('src', 'suppliers')}}
)

select 
    S_SUPPKEY as supplier_id,
    S_NATIONKEY as nation_id,
  	S_NAME as supplier_name,
    S_ADDRESS as supplier_address,
    S_PHONE as  phone_number,
    S_COMMENT as comment,
    S_ACCTBAL as account_balance,
    UPDATED_TIME as updated_time
 from ctes_supplies