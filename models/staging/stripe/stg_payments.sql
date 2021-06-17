with payments as (

    select
        orderid as order_id
        ,id as payment_id
        ,paymentmethod as payment_method
        ,status
        ,amount / 100.0 as amount
        ,created

    from {{ source('stripe', 'payment') }}

)

select * from payments