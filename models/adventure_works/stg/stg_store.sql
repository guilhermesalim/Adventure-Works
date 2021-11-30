with
    source_data as (
        select
            businessentityid
            , salespersonid
            , name
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','store')}}
    )

select *
from source_data