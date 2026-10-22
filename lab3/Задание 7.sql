CREATE VIEW users_rewievs AS
    SELECT users.name, seller_review.seller_id, seller_review.rating, seller_review.description FROM users
    JOIN seller_review ON users.id = seller_review.user_id;


CREATE VIEW avg_seller_rating AS
    SELECT AVG(users_rewievs.rating) AS avg_rating FROM users_rewievs;

SELECT * FROM avg_seller_rating;

DROP VIEW avg_seller_rating;
DROP VIEW users_rewievs;
