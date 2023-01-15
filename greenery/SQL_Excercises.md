### Week 1: SQL Excercises
**Question 1: What is our repeat rate?**

**Repeat Rate = Users who purchased 2 or more items / total users who purchased**


Our **repeat rate is 0.798**.

Query:

<code>
WITH orders_users_tbl AS ( <br>
SELECT  <br>
    USER_GUID, <br>
    COUNT(ORDER_GUID) AS total_orders <br>
FROM dev_db.dbt_janio.stg_postgres__orders <br>
GROUP BY 1 <br>
),<br>
prep_tbl AS (<br>
    SELECT <br>
    total_orders, <br>
    COUNT(user_guid) as cnt_users <br>
FROM orders_users_tbl <br>
GROUP BY 1 <br>
ORDER BY 1 <br>
 ),<br>
 aggregation_tbl AS (<br>
SELECT <br>
    SUM(CASE WHEN total_orders > 1 THEN cnt_users ELSE 0 END) AS repeated_users,<br>
    SUM(cnt_users) AS total_users <br>
 FROM prep_tbl <br>
 ) <br>
 SELECT <br>
   round(repeated_users / total_users, 3)  AS repeated_rate <br>
FROM aggregation_tbl; <br>
</code>

