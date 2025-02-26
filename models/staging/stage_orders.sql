    select 
        {{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_order,
    -- from raw orders
       o.orderid
      , o.orderdate
      , o.shipdate
      , o.shipmode  
      , o.ordersellingprice 
      , o.ordercostprice    
      , o.ordersellingprice - o.ordercostprice AS orderprofit
     -- from raw customer
      , c.customerid
      , c.customername
      , c.segment
      , c.country
     -- from raw product
      , p.productid 
      , p.category
      , p.productname
      , p.subcategory
      , {{ markup('ordersellingprice','ordercostprice')}} as markup
      , d.delivery_team
   from {{ ref('raw_orders') }} as o 
   left join {{ ref('raw_customer') }} as c 
     on o.customerid = c.customerid
   left join {{ ref('raw_product') }} as p 
     on o.productid = p.productid
   left join {{ ref('delivery_team') }} d
     on o.shipmode = d.shipmode     
     
    --{{ limit_data_in_dev('shipdate')}}
