{{
  config(
    materialized='table'
  )
}}


    with unique_session as (
        select 
          p.product_guid
        , p.product_name
        ,   COUNT(distinct e.session_guid) AS total_unique_sessions
        from {{ ref('stg_postgres__events') }} e
        left join {{ ref('stg_postgres__products') }} p 
       on e.product_guid = p.product_guid
        WHERE p.product_guid IS NOT NULL
        group by 1, 2
    )
    , orders_tbl as (
        select 
            o.product_guid
        , p.product_name
        , count(o.order_guid)   as total_orders
        from {{ ref('stg_postgres__order_items') }} o
        left join {{ ref('stg_postgres__products') }} p
        on o.product_guid = p.product_guid 
        group by 1,2 
    )
    select
        us.product_guid
        , us.product_name
        , us.total_unique_sessions
        , ot.total_orders
        , ROUND(ot.total_orders / us.total_unique_sessions, 2) AS conversion_rate
    from unique_session us
    left join orders_tbl ot
    on us.product_guid = ot.product_guid
