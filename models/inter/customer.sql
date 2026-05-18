WITH customers AS (
    SELECT 
        *
    FROM {{ ref('stg_customers') }}
),

nation_region AS (
    SELECT 
        n.nation_id,
        n.name AS nation_name,
        r.name AS region_name
    FROM {{ ref('stg_nations') }} n
    JOIN {{ ref('stg_regions') }} r 
        ON n.region_id = r.region_id
)

SELECT 
    c.* exclude(nation_id),
    nr.nation_name,
    nr.region_name
FROM customers c
JOIN nation_region nr 
    ON c.nation_id = nr.nation_id