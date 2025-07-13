{{ config(materialized='view') }}

select
    brand_id,
    brand_name

from {{ source('local_bike', 'brands') }}