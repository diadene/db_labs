SELECT c.name AS category_name, COUNT(*) AS products_quantity, AVG(p.price) AS AVG_price FROM categories AS c
JOIN products AS p ON p.category_id = c.id
group by c.name;