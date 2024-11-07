SELECT
  customer_id,
  first_name,
  last_name,
  email,
  created_at AS customer_created_date
FROM {{ ref('stg_customers') }}