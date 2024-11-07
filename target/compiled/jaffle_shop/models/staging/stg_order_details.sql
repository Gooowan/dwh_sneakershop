SELECT
  CAST(order_id AS INTEGER) AS order_id,
  CAST(product_id AS INTEGER) AS product_id,
  CAST(quantity AS INTEGER) AS quantity,
  CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
  CAST(line_total AS DECIMAL(10,2)) AS line_total
FROM "jaffle_shop"."main"."raw_order_details"