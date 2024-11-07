SELECT
  od.order_id,
  o.order_date,
  od.product_id,
  od.quantity,
  od.unit_price,
  od.line_total,
  o.customer_id
FROM "jaffle_shop"."main"."stg_order_details" AS od
JOIN "jaffle_shop"."main"."stg_orders" AS o ON od.order_id = o.order_id