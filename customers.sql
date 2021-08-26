SELECT 
    C.id AS customer_id,
    C.name AS customer_name,
    C.email AS customer_email,
    O.first_order_date,
    O.number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS C
LEFT OUTER JOIN (SELECT 
                   customer_id,
                   COUNT(1) AS number_of_orders,
                   MIN(created_at) AS first_order_date
                 FROM `analytics-engineers-club.coffee_shop.orders`
                 GROUP BY customer_id
                 ) AS O ON C.id = O.customer_id
ORDER BY first_order_date
LIMIT 5
