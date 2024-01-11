with 
  product as ( select * from {{ ref('stg_product') }}),

  final as (
    select 
    productid,
    productname,
    category,
    price,
    stockquantity
    from product 
  )

  select * from final