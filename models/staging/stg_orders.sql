SELECT
  {{ safe_cast('order_id', 'INTEGER') }} AS order_id,
  {{ safe_cast('customer_id', 'INTEGER') }} AS customer_id,
  {{ safe_cast('order_date', 'TIMESTAMP') }} AS order_date,
  {{ safe_cast('total_amount', 'DECIMAL(10,2)') }} AS total_amount
FROM {{ ref('raw_orders') }}
