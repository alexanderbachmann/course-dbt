{{
  config(
    materialized='table'
  )
}}


with conversion_funnel_tbl as (
    select 
        sum(page_view + add_to_cart + checkout) * 100 as total_sessions,
        sum(page_view) as page_view,
        sum(add_to_cart) as add_to_cart,
        sum(checkout) as checkout
    from   {{ ref('int_session_events_agg')}} 
)
, final as (
    select 
        page_view / total_sessions * 100 as page_view_rate
        , add_to_cart / total_sessions * 100 as add_to_cart_rate
        , checkout / total_sessions * 100 as checkout_rate
    from conversion_funnel_tbl
)
select * from final