with source as (
    select * from {{ source('my_dbt_db', 'raw_orders') }}
),
renamed as (
    select
        id as order_id,
        name as order_name
    from source
)
select * from renamed

version: 2

models:
    - name: stg_orders
      columns:
        - name: order_id
          tests:
            - not_null
            - unique
        - name: order_name
          tests:
            - not_null



