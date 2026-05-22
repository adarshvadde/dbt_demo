{{ config(materialized='ephemeral') }}


WITH supplier_parts AS (
    SELECT 
        ss.supplier_id,
        ss.supplier_name AS supplier_name,
        ss.nation_id,
        ss.account_balance,
        sp.available_quantity,
        sp.supplycost,
        p.part_id,
        p.name AS part_name,
        p.manufacturer AS part_manufacturer,
        p.brand AS part_brand,
        p.type AS part_type,
        p.size AS part_size,
        p.container AS part_container,
        p.retail_price AS part_retail_price
    FROM {{ ref('stg_suppliers') }} AS ss
    INNER JOIN {{ ref('stg_partsups') }} AS sp 
        ON ss.supplier_id = sp.supplier_id
    INNER JOIN {{ ref('stg_parts') }} AS p 
        ON sp.part_id = p.part_id
)

SELECT 
    supplier_id AS supplier_key,
    supplier_name,
    nation_id,
    account_balance,
    available_quantity,
    supplycost,
    part_id AS part_key,
    part_name,
    part_manufacturer,
    part_brand,
    part_type,
    part_size,
    part_container,
    part_retail_price
FROM supplier_parts
