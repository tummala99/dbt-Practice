{%- set category = ["Furniture","Office","technology"] -%}

select orderid,
{% for category in category %}
      sum(case when category = '{{category}}' then orderprofit end) as {{category}}_orderprofit
{% if not loop.last %}, {%endif%}  
{%endfor%}    
  from {{ ref('stage_orders') }}
  group by 1