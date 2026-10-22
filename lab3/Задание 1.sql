SELECT p.name AS product_name, p.price, s.store_name, c.name AS category_name
FROM products AS p
         JOIN sellers AS s ON p.seller_id = s.id
         JOIN categories AS c ON p.category_id = c.id;