-- Вычислите нарастающий итог выручки по дням оконной агрегатной функцией.

-- Задание 3

SELECT DISTINCT
    DATE(created_at) AS sale_date,
    SUM(amount) OVER (PARTITION BY DATE(created_at)) AS daily_revenue,
    SUM(amount) OVER (ORDER BY DATE(created_at)) AS running_total
FROM payment
WHERE paid = true
ORDER BY sale_date;