SELECT
  {{ safe_cast('product_id', 'INTEGER') }} AS product_id,
  {{ initcap('product_name') }} AS product_name,
  {{ initcap('category') }} AS category,
  {{ safe_cast('price', 'DECIMAL(10,2)') }} AS price,
  {{ safe_cast('created_at', 'TIMESTAMP') }} AS created_at
FROM {{ ref('raw_products') }}