SELECT
  CAST(supplier_id AS INTEGER) AS supplier_id,
  CAST(product_id AS INTEGER) AS product_id
FROM {{ ref('raw_supplier_products') }}