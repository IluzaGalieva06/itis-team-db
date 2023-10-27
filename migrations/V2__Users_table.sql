CREATE TABLE Users (
    ID SERIAL PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL CHECK (LastName ~ '^[A-ZА-ЯЁ][a-zа-яё]*$'),
    FirstName VARCHAR(255) NOT NULL CHECK (FirstName ~ '^[A-ZА-ЯЁ][a-zа-яё]*$'),
    Patronymic VARCHAR(255) NOT NULL DEFAULT '-' CHECK (Patronymic ~ '^[A-ZА-ЯЁ][a-zа-яё]*$'),
    BirthDate DATE NOT NULL,
    Profession VARCHAR(255) NOT NULL DEFAULT '-',
    Nationality VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(18) UNIQUE CHECK (PhoneNumber ~ '^(\+7|8)-\(\d{3}\)-\d{3}-\d{2}-\d{2}$'),
    Email VARCHAR(255) UNIQUE CHECK (Email ~ '^.+@.+$')
);

comment on table Users is 'Пользователь';
comment on column Users.LastName is 'Фамилия';
comment on column Users.FirstName is 'Имя';
comment on column Users.Patronymic is 'Отчество';
comment on column Users.BirthDate is 'Дата рождения';
comment on column Users.Profession is 'Профессия';
comment on column Users.Nationality is 'Национальность';
comment on column Users.PhoneNumber is 'Номер телефона';
comment on column Users.Email is 'Электронная почта';
