CREATE TABLE Restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    website VARCHAR(255),
    phone_number VARCHAR(20),
    capacity INT
);


CREATE TABLE Menu (
    id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES Restaurants(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    vegetarian BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES Restaurants(id),
    menu_id INT REFERENCES Menu(id),
    user_name VARCHAR(255) NOT NULL,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    delivered BOOLEAN DEFAULT FALSE
);

INSERT INTO Restaurants (name, address, city, country, website, phone_number, capacity)
VALUES
    ('Ресторан 1', 'Адрес 1', 'Город 1', 'Страна 1', 'http://website1.com', '+123456789', 50),
    ('Ресторан 2', 'Адрес 2', 'Город 2', 'Страна 2', 'http://website2.com', '+987654321', 100),
    ('Ресторан 3', 'Адрес 3', 'Город 3', 'Страна 3', 'http://website3.com', '+111222333', 80),
    ('Ресторан 4', 'Адрес 4', 'Город 4', 'Страна 4', 'http://website4.com', '+444555666', 70),
    ('Ресторан 5', 'Адрес 5', 'Город 5', 'Страна 5', 'http://website5.com', '+777888999', 120);

INSERT INTO Menu (restaurant_id, name, description, price, vegetarian, created_at)
VALUES
    (1, 'Блюдо 1', 'Описание 1', 10.99, FALSE, CURRENT_TIMESTAMP),
    (1, 'Блюдо 2', 'Описание 2', 14.99, FALSE, CURRENT_TIMESTAMP),
    (2, 'Блюдо 3', 'Описание 3', 8.99, TRUE, CURRENT_TIMESTAMP),
    (2, 'Блюдо 4', 'Описание 4', 12.99, TRUE, CURRENT_TIMESTAMP),
    (3, 'Блюдо 5', 'Описание 5', 9.99, FALSE, CURRENT_TIMESTAMP);

INSERT INTO Orders (restaurant_id, menu_id, user_name, order_time, quantity, total_price, delivered)
VALUES
    (1, 1, 'Пользователь 1', CURRENT_TIMESTAMP, 2, 21.98, FALSE),
    (1, 2, 'Пользователь 2', CURRENT_TIMESTAMP, 1, 14.99, TRUE),
    (2, 3, 'Пользователь 3', CURRENT_TIMESTAMP, 3, 26.97, FALSE),
    (2, 4, 'Пользователь 4', CURRENT_TIMESTAMP, 2, 25.98, TRUE),
    (3, 5, 'Пользователь 5', CURRENT_TIMESTAMP, 1, 9.99, FALSE);
