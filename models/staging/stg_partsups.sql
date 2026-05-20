with ctes_partsups as(
select * from {{ source('src', 'PARTSUPPS')}}
)
select 
   PS_PARTKEY as  part_id,
   PS_SUPPKEY as  supplier_id,
   PS_COMMENT as  comment,
   PS_AVAILQTY as available_quantity,
   PS_SUPPLYCOST AS SUPPLYCOST
 from ctes_partsups