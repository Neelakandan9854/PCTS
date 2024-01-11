with 
  sto as ( select * from {{ ref('stg_stock') }}),
  pro as (select * from {{ ref('stg_product') }}),


  final as (
    select 
    sto.productid as stockid,
    sto.stockonhand,
    sto.reorderlevel,
    pro.productid
    from sto
    inner join pro on sto.productid = pro.productid
  )

  select * from final