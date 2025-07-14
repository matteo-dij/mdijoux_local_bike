{{ config(materialized='table') }}

with product as 
-- cte to select all product details (with brand and category names)
(
SELECT

    product_id,	
    product_name,	
    brand_name,	
    category_name,	
    model_year,	
    list_price,

 from {{ ref('stg_products') }}
left join {{ ref('stg_brands') }}
using(brand_id)
left join {{ ref('stg_brands') }}
using(category_id)
),
-- cte to select all store details
store as
(
select 
store_id,	
store_name
from {{ ref('stg_stores') }}
)

-- left join product and store to get all details for each stock. 
select 
    
    concat(store_id,product_id) as store_product_id,
    store_id,
    product_id,
    store_name,	
    product_name,	
    brand_name,
    category_name,	
    model_year,	
    list_price as product_unit_price,
    quantity as stock_quantity,
    list_price * quantity as stock_value


from {{ ref('stg_stocks') }}
left join product
using(product_id)
left join store 
using(store_id)





