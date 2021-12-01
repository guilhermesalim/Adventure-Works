with
    validation as (
        select sum(orderqty) as sum_val
        from {{ref('fact_orderdetail')}}
    )

    select * from validation where sum_val != 274914