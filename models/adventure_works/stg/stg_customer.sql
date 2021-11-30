with
    source_data as (
        select
            customerid
            , personid
            , storeid
            , territoryid
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','customer')}}
    )

select *
from source_data