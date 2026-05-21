{{ config(materialized='incremental',unique_key='ORDER_ID') }}

select 
    {{ dbt_utils.generate_surrogate_key(['ORDER_ID','customer_id'])}} as order_key,
	order_id, 
    order_date, 
    customer_id, 
    clerk_name, 
    total_price as total_price_usd, 
    {{ uro_mac('total_price')}} as total_price_uro,
    status_code,
    priority_code, 
    ship_priority, 
    comment, 
    upd_date

from  {{ ref('stg_orders')}}

{% if is_incremental is true %}
where upd_date>(select max(upd_date) from {{this}})
{% endif %}

  

