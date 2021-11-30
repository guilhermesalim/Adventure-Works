with
    source_data as (
        select
            salesreasonid
            , name
            , reasontype
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','salesreason')}}
    )

select *
from source_data