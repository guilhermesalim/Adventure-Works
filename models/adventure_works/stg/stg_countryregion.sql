with
    source_data as (
        select
            countryregioncode
            , name
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','countryregion')}}
    )

select *
from source_data