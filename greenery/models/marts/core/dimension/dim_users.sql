{{
  config(
    materialized='table'
  )
}}


with user_specifics_tbl as (
    SELECT 
    u.first_name,
    u.last_name,
    u.email, 
    u.created_at_utc::DATE AS created_date_utc,
    a.country,
    CASE 
        WHEN a.country = 'United States' THEN 'local'
        ELSE 'international'
    END AS market_status,
    a.state,
    a.zipcode
from {{ ref('stg_postgres__users') }} u
left join {{ ref('stg_postgres__addresses') }} a
on u.address_guid = a.address_guid
)

select * from user_specifics_tbl