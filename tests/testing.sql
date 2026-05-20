select  * from {{ ref('int_partsuppliers_stats')}} 
where {{ compare('inventory_value_uro','inventory_value_usd')}} > 0.01