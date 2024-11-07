
  
    
    

    create  table
      "jaffle_shop"."main"."low_stock__dbt_tmp"
  
    as (
      WITH dim_products AS (
    SELECT
      product_id,
      product_name,
      category,
      price,
      created_at AS product_created_date
    FROM "jaffle_shop"."main"."stg_products"
),

inventory_status AS (
    SELECT
      i.product_id,
      p.product_name,
      i.quantity,
      i.last_updated
    FROM "jaffle_shop"."main"."stg_inventory" AS i
    JOIN "jaffle_shop"."main"."stg_products" AS p ON i.product_id = p.product_id
),

current_inventory AS (
    SELECT
        i.product_id,
        p.product_name,
        p.category,
        i.quantity,
        i.last_updated
    FROM inventory_status AS i
    JOIN dim_products AS p ON i.product_id = p.product_id
),

low_stock_products AS (
    SELECT
        ci.product_id,
        ci.product_name,
        ci.category,
        ci.quantity,
        ci.last_updated
    FROM current_inventory AS ci
    WHERE ci.quantity < 20
)

SELECT * FROM low_stock_products
ORDER BY quantity ASC
    );
  
  