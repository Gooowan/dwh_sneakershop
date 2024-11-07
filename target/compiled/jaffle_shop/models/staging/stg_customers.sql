SELECT
  
  TRY_CAST(customer_id AS INTEGER)
 AS customer_id,
  
CONCAT(UPPER(SUBSTRING(TRIM(first_name), 1, 1)), LOWER(SUBSTRING(TRIM(first_name), 2)))
 AS first_name,
  
CONCAT(UPPER(SUBSTRING(TRIM(last_name), 1, 1)), LOWER(SUBSTRING(TRIM(last_name), 2)))
 AS last_name,
  LOWER(TRIM(email)) AS email,
  
  TRY_CAST(created_at AS TIMESTAMP)
 AS created_at
FROM "jaffle_shop"."main"."raw_customers"