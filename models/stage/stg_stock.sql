with
    source as (select * from {{ source("public", "Stock") }})

select *from source