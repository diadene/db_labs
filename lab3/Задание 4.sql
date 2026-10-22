SELECT  sellers.store_name,
        SUM(products.price * order_items.quantity) AS total
FROM order_items
         JOIN products ON order_items.product_id = products.id
         JOIN sellers ON products.seller_id = sellers.id
GROUP BY sellers.store_name;