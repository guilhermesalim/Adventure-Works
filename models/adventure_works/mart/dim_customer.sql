with
    customertemp as (
        select
            customerid
            , personid
            , storeid

        from {{ref('stg_customer')}}
    )

    , persontemp as (
        select 
            businessentityid AS personid
            , title
            , firstname
            , lastname
            , persontype
            , emailpromotion
        
        from {{ref('stg_person')}}
    )

    , storetemp as (
        select
            businessentityid AS storeid
            , salespersonid
            , name as store_name
        
        from {{ref('stg_store')}}
    )

    , final as (
        select
            row_number() over (order by customertemp.customerid) AS customer_sk
            , customertemp.customerid
            , customertemp.personid
            , customertemp.storeid

            , persontemp.title
            , persontemp.firstname
            , persontemp.lastname
            , persontemp.persontype
            , persontemp.emailpromotion

            , storetemp.store_name

            , case
            when customertemp.personid is not null
            then "Person"
            else "Store"
            end as person_or_store
        
        from customertemp
        left join persontemp on customertemp.personid = persontemp.personid
        left join storetemp on customertemp.storeid = storetemp.storeid
    )

select * from final