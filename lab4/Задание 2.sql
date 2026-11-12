-- Для каждой категории выведите три самых дорогих товара
-- (нумерация в окне и фильтрация через CTE).

-- Задание 2
WITH top_products AS (
    SELECT
        products.name AS product_name, price,
        categories.name AS category_name,
        ROW_NUMBER() OVER (PARTITION BY categories.name ORDER BY price DESC) AS row_number
    FROM products
             JOIN categories ON products.category_id = categories.id)
SELECT
    product_name, price, category_name, row_number
FROM top_products
WHERE row_number <= 3
ORDER BY category_name ASC, price DESC;
