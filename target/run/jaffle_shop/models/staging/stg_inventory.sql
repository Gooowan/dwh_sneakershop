
  
  create view "jaffle_shop"."main"."stg_inventory__dbt_tmp" as (
    SELECT
  CAST(product_id AS INTEGER) AS product_id,
  CAST(quantity AS INTEGER) AS quantity,
  CAST(last_updated AS TIMESTAMP) AS last_updated
FROM "jaffle_shop"."main"."raw_inventory"
  );
