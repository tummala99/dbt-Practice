select customerid
     , customername
     , segment
     , country
     , sum(orderprofit) as profit
  from {{ ref('stage_orders') }}
 group by customerid
        , customername
        , segment
        , country   