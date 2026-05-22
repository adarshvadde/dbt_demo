{{ config(materialized='ephemeral') }}

SELECT
    part_key,
    AVG(available_quantity) AS average_available_quantity,
    AVG(supplycost) AS average_supply_cost
FROM {{ ref('int_supplier_parts') }}
GROUP BY
    part_key
