with
    source as (select * from {{ source("public", "Transaction") }})

select *from source