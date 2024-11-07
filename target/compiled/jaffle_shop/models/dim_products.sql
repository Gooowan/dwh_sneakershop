SELECT
  customer_id,
  first_name,
  last_name,
  email,
  created_at AS customer_created_date
FROM "jaffle_shop"."main"."stg_customers"