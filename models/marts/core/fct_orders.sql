with customers as (

    select * from {{ ref('stg_customers')}}

)

, orders as (

    select * from {{ ref('stg_orders') }}

)

, payments as (

    select * from {{ ref('stg_payments') }}

)

, final as (

    select 
        customers.customer_id
        ,orders.order_id
        ,payments.status as payment_status
        ,payments.amount

    from payments
    left join orders using (order_id)
    left join customers using (customer_id)
    

)

select * from final


