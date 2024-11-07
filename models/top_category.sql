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

category_sales AS (
    SELECT
        dp.category,
        SUM(fs.line_total) AS total_category_sales
    FROM fact_sales AS fs
    JOIN {{ ref('dim_products') }} AS dp ON fs.product_id = dp.product_id
    GROUP BY dp.category
),

top_category AS (
    SELECT
        cs.category,
        cs.total_category_sales,
        RANK() OVER (ORDER BY cs.total_category_sales DESC) AS category_rank
    FROM category_sales AS cs
)

SELECT * FROM top_category