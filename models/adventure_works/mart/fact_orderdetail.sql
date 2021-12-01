with
    address as (
        select *
        from {{ref('dim_address')}}
    )

    , creditcard as (
        select *
        from {{ref('dim_creditcard')}}
    )

    , customer as (
        select *
        from {{ref('dim_customer')}}
    )

    , product as (
        select *
        from {{ref('dim_product')}}
    )

    , salesreason as (
        select *
        from {{ref('dim_salesreason')}}
    )

    , orderheader_with_sk as (
        select
            orderheader.salesorderid
            , customer.customer_sk as customer_fk
            , creditcard.creditcard_sk as creditcard_fk
            , orderheader.billtoaddressid as addressid
            , salesreason.salesreasonsname
            , salesreason.salesreasonstype
            , salesreason.qtyofreasons
            , orderheader.orderdate
            , orderheader.duedate
            , orderheader.shipdate
            , orderheader.status
            , orderheader.onlineorderflag
            , orderheader.purchaseordernumber
            , orderheader.subtotal
            , orderheader.taxamt
            , orderheader.freight
            , orderheader.totaldue

        from {{ref('stg_salesorderheader')}} as orderheader
        left join salesreason on orderheader.salesorderid = salesreason.salesorderid
        left join customer on orderheader.customerid = customer.customerid
        left join address on orderheader.billtoaddressid = address.addressid
        left join creditcard on orderheader.creditcardid = creditcard.creditcardid
    )

    , orderdetail_with_sk as (
        select

            orderdetail.salesorderdetailid
            , orderdetail.salesorderid
            , product.product_sk as product_fk
            , orderdetail.orderqty
            , orderdetail.unitprice
            , orderdetail.unitpricediscount
        from {{ref('stg_salesorderdetail')}} as orderdetail
        left join product on orderdetail.productid = product.productid
    )

    , final as (
        select
            orderheader_with_sk.salesorderid
            , orderheader_with_sk.customer_fk
            , orderheader_with_sk.creditcard_fk
            , orderheader_with_sk.addressid
            , orderheader_with_sk.salesreasonsname
            , orderheader_with_sk.salesreasonstype
            , orderheader_with_sk.qtyofreasons
            , orderheader_with_sk.orderdate
            , orderheader_with_sk.duedate
            , orderheader_with_sk.shipdate
            , orderheader_with_sk.status
            , orderheader_with_sk.onlineorderflag
            , orderheader_with_sk.purchaseordernumber
            , orderheader_with_sk.subtotal
            , orderheader_with_sk.taxamt
            , orderheader_with_sk.freight
            , orderheader_with_sk.totaldue
            , orderdetail_with_sk.salesorderdetailid
            , orderdetail_with_sk.product_fk
            , orderdetail_with_sk.orderqty
            , orderdetail_with_sk.unitprice
            , orderdetail_with_sk.unitpricediscount

        from orderheader_with_sk
        left join orderdetail_with_sk on orderheader_with_sk.salesorderid = orderdetail_with_sk.salesorderid
    )

select * from final