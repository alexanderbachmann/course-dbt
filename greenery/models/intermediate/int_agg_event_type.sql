{{
  config(
    materialized='table'
  )
}}

-- aggregating event types per session model
select 
    session_guid
    , COUNT(event_type) AS total_event_session 
from {{ ref('stg_postgres__events')}}
{{ dbt_utils.group_by(1) }} -- macro from the dbt utils package