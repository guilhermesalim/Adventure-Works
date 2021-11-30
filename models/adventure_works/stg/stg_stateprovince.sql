with
    source_data as (
        select
            stateprovinceid
            , countryregioncode
            , territoryid
            , stateprovincecode
            , isonlystateprovinceflag
            , name
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','stateprovince')}}
    )

select *
from source_data