select 
	ORDER_ID,
	CUSTOMER_ID,
	COMMENT,
	CLERK_NAME,
	TOTAL_PRICE,
    {{ uro_mac('TOTAL_PRICE') }} as TOTAL_PRICE_uro,
	STATUS_CODE,
	PRIORITY_CODE,
	SHIP_PRIORITY,
	ORDER_DATE 
    from  {{ ref('stg_orders')}}
  
