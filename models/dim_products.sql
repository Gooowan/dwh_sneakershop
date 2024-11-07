SELECT
  product_id,
  product_name,
  category,
  price,
  created_at AS product_created_date
FROM {{ ref('stg_products') }}