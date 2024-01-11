with product as (
    select * from {{ ref('stg_product')}}
),
customer as (
    select * from {{ ref('stg_customer')}}
),
transaction as (
    select * from {{ ref('stg_transaction')}}
),
customer_order_history_data as (
    select
        cr.CUSTOMERID ,
        cr.firstname,
        cr.lastname,
        pd.productid,
        pd.productname,
        pd.price,
        ts.quantity,
        ts.totalamount,
        ts.transactiondate
    from customer cr
    left join transaction ts using(customerid)
    left join product pd using (productid)
),
customer_purchase_data as(
    select
        CUSTOMERID,
        firstname,
        lastname,
        sum(quantity) as purchase_count,
        sum(totalamount) purchase_amount 
    from customer_order_history_data
    group by CUSTOMERID,firstname,lastname
)
select * from customer_purchase_data where purchase_amount is NOT NULL  order by purchase_amount desc