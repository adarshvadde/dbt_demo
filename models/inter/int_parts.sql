select 
	PART_ID,
	NAME,
	TYPE,
	SIZE,
	MANUFACTURER,
	BRAND,
	COMMENT,
	CONTAINER,
	RETAIL_PRICE,
    {{ uro_mac('RETAIL_PRICE')}} as RETAIL_PRICE_uro
from  {{ ref('stg_parts') }} 
