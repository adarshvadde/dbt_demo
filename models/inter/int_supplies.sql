select
	SUPPLIER_ID 
	NATION_ID ,
	SUPPLIER_NAME,
	SUPPLIER_ADDRESS,
	PHONE_NUMBER,
	COMMENT ,
	ACCOUNT_BALANCE,
    {{ uro_mac('ACCOUNT_BALANCE')}} as ACCOUNT_BALANCE_uro,
	UPDATED_TIME 
 from  {{ ref('stg_suppliers') }} 
