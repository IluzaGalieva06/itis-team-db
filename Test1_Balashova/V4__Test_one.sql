-- Книги
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(255),
    publishing_house VARCHAR(100) NOT NULL,
    publication_year INTEGER,
    genre VARCHAR(50)
);

-- Читатели
CREATE TABLE readers (
    reader_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL CHECK (first_name ~ '^[A-ZА-Я][a-zа-я]*$'),
    last_name VARCHAR(50) NOT NULL CHECK (last_name ~ '^[A-ZА-Я][a-zа-я]*$'),
    patronymic VARCHAR(255) NOT NULL DEFAULT '-' CHECK (patronymic ~ '^[A-ZА-Я][a-zа-я]*$'),
    birth_date DATE NOT NULL,
    address VARCHAR(100),
    phone_Number VARCHAR(14) UNIQUE CHECK (phone_number ~ '^\+\d{10,13}$'),
    email VARCHAR(100) UNIQUE CHECK (email ~ '^.+@.+$')
);
-- Выдача книг
CREATE TABLE book_loans (
    loan_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    reader_id INTEGER REFERENCES readers(reader_id),
    loan_date DATE NOT NULL,
    return_date DATE,
    returned BOOLEAN DEFAULT false
);

INSERT INTO books (title, author, publishing_house, publication_year, genre)
VALUES ('Война и мир', 'Лев Толстой', 'Эксмо', 1869, 'Роман'),
       ('1984', 'Джордж Оруэлл', 'Издательство АСТ', 1949, 'Дистопия'),
       ('Преступление и наказание', 'Федор Достоевский', 'Азбука', 1866, 'Роман'),
       ('Гарри Поттер и философский камень', 'Джоан Роулинг', 'Росмэн', 1997, 'Фэнтези'),
       ('Тихий Дон', 'Михаил Шолохов', 'Издательство АСТ', 1928, 'Роман');

INSERT INTO readers (first_name, last_name, patronymic, birth_date, address, phone_Number, email)
VALUES ('Иван', 'Иванов', 'Иванович', '1995-03-15', 'ул. Центральная, 1', '+79872974029', 'ivanov@example.com'),
       ('Петр', 'Петров', 'Петрович', '1990-07-21', 'ул. Садовая, 10', '+79143640987', 'petrov@example.com'),
       ('Анна', 'Сидорова', 'Сидорович', '1988-11-30', 'ул. Лесная, 5', '+79172550830', 'sidorova@example.com'),
       ('Елена', 'Смирнова', 'Николаевна', '1992-05-02', 'ул. Пушкина, 8', '+79641392739', 'smirnova@example.com'),
       ('Сергей', 'Козлов', 'Михайлович', '1985-09-18', 'ул. Московская, 15', '+79490442839', 'kozlov@example.com');

INSERT INTO book_loans (book_id, reader_id, loan_date, return_date, returned)
VALUES (1, 2, '2023-09-01', '2023-09-15', true),
       (2, 3, '2023-09-03', '2023-09-17', true),
       (3, 1, '2023-09-05', '2023-09-19', true),
       (4, 4, '2023-09-07', '2023-09-21', false),
       (5, 5, '2023-09-09', NULL, false);

