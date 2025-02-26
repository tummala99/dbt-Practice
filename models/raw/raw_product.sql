
{{
    config(
        materialized='table'
    )
}}
--select * from raw.globalmart.product
select * from {{ source('globalmart', 'product') }}