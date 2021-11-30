with
    source_data as (
        select
            salesorderid
            , customerid	
            , salespersonid	
            , territoryid
            , billtoaddressid	
            , shiptoaddressid
            , shipmethodid	
            , currencyrateid 
            , creditcardid
            , orderdate	
            , duedate	
            , shipdate	
            , revisionnumber
            , status	
            , onlineorderflag	
            , purchaseordernumber	
            , accountnumber	
            , creditcardapprovalcode	
            , subtotal	
            , taxamt	
            , freight	
            , totaldue	
            , rowguid	
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','salesorderheader')}}
    )

select *
from source_data