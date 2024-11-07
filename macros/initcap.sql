{% macro initcap(column_name) %}
CONCAT(UPPER(SUBSTRING(TRIM({{ column_name }}), 1, 1)), LOWER(SUBSTRING(TRIM({{ column_name }}), 2)))
{% endmacro %}