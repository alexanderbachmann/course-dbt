### Week 1: SQL Excercises
**Question 1: What is our repeat rate?**

**What is our overall conversion rate?**

<code>

with dst_events_orders_tbl as ( <br>
select <br>
    COUNT(distinct session_guid) as unique_session, <br>
    COUNT(distinct order_guid) as unique_order <br>
from dev_db.dbt_janio.stg_postgres__events <br>
) <br>
select <br>
    unique_order / unique_session as conversion_rate <br>
from dst_events_orders_tbl <br>

</code>

**Question 2: What is our conversion rate by product** <br>
Conversion Rate by Product: # of unique sessions with a purchase event of that product / total number of unique sessions that viewed that product


<code>
-- Unique sessions <br>
  with unique_session as ( <br>
        select <br>
          p.product_guid <br>
        , p.product_name <br>
        ,   COUNT(distinct e.session_guid) AS total_unique_sessions <br>
        from dev_db.dbt_janio.stg_postgres__events e <br>
        left join dev_db.dbt_janio.stg_postgres__products p  <br>
       on e.product_guid = p.product_guid <br>
        WHERE p.product_guid IS NOT NULL <br>
        group by 1, 2 <br>
    ) <br>
    -- Unique Orders Table <br>
     , orders_tbl as ( <br>
        select  <br>
            o.product_guid <br>
        , p.product_name <br>
        , count(o.order_guid)   as total_orders <br>
        from dev_db.dbt_janio.stg_postgres__order_items o <br>
        left join dev_db.dbt_janio.stg_postgres__products p <br>
        on o.product_guid = p.product_guid  <br>
        group by 1,2 <br>
    ) <br>
    select <br>
        us.product_guid <br>
        , us.product_name <br>
        , us.total_unique_sessions <br>
        , ot.total_orders <br>
        , ROUND(ot.total_orders / us.total_unique_sessions, 2) AS conversion_rate <br>
    from unique_session us <br>
    left join orders_tbl ot <br>
    on us.product_guid = ot.product_guid


</code>