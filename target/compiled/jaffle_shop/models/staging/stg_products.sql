SELECT
  
  TRY_CAST(product_id AS INTEGER)
 AS product_id,
  
CONCAT(UPPER(SUBSTRING(TRIM(product_name), 1, 1)), LOWER(SUBSTRING(TRIM(product_name), 2)))
 AS product_name,
  
CONCAT(UPPER(SUBSTRING(TRIM(category), 1, 1)), LOWER(SUBSTRING(TRIM(category), 2)))
 AS category,
  
  TRY_CAST(price AS DECIMAL(10,2))
 AS price,
  
  TRY_CAST(created_at AS TIMESTAMP)
 AS created_at
FROM "jaffle_shop"."main"."raw_products"