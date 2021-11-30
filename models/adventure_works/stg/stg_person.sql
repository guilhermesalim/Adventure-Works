with
    source_data as (
        select
            businessentityid
            , title
            , firstname
            , middlename
            , lastname
            , suffix
            , persontype
            , namestyle
            , emailpromotion
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','person')}}
    )

select *
from source_data