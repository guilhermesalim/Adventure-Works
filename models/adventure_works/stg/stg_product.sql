with
    source_data as (
        select
            productid
            , name
            , productnumber
            , sellenddate
            , safetystocklevel
            , finishedgoodsflag
            , class
            , makeflag
            , reorderpoint
            , standardcost
            , style
            , listprice
            , daystomanufacture
            , productline
            , size
            , color
            , sellstartdate
            , weight
            , productsubcategoryid
            , productmodelid
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('adventure_works_stitch','product')}}
    )

select *
from source_data