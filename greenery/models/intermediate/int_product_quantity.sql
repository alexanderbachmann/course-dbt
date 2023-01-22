{{
  config(
    materialized='table'
  )
}}

with product_quantity_tbl as (
    select 
        p.product_guid,
        p.product_name,
        p.product_price,
        p.inventory,
        SUM(i.quantity) AS total_quantity
    from {{ ref('stg_postgres__products') }} p
    left join {{ ref('stg_postgres__order_items')}} i
    on p.product_guid = i.product_guid
    {{ dbt_utils.group_by(4) }}
)

select * from product_quantity_tbl