SELECT
  CAST(supplier_id AS INTEGER) AS supplier_id,
  CONCAT(UPPER(SUBSTRING(TRIM(supplier_name), 1, 1)), LOWER(SUBSTRING(TRIM(supplier_name), 2))) AS supplier_name,
  LOWER(TRIM(contact_email)) AS contact_email,
  TRIM(phone_number) AS phone_number
FROM {{ ref('raw_suppliers') }}