{{ config(materialized='table') }}

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
left join {{ ref('stg_categories') }}
using(category_id)