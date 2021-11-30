with
    address as (
        select
            addressid
            , stateprovinceid
            , addressline1
            , addressline2
            , city
            , postalcode
        from {{ref('stg_address')}}
    )

    , state as (
        select 
            stateprovinceid
            , name
            , countryregioncode
            , stateprovincecode
        
        from {{ref('stg_stateprovince')}}
    )

    , country as (
        select
            countryregioncode
            , name
        
        from {{ref('stg_countryregion')}}
    )

    , final as (
        select
            address.addressid
            , address.addressline1
            , address.addressline2
            , address.city
            , address.postalcode

            , state.stateprovinceid
            , state.name AS state_name
            , state.countryregioncode
            , state.stateprovincecode

            , country.name AS country_name
        
        from state
        left join address on state.stateprovinceid = address.stateprovinceid
        left join country on state.countryregioncode = country.countryregioncode
    )

select * from final