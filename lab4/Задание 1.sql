-- Постройте рейтинг товаров по цене внутри каждой категории с помощью ROW_NUMBER,
-- RANK и DENSE_RANK; поясните, чем различаются их результаты на строках с равными значениями.


-- ROW_NUMBER
SELECT name, price, ROW_NUMBER() OVER (ORDER BY price)      -- ROW_NUMBER - присваивание номера независимо от совпадения значений
FROM products;

-- RANK
SELECT name, price, RANK() OVER (ORDER BY price)            -- RANK - присваивание одинакового ранга строкам с одинаковыми значениями
FROM products;

-- DENSE_RANK
SELECT name, price, DENSE_RANK() OVER (ORDER BY price)      -- DENSE_RANK - то же что и RANK, но без пропусков значений
FROM products;
