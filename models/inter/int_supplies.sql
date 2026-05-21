select 
    stg_sup.SUPPLIER_ID,
    stg_sup.NATION_ID, 
    supnames.sname as supplier_name, 
    stg_sup.SUPPLIER_ADDRESS, 
    stg_sup.PHONE_NUMBER, 
    stg_sup.COMMENT, 
    stg_sup.ACCOUNT_BALANCE, 
    {{ uro_mac('ACCOUNT_BALANCE') }} as ACCOUNT_BALANCE_uro, 
    stg_sup.UPDATED_TIME 
from {{ ref('stg_suppliers') }} stg_sup 
left join {{ ref('supplier_names') }} supnames 
    on stg_sup.supplier_id = supnames.skey
