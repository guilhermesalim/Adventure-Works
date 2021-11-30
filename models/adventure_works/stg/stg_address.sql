with
    source_data as (
        select
            addressid
            , stateprovinceid
            , addressline1
            , addressline2
            , city
            , postalcode
            , spatiallocation
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','address')}}
    )

select *
from source_data