{{
  config(
    materialized='table'
  )
}}


with raw_product_tbl as (

select 
    p.product_guid,
    p.product_name,
    p.product_price,
    CASE 
        WHEN o.promo_description IS NULL THEN 'no promo'
        ELSE o.promo_description
    END AS promo_description
from {{ ref('stg_postgres__products') }} p
left join {{ ref('stg_postgres__order_items') }} oi
on p.product_guid = oi.product_guid
left join {{ ref('stg_postgres__orders') }} o
on oi.order_guid = o.order_guid
)
select * from raw_product_tbl