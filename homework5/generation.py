import psycopg2
from mimesis import Person, Datetime, Generic


def generate_fake_users(count):
    person = Person('ru')
    datetime = Datetime('ru')

    fake_users = []
    for _ in range(count):
        fake_user = {
            'last_name': person.surname(),
            'first_name': person.first_name(),
            'patronymic': person.last_name(),
            'birth_date': datetime.date(start=1960, end=2023),
            'profession': person.occupation(),
            'nationality': person.nationality(),
            'phone_number': person.telephone(),
            'email': person.email(),
        }
        fake_users.append(fake_user)

    return fake_users


def insert_users(db_connection, fake_users):
    cursor = db_connection.cursor()
    try:
        for user in fake_users:
            cursor.execute(
                """
                INSERT INTO Users (LastName, FirstName, Patronymic, BirthDate, Profession, Nationality, PhoneNumber, Email)
                VALUES (%(last_name)s, %(first_name)s, %(patronymic)s, %(birth_date)s, %(profession)s, %(nationality)s, %(phone_number)s, %(email)s)
                """,
                user
            )
        db_connection.commit()
        print(f"Вставлено {len(fake_users)} пользователей в базу данных")
    except (Exception, psycopg2.Error) as error:
        print("Ошибка при выполнении операции вставки:", error)
        db_connection.rollback()
    finally:
        cursor.close()


if __name__ == "__main__":

    db_connection = psycopg2.connect(
        host="localhost",
        port="5432",
        database="postgres",
        user="postgres",
        password="PasswordSQL"
    )
    fake_users = generate_fake_users(1000)
    insert_users(db_connection, fake_users)
    db_connection.close()
