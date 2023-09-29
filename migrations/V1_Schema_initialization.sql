CREATE TABLE veterinary_clinic(
    id  SERIAL PRIMARY KEY,
    name VARCHAR(11),
    address VARCHAR(132),
    phone_number VARCHAR(11),
    email VARCHAR(50)
);
CREATE TABLE Owners(
        id SERIAL PRIMARY KEY,
        name VARCHAR(11),
        surname VARCHAR(20),
        telephone VARCHAR(11),
        address VARCHAR(132),
        pet_id INTEGER REFERENCES pets(id)
);
CREATE TABLE Pets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(42),
    type VARCHAR(42),
    age INTEGER,
    clinic_id INTEGER REFERENCES veterinary_clinic(id)
);
CREATE TABLE Doctors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(11),
    surname VARCHAR(20),
    experience INTEGER,
    email VARCHAR(50),
    telephone VARCHAR(11)
);
CREATE TABLE Techniques(
    id     SERIAL PRIMARY KEY,
    data   DATE,
    time   TIME,
    pet_id    INTEGER REFERENCES Pets (id),
    doctor_id INTEGER REFERENCES Doctors (id)
);
CREATE TABLE Diagnoses(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(42),
    description VARCHAR(255),
    complications VARCHAR(255),
    patient_id     INTEGER REFERENCES Pets (id),
    doctor_id      INTEGER REFERENCES Doctors (id)
);
CREATE TABLE Medicaments(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(55),
    manual       VARCHAR(255),
    side_effects VARCHAR(255)
);
CREATE TABLE diagnoses_and_medicaments(
    id_diagnose INTEGER REFERENCES diagnoses(id),
    id_medicament INTEGER REFERENCES medicaments(id)
);
CREATE TABLE vetinary_clinic_and_doctors(
    id_clinic INTEGER REFERENCES veterinary_clinic (id),
    id_doctor INTEGER REFERENCES Doctors (id)
);
CREATE TABLE doctors_and_pets(
    id_pet INTEGER REFERENCES pets (id),
    id_doctor INTEGER REFERENCES Doctors (id)
)
