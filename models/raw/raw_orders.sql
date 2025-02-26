{{
    config(
        materialized='table'
    )
}}

--select * from raw.globalmart.orders
select * from {{ source('globalmart', 'orders') }}