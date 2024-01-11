with 
  pro as ( select * from {{ ref('stg_product') }}),
  sto as ( select * from {{ ref('stg_stock') }}),
final as(
  SELECT
    pro.productid,
    pro.productname,
    sto.stockonhand AS stock_quantity,
    CASE
        WHEN sto.stockonhand > 0 THEN 'Available'
        ELSE 'Not Available'
    END AS availability_status
FROM
   pro
left JOIN
    sto ON pro.productid = sto.productid
)
select * from final
