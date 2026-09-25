-- CREATE TYPE user_role AS ENUM ('buyer', 'seller', 'administrator');
-- CREATE TYPE paid_method AS ENUM ('card', 'cash');

CREATE TABLE users (
                       id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                       name VARCHAR(30) NOT NULL,
                       email VARCHAR,
                       phone BIGINT NOT NULL,
                       role user_role NOT NULL,
                       created_at DATE NOT NULL
);

CREATE TABLE sellers (
                         id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                         user_id BIGINT REFERENCES users(id),
                         store_name VARCHAR(80) NOT NULL,
                         description VARCHAR NOT NULL,
                         created_at DATE NOT NULL
);

CREATE TABLE seller_review (
                               id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                               seller_id BIGINT REFERENCES sellers(id),
                               user_id BIGINT REFERENCES users(id),
                               description TEXT NOT NULL,
                               created_at DATE NOT NULL
);

CREATE TABLE product (
                         id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                         seller_id BIGINT REFERENCES sellers(id),
                         name VARCHAR(80) NOT NULL,
                         price BIGINT NOT NULL,
                         quantity VARCHAR NOT NULL
);

CREATE TABLE product_review (
                                id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                product_id BIGINT REFERENCES product(id),
                                user_id BIGINT REFERENCES users(id),
                                description TEXT NOT NULL,
                                created_at DATE NOT NULL
);

CREATE TABLE basket (
                        id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        product_id BIGINT REFERENCES product(id)
);

CREATE TABLE orders (
                        id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        basket_id BIGINT REFERENCES basket(id),
                        address VARCHAR(255) NOT NULL
);

CREATE TABLE payment (
                         id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                         user_id BIGINT REFERENCES users(id),
                         order_id BIGINT REFERENCES orders(id),
                         paid BOOLEAN DEFAULT FALSE,
                         method paid_method NOT NULL
);

CREATE TABLE truck (
                       id VARCHAR(6) PRIMARY KEY,                  -- По аналогии с российскими номерами без региона
                       model TEXT NOT NULL,
                       load_cap INT NOT NULL
);

CREATE TABLE delivery (
                          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          truck_id VARCHAR(6) REFERENCES truck(id),
                          order_id BIGINT REFERENCES orders(id),
                          delivered BOOLEAN DEFAULT FALSE
);