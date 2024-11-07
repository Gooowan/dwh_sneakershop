
  
  create view "jaffle_shop"."main"."stg_orders__dbt_tmp" as (
    SELECT
  
  TRY_CAST(order_id AS INTEGER)
 AS order_id,
  
  TRY_CAST(customer_id AS INTEGER)
 AS customer_id,
  
  TRY_CAST(order_date AS TIMESTAMP)
 AS order_date,
  
  TRY_CAST(total_amount AS DECIMAL(10,2))
 AS total_amount
FROM "jaffle_shop"."main"."raw_orders"
  );
