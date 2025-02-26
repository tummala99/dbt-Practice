with 
orders as (
    select * from {{ ref('raw_orders') }}
)

SELECT orderid
     , sum(ordersellingprice) as total_sp
  FROM orders
 GROUP BY orderid
 having total_sp < 0
