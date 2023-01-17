{{
  config(
    materialized='table'
  )
}}


with page_views_tbl as (
select
    user_guid,
    COUNT( distinct session_guid) as page_views
from {{ref('stg_postgres__events')}}
group by 1
)
select * from page_views_tbl



