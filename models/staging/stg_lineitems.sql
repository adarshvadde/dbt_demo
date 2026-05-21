with ctes_lineitems as(
    select * from {{ source('src','lineitems') }}
)
select 
	L_ORDERKEY as order_id,
	L_PARTKEY as part_id,
	L_SUPPKEY as supplier_id,
	L_LINENUMBER as line_number,
	L_COMMENT as comment,
	L_SHIPMODE as ship_mode,
	L_SHIPINSTRUCT as ship_instructions,
	L_QUANTITY as quantity,
	L_EXTENDEDPRICE as extended_price,
	L_DISCOUNT as discount_percentage,
	L_TAX as tax_rate,
	L_LINESTATUS as status_code,
	L_RETURNFLAG as return_flag,
	L_SHIPDATE as ship_date,
	L_COMMITDATE as commit_date,
	L_RECEIPTDATE as receipt_date

from ctes_lineitems