SELECT
  {{ safe_cast('customer_id', 'INTEGER') }} AS customer_id,
  {{ initcap('first_name') }} AS first_name,
  {{ initcap('last_name') }} AS last_name,
  LOWER(TRIM(email)) AS email,
  {{ safe_cast('created_at', 'TIMESTAMP') }} AS created_at
FROM {{ ref('raw_customers') }}