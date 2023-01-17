{{
  config(
    materialized='table'
  )
}}

with specific_product_tbl as (
select 
    p.product_guid,
    p.product_name,
    p.product_price,
    p.inventory,
    e.event_type,
    oi.order_guid,
    oi.quantity 
from {{ ref('stg_postgres__products') }} p
left join {{ ref('stg_postgres__order_items') }} oi
on p.product_guid = oi.product_guid
left join {{ ref('stg_postgres__events') }} e
on oi.product_guid = e.product_guid
)
select * from specific_product_tbl