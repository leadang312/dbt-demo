SELECT user_id, first_name, last_name, SUM(amount) AS total_payments
FROM {{ref('customers')}}
GROUP BY user_id, first_name, last_name