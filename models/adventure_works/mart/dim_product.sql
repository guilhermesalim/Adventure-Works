with
    staging as (
        select *
        from {{ref('stg_product')}}
)
    , transformed as (
        select
            row_number() over (order by productid) as product_sk
            , productid
            , name AS product_name
            , productnumber
            , class
            , standardcost
            , style
            , listprice
            , productline
            , size
            , color
            , weight
            , productsubcategoryid
            , productmodelid
        from staging
)

select *  from transformed