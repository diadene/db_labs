-- Продемонстрируйте работу транзакции: выполните связанные
-- изменения между BEGIN и COMMIT, затем повторите сценарий с
-- намеренной ошибкой и ROLLBACK, показав, что изменения отменены.

-- Задание 1

BEGIN;
    INSERT INTO users (name, email, phone, role)
    VALUES ('test', '', '+78887776655', 'buyer');
COMMIT;

-- Повторение запроса

BEGIN;
    INSERT INTO users (name, email, phone, role)
    VALUES ('test2', '2', '+78887776652', 'buyer');
    SELECT * FROM users;
ROLLBACK;

SELECT * FROM users WHERE name = 'test2';

DELETE FROM users WHERE name = 'test';
