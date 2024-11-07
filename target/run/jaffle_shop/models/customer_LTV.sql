
  
    
    

    create  table
      "jaffle_shop"."main"."customer_LTV__dbt_tmp"
  
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

customer_revenue AS (
    SELECT
        fs.customer_id,
        SUM(fs.line_total) AS total_revenue,
        MIN(fs.order_date) AS first_purchase_date,
        MAX(fs.order_date) AS last_purchase_date,
        COUNT(DISTINCT fs.order_id) AS total_orders
    FROM fact_sales AS fs
    GROUP BY fs.customer_id
),

customer_ltv AS (
    SELECT
        cr.customer_id,
        dc.first_name,
        dc.last_name,
        cr.total_revenue,
        cr.total_orders,
        DATE_PART('day', cr.last_purchase_date - cr.first_purchase_date) AS customer_lifespan_days,
        ROUND(cr.total_revenue / NULLIF(cr.total_orders, 0), 2) AS avg_order_value,
        ROUND(cr.total_revenue / NULLIF(DATE_PART('day', CURRENT_DATE - cr.first_purchase_date) / 30, 0), 2) AS monthly_ltv
    FROM customer_revenue AS cr
    JOIN "jaffle_shop"."main"."dim_customers" AS dc ON cr.customer_id = dc.customer_id
)

SELECT * FROM customer_ltv
ORDER BY total_revenue DESC
    );
  
  