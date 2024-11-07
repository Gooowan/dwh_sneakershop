WITH fact_sales AS (
    SELECT
      od.order_id,
      o.order_date,
      od.product_id,
      od.quantity,
      od.unit_price,
      od.line_total,
      o.customer_id
    FROM {{ ref('stg_order_details') }} AS od
    JOIN {{ ref('stg_orders') }} AS o ON od.order_id = o.order_id
),

monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS sales_month,
        SUM(line_total) AS total_revenue,
        SUM(quantity) AS total_quantity_sold
    FROM {{ ref('fact_sales') }}
    GROUP BY sales_month
),

sales_growth AS (
    SELECT
        ms.sales_month,
        ms.total_revenue,
        ms.total_quantity_sold,
        LAG(ms.total_revenue) OVER (ORDER BY ms.sales_month) AS previous_revenue,
        LAG(ms.total_quantity_sold) OVER (ORDER BY ms.sales_month) AS previous_quantity
    FROM monthly_sales AS ms
),

growth_calculations AS (
    SELECT
        sg.sales_month,
        sg.total_revenue,
        sg.total_quantity_sold,
        ROUND(((sg.total_revenue - sg.previous_revenue) / sg.previous_revenue) * 100, 2) AS revenue_growth_percentage,
        ROUND(((sg.total_quantity_sold - sg.previous_quantity) / sg.previous_quantity) * 100, 2) AS quantity_growth_percentage
    FROM sales_growth AS sg
    WHERE sg.previous_revenue IS NOT NULL
)

SELECT * FROM growth_calculations
ORDER BY sales_month ASC