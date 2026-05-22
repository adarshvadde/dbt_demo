SELECT
    sp.*,
    ascaqsp.average_available_quantity,
    ascaqsp.average_supply_cost
FROM {{ ref('int_supplier_parts') }} AS sp
LEFT JOIN {{ ref('average_cost') }} AS ascaqsp
    ON sp.part_key = ascaqsp.part_key
