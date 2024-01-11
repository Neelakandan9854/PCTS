with
    cus as (select * from {{ ref("stg_customer") }}),
    pro as ( select * from {{ ref('stg_product') }}),
    trans as ( select * from {{ ref('stg_transaction') }}),

    final as (
        select cus.customerid, 
        cus.firstname,
        cus.lastname,
        cus.email,
        cus.phone,
        pro.productid,
        pro.productname,
        trans.customerid as cus_id,
        trans.transactionid,
        trans.transactiondate,
        trans.totalamount
    from cus
    left JOIN trans ON cus.customerid  = trans.customerid
    left join pro on trans.productid = pro.productid

    )

select *
from final

