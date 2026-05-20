with cte_parts as(
    select * from {{ source('src','parts') }}
)
select 
    P_PARTKEY as    part_id,
    P_NAME as    name,
    P_TYPE as    type,
    P_SIZE as    size,
    P_MFGR as    manufacturer,
    P_BRAND as    brand,
    P_COMMENT as    comment,
    P_CONTAINER as    container,
	P_RETAILPRICE as	  retail_price
	--null as	  supplier_id,
    --null as    available_quantity,
    --null as    cost
from cte_parts