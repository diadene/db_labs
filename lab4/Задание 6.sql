-- Решите одну из задач двумя способами — оконной функцией и обычной группировкой
-- и поясните, почему оконная функция здесь удобнее.

-- Задание 6

-- Без оконных функций
SELECT
    p1.name,
    p1.price,
    COUNT(p2.id) + 1 AS row_number
FROM products p1
         LEFT JOIN products p2
                   ON p2.price < p1.price
                       OR (p2.price = p1.price AND p2.id < p1.id)
GROUP BY p1.id, p1.name, p1.price
ORDER BY p1.price ASC, p1.id ASC;

-- С оконной функцией
SELECT name, price, ROW_NUMBER() OVER (ORDER BY price)
FROM products;
