with
    source_data as (
        select
            salesorderdetailid
            , salesorderid
            , productid
            , specialofferid
            , orderqty
            , unitprice
            , unitpricediscount
            , carriertrackingnumber
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','salesorderdetail')}}
    )

select *
from source_data