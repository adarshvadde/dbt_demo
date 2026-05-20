{{ config(materialized='table') }}


select 
    sts.supplier_id,
    sts.supplier_name,
    pts.part_id,
    round(pts.available_quantity * pts.supplycost,2)  as inventory_value_usd,
    
    {{ uro_mac('pts.available_quantity * pts.supplycost', 2) }} as inventory_value_uro,
    
    pt.retail_price - pts.supplycost as unit_margin, 
    ((pt.retail_price - pts.supplycost) / pt.retail_price * 100)::numeric(4,2) as margin_per,
    
    case 
        when pts.available_quantity >= 8000 then 'HIGH'
        when pts.available_quantity >= 3000 then 'MEDIUM'
        else 'LOW'
    end as inventory_level,
    
    case 
        when sts.account_balance > 5000 then 'PREMIUM'
        when sts.account_balance <= 0 then 'RISK'
        when sts.account_balance <= 5000 then 'STANDARD'
    end as supplier_financial_health,
    
    case 
        when sts.phone_number is null or sts.supplier_address is null then false
        else true 
    end as data_status, 
    
    case 
        when pts.supplycost > pt.retail_price then false
        else true 
    end as margin_normal,
    
    current_timestamp() as updated_time,
    current_user() as user_name 
from {{ ref('stg_parts') }} pt 
join {{ ref('stg_partsups') }} pts on pts.part_id = pt.part_id 
join {{ ref('stg_suppliers') }} sts on sts.supplier_id = pts.supplier_id order by 1,3

