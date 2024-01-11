with
    source as (select * from {{ source("public", "Product") }})

select *from source