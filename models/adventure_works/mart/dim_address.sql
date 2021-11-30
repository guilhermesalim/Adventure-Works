with
    addresstemp as (
        select
            addressid
            , stateprovinceid
            , addressline1
            , addressline2
            , city
            , postalcode
            
        from {{ref('stg_address')}}
    )

    , statetemp as (
        select 
            stateprovinceid
            , name AS state_name
            , countryregioncode
            , stateprovincecode

        from {{ref('stg_stateprovince')}}
    )

    , countrytemp as (
        select
            countryregioncode
            , name AS country_name
        
        from {{ref('stg_countryregion')}}
    )

    , final as (
        select
            addresstemp.addressid
            , addresstemp.addressline1
            , addresstemp.addressline2
            , addresstemp.city
            , addresstemp.postalcode

            , statetemp.stateprovinceid
            , statetemp.state_name
            , statetemp.stateprovincecode
            , statetemp.countryregioncode

            , countrytemp.country_name
        
        from statetemp
        left join addresstemp on statetemp.stateprovinceid = addresstemp.stateprovinceid
        left join countrytemp on statetemp.countryregioncode = countrytemp.countryregioncode
    )

select * from final