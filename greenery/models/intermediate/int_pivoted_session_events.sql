
{{
  config(
    materialized='table'
  )
}}

with pivoted_product_tbl as (
select
   {{ dbt_utils.pivot(
        'product_name', 
        dbt_utils.get_column_values(ref('int_product_quantity'), 'product_name'),
        then_value='total_quantity'
    ) }}
    from 
        {{ ref('int_product_quantity')}}
)
select * from pivoted_product_tbl
   

