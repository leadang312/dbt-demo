{{
  config(materialized="table")
}}

SELECT 
customers.id AS user_id, 
customers.first_name,
customers.last_name,

orders.id AS order_id,
orders.order_date,
orders.status,

payments.id AS payment_id,
payments.payment_method,
payments.amount

FROM {{ref('stg_customers')}} customers
JOIN {{ref('stg_orders')}} orders
  ON customers.id = orders.user_id 
JOIN {{ref('stg_payments')}} payments
  ON orders.id = payments.order_id