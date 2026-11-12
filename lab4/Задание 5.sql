-- Примените LAG и LEAD для сравнения выручки текущего дня с предыдущим (вычислите прирост).

-- Задание 5

WITH daily_revenue AS (
    SELECT
        DATE(created_at) AS sale_date,
        SUM(amount) AS revenue
    FROM payment
    WHERE paid = true
    GROUP BY DATE(created_at)
)
SELECT
    sale_date,
    revenue AS current_day_revenue,
    LAG(revenue) OVER (ORDER BY sale_date) AS prev_day_revenue,
    LEAD(revenue) OVER (ORDER BY sale_date) AS next_day_revenue,
    revenue - LAG(revenue) OVER (ORDER BY sale_date) AS growth_amount       -- Абсолютный прирост к предыдущему дню
FROM daily_revenue
ORDER BY sale_date;
