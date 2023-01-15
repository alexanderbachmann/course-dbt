{{
  config(
    materialized='table'
  )
}}

with user_quantity_tbl as (
    select 
      o.user_guid,
      SUM(i.quantity)
    from {{ ref('stg_postgres__orders') }} o
    left join {{ ref('stg_postgres__order_items')}} i
    on o.order_guid = i.order_guid
    group by 1
)
select * from user_quantity_tbl