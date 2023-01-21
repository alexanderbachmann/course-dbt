{{
  config(
    materialized='table'
  )
}}

-- Overall conversion rate table
with dst_events_orders_tbl as (
select
      COUNT(distinct session_guid) as unique_session
    , COUNT(distinct order_guid) as unique_order
from {{ ref('stg_postgres__events')}}
)
select
    unique_order / unique_session as conversion_rate
from dst_events_orders_tbl