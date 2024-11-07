
  
  create view "jaffle_shop"."main"."stg_supplier_products__dbt_tmp" as (
    SELECT
  CAST(supplier_id AS INTEGER) AS supplier_id,
  CAST(product_id AS INTEGER) AS product_id
FROM "jaffle_shop"."main"."raw_supplier_products"
  );
