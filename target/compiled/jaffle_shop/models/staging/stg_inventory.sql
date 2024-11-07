SELECT
  CAST(product_id AS INTEGER) AS product_id,
  CAST(quantity AS INTEGER) AS quantity,
  CAST(last_updated AS TIMESTAMP) AS last_updated
FROM "jaffle_shop"."main"."raw_inventory"