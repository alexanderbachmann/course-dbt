{{
  config(
    materialized='table'
  )
}}


with user_product_tbl as (
select 
    u.user_guid,
    u.first_name,
    u.last_name,
    u.email,
    o.promo_description,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    case 
        when pr.discount is null THEN 0 
        else pr.discount / 100
    end as discount
from {{ ref('stg_postgres__users') }} u
left join {{ ref('stg_postgres__orders') }} o
on u.user_guid = o.user_guid
left join {{ ref('stg_postgres__promos') }} pr
on o.promo_description = pr.promo_description
),
discounted_products_tbl AS (
    select
        user_guid,
        first_name,
        last_name,
        email,
        promo_description,
        order_cost,
        shipping_cost,
        order_total,
        discount,
        case 
            when discount = 0 then order_total
            else order_total - (order_total * discount)
        end as discounted_order_total
        , {{ applying_discounts('discount', 'order_total') }} as final_order_total
    FROM user_product_tbl
)
SELECT * FROM discounted_products_tbl
