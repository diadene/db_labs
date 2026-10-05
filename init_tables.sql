CREATE TYPE user_role AS ENUM ('buyer', 'seller', 'administrator');
CREATE TYPE paid_method AS ENUM ('card', 'cash');
CREATE TYPE order_status AS ENUM ('created', 'paid', 'in_delivery', 'delivered', 'cancelled');
CREATE TYPE delivery_status AS ENUM ('gathering', 'handed_to_courier', 'in_transit', 'received');

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR NOT NULL UNIQUE,               -- можно использовать как естественный ключ
    phone VARCHAR(19) NOT NULL,             -- максимальное количество символов в номере телефона - 19
    role user_role NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE sellers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    store_name VARCHAR(80) NOT NULL UNIQUE,            -- один пользователь не может иметь 2 магазина с одинаковым названием
    description TEXT NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    parent_id BIGINT REFERENCES categories(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    name TEXT NOT NULL UNIQUE,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE products (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seller_id BIGINT NOT NULL REFERENCES sellers(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    category_id BIGINT NOT NULL REFERENCES  categories(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    name VARCHAR(80) NOT NULL,
    price numeric(12, 2) NOT NULL CHECK ( price > 0.00 ),
    quantity INT NOT NULL CHECK ( quantity >= 0 ),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE seller_review (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seller_id BIGINT NOT NULL REFERENCES sellers(id) ON DELETE CASCADE  ON UPDATE CASCADE,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    description TEXT NOT NULL,
    rating INT CHECK ( rating BETWEEN 1 AND 5) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'published' CHECK ( status IN ('published', 'hidden')),
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE basket (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now()
);

-- Ассоциативная таблица

CREATE TABLE basket_items (
    basket_id BIGINT NOT NULL REFERENCES basket(id) ON DELETE CASCADE ON UPDATE CASCADE,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    quantity INT NOT NULL CHECK ( quantity > 0 )
);

CREATE TABLE orders (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    status order_status NOT NULL DEFAULT 'created',
    address VARCHAR(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE order_items (
    order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    quantity INT NOT NULL CHECK ( quantity > 0 ),
    unit_price numeric(12, 2) NOT NULL CHECK ( unit_price > 0 )
);

CREATE TABLE payment (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    order_id BIGINT NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    amount numeric(12, 2) NOT NULL CHECK ( amount >= 0 ),
    method paid_method NOT NULL,
    paid BOOLEAN NOT NULL DEFAULT FALSE,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE truck (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    truck_number VARCHAR(20) NOT NULL UNIQUE,
    model TEXT NOT NULL,
    load_capacity INT NOT NULL CHECK ( load_capacity > 0 )
);

CREATE TABLE delivery (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    truck_id BIGINT NOT NULL REFERENCES truck(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    order_id BIGINT NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    status delivery_status NOT NULL DEFAULT 'gathering'
);

CREATE TABLE product_review (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    description TEXT NOT NULL,
    rating INT NOT NULL CHECK ( rating BETWEEN 1 AND 5),
    status VARCHAR(20) NOT NULL DEFAULT 'published' CHECK ( status IN ('published', 'hidden')),
    created_at timestamptz NOT NULL DEFAULT now()
);






