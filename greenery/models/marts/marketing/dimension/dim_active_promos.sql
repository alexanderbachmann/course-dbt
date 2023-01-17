{{
  config(
    materialized='table'
  )
}}


with raw_promos_tbl as (

    select 
        promo_description,
        discount
    from {{ ref('stg_postgres__promos')}}
    where status = 'active'
)
select * from raw_promos_tbl