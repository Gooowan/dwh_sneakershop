SELECT
  CAST(transaction_id AS INTEGER) AS transaction_id,
  CAST(product_id AS INTEGER) AS product_id,
  CAST(quantity_change AS INTEGER) AS quantity_change,
  CAST(transaction_date AS TIMESTAMP) AS transaction_date,
  CONCAT(UPPER(SUBSTRING(TRIM(reason), 1, 1)), LOWER(SUBSTRING(TRIM(reason), 2))) AS reason
FROM {{ ref('raw_inventory_transactions') }}