-- TODO Скалярный запрос
SELECT AVG(amount) FROM payment;        -- Вывод средней цены для более ясного анализа вывода следующего запроса
SELECT u.name, p.amount
FROM users AS u
JOIN payment AS p ON u.id = p.user_id
WHERE amount < (SELECT AVG(amount) FROM payment);

-- TODO Запрос с IN


-- TODO Запрос с EXISTS
SELECT d.status, t.truck_number, t.model
FROM delivery AS d
JOIN public.truck t ON d.truck_id = t.id
WHERE EXISTS (SELECT status from truck WHERE status = 'in_transit')