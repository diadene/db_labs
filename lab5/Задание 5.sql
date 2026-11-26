-- Создайте триггер, поддерживающий денормализованное поле
-- (например, средний рейтинг товара пересчитывается при добавлении
-- отзыва)

SELECT product_id, AVG(rating) FROM product_review
GROUP BY product_id
ORDER BY AVG(rating);

