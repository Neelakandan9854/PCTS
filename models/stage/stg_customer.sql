with
    source as (select * from {{ source("public", "CUSTOMER") }})

select *from source

