{{
    config(
        materialized='table'
    )
}}

--select * from raw.globalmart.customer
select * from {{ source('globalmart', 'customer') }}