with 
    part1 as (
        select
            salesreasonid
            , reasontype
            , name AS reason_name
        from {{ref('stg_salesreason')}}
    )
    
    , part2 as (
        select 
            salesorderid
            , salesreasonid
	    from {{ref('stg_salesorderheadersalesreason')}}
    )
    
    , final as (
        select
            part2.salesorderid
            , part2.salesreasonid
            , part1.reasontype
            , part1.reason_name
        from part2
        left join part1 on part1.salesreasonid = part2.salesreasonid
    )

select * from final