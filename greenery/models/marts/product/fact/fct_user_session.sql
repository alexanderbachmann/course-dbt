{{
  config(
    materialized='table'
  )
}}


with session_events_agg as (
    select 
        *
    from {{ref('int_session_events_agg')}}
)
, users as (
    select * from {{ref('stg_postgres__users')}}
)
select
    session_events_agg.session_guid
    , session_events_agg.user_guid
    , users.first_name
    , users.last_name
    , users.email
    , session_events_agg.page_view
    , session_events_agg.checkout
    , session_events_agg.add_to_cart
    , session_events_agg.package_shipped
    , session_events_agg.first_session_event_at_utc
    , session_events_agg.last_session_event_at_utc
    , datediff('minute', first_session_event_at_utc, last_session_event_at_utc) as session_length_minutes
from session_events_agg
left join users
on session_events_agg.user_guid = users.user_guid
