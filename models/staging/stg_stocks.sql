{{ config(materialized='view') }}

select

    store_id,
    product_id,
    quantity

from {{ source('local_bike', 'stocks') }}