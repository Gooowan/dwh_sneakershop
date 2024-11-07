
  
    
    

    create  table
      "jaffle_shop"."main"."dim_products__dbt_tmp"
  
    as (
      SELECT
  product_id,
  product_name,
  category,
  price,
  created_at AS product_created_date
FROM "jaffle_shop"."main"."stg_products"
    );
  
  