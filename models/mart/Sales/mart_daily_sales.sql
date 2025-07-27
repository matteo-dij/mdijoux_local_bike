
with order_item as (
select 
order_item_id,
order_id,
item_id,
product_id,
quantity,
list_price,
discount,

from {{ ref('stg_order_items') }}

),
product as
(
  SELECT

    product_id,
    product_name,
    brand_name,
    category_name,
    model_year,
    list_price,

  FROM {{ ref('int_products') }}

),
orders as (
select 

order_id,
customer_id,
order_status,
order_date,
required_date,
shipped_date,
store_id,
staff_id

from {{ ref('stg_orders') }}
)

select 


order_item_id,
customer_id,
order_date,
order_id,
item_id,
product_id,
category_name,
brand_name,
product_name,
quantity,
order_item.list_price as product_price,
discount,
round(quantity * order_item.list_price * (1-discount),2) as sold_price,
required_date,
shipped_date,
store_id,
staff_id





from order_item
left join orders 
using (order_id)
left join product 
using (product_id)




