
  
    
    

    create  table
      "jaffle_shop"."main"."avg_order_value__dbt_tmp"
  
    as (
      WITH fact_sales AS (
    SELECT
      od.order_id,
      o.order_date,
      od.product_id,
      od.quantity,
      od.unit_price,
      od.line_total,
      o.customer_id
    FROM "jaffle_shop"."main"."stg_order_details" AS od
    JOIN "jaffle_shop"."main"."stg_orders" AS o ON od.order_id = o.order_id
),

customer_order_totals AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(line_total) AS total_spent
    FROM fact_sales
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) > 3
),

average_order_value AS (
    SELECT
        cot.customer_id,
        dc.first_name,
        dc.last_name,
        cot.total_orders,
        cot.total_spent,
        ROUND(cot.total_spent / cot.total_orders, 1) AS avg_order_value
    FROM customer_order_totals AS cot
    JOIN "jaffle_shop"."main"."dim_customers" AS dc ON cot.customer_id = dc.customer_id
)

SELECT * FROM average_order_value
ORDER BY avg_order_value DESC
    );
  
  