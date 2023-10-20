CREATE TABLE Students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  gender VARCHAR(6) CHECK (gender IN ('Male', 'Female')),
  date_of_birth DATE,
  phone_number TEXT UNIQUE
);

CREATE TABLE Rooms (
  id SERIAL PRIMARY KEY,
  number INTEGER UNIQUE,
  capacity INTEGER NOT NULL,
  floor INTEGER NOT NULL,
  student_id INTEGER,
  building VARCHAR(50) NOT NULL,
  FOREIGN KEY (student_id ) REFERENCES Students(id),
  UNIQUE (building)
);

CREATE TABLE Staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL CHECK (salary > 0),
    hire_date DATE NOT NULL,
    phone_number TEXT UNIQUE,
    building VARCHAR(50) NOT NULL REFERENCES Rooms(building),
    UNIQUE (name, position, building)
);

INSERT INTO Students (name, surname, age, gender, date_of_birth, phone_number) VALUES
('Иван', 'Иванов', 20, 'Male', '2001-05-15', '+793-456-7890'),
('Елена', 'Петрова', 19, 'Female',  '2002-02-28', '+794-567-8901'),
('Алексей', 'Сидоров', 22, 'Male',  '1999-11-11', '+795-678-9012'),
('Мария', 'Кузнецова', 21, 'Female',  '2000-08-05', '+796-789-0123'),
('Дмитрий', 'Смирнов', 20, 'Male',  '2001-06-20', '+797-890-1234');

INSERT INTO Rooms (number, capacity, floor, student_id, building) VALUES
(101, 2, 1, 1,'Корпус A'),
(102, 2, 1, 2,'Корпус C'),
(103, 3, 2, 3,'Корпус E'),
(104, 3, 2, 4,'Корпус B'),
(105, 1, 3, NULL,'Корпус D');

INSERT INTO Staff (name, surname, position, salary, hire_date, phone_number, building) VALUES
('Иванов', 'Иван', 'Менеджер', 50000.00, '2018-01-01', '+793-456-7890', 'Корпус A'),
('Петрова', 'Елена', 'Рецепционистка', 25000.00, '2019-02-01', '+794-567-8901', 'Корпус B'),
('Сидоров', 'Алексей', 'Технический специалист', 30000.00, '2020-03-01', '+795-678-9012', 'Корпус C'),
('Кузнецова', 'Мария', 'Охранник', 35000.00, '2021-04-01', '+796-789-0123', 'Корпус D'),
('Смирнов', 'Дмитрий', 'Уборщик', 20000.00, '2022-05-01', '+797-890-1234', 'Корпус E');


