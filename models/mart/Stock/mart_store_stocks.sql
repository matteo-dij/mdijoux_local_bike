select 
    
    store_id,
    store_name,	
    product_name,	
    brand_name,
    category_name,	
    model_year,	
    sum(stock_quantity) as total_stock_quantity,
    sum(stock_value) as total_stock_value


from {{ ref('int_products_stocks') }}

group by 
    store_id, 
    store_name,	
    product_name,	
    brand_name,
    category_name,	
    model_year
    model_year