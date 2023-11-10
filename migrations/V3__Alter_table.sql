ALTER TABLE veterinary_clinic ALTER COLUMN name SET NOT NULL;
ALTER TABLE veterinary_clinic ALTER COLUMN address SET NOT NULL;
ALTER TABLE veterinary_clinic ALTER COLUMN phone_number SET NOT NULL;
ALTER TABLE veterinary_clinic ALTER COLUMN email SET NOT NULL;
ALTER TABLE veterinary_clinic ADD CONSTRAINT phone_number_clinic CHECK (phone_number ~ '^(\+7|8)\d{10}$');
ALTER TABLE veterinary_clinic ADD CONSTRAINT check_name_clinic CHECK (name ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE veterinary_clinic ADD CONSTRAINT check_email_clinic CHECK (email ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,25}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,25}[a-zA-Z0-9])?)*$');
ALTER TABLE veterinary_clinic ADD CONSTRAINT check_address_clinic CHECK (address ~ '^[A-Z].*,\d+');
ALTER TABLE veterinary_clinic ADD CONSTRAINT unique_name_clinic UNIQUE (name);
ALTER TABLE veterinary_clinic ADD CONSTRAINT unique_phone_clinic UNIQUE (phone_number);

ALTER TABLE doctors ALTER COLUMN name SET NOT NULL;
ALTER TABLE doctors ALTER COLUMN surname SET NOT NULL;
ALTER TABLE doctors ALTER COLUMN telephone SET NOT NULL;
ALTER TABLE doctors ADD CONSTRAINT check_telephone_doctor CHECK (telephone  ~ '^(\+7|8)\d{10}$');
ALTER TABLE doctors ADD CONSTRAINT check_name_doctor CHECK (name ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE doctors ADD CONSTRAINT check_surname_doctor CHECK (surname ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE doctors ADD CONSTRAINT unique_phone_doctor UNIQUE (telephone);
ALTER TABLE doctors ADD CONSTRAINT check_email_doctor CHECK (email ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,25}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,25}[a-zA-Z0-9])?)*$');

ALTER TABLE owners ALTER COLUMN name SET NOT NULL;
ALTER TABLE owners ALTER COLUMN surname SET NOT NULL;
ALTER TABLE owners ALTER COLUMN telephone SET NOT NULL;
ALTER TABLE owners ALTER COLUMN address SET NOT NULL;
ALTER TABLE owners ADD CONSTRAINT check_telephone_owner CHECK (telephone  ~ '^(\+7|8)\d{10}$');
ALTER TABLE owners ADD CONSTRAINT check_name_owner CHECK (name ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE owners ADD CONSTRAINT check_surname_owner CHECK (surname ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE owners ADD CONSTRAINT check_address_owner CHECK (address ~ '^[A-Z].*,\d+');

ALTER TABLE pets ALTER COLUMN type SET NOT NULL;
ALTER TABLE pets ALTER COLUMN age SET DEFAULT 0;
ALTER TABLE pets ALTER COLUMN name SET DEFAULT '-';
ALTER TABLE pets ADD CONSTRAINT check_name_pet CHECK (name ~ '^[A-ZА-Я][a-zа-я]*$');
ALTER TABLE pets ADD CONSTRAINT check_type_pet CHECK (type ~ '^[a-zA-Z]+$');

ALTER TABLE techniques ALTER COLUMN data SET NOT NULL;
ALTER TABLE techniques ALTER COLUMN time SET NOT NULL;
ALTER TABLE techniques ALTER COLUMN pet_id SET NOT NULL;
ALTER TABLE techniques ALTER COLUMN doctor_id SET NOT NULL;
ALTER TABLE techniques ADD CONSTRAINT unique_technique UNIQUE (data, time, pet_id);
ALTER TABLE techniques ADD CONSTRAINT check_time_techniques CHECK (time >= '09:00:00' AND time <= '18:00:00');

ALTER TABLE diagnoses ALTER COLUMN name SET NOT NULL;
ALTER TABLE diagnoses ALTER COLUMN description SET NOT NULL;
ALTER TABLE diagnoses ALTER COLUMN name SET NOT NULL;
ALTER TABLE diagnoses ALTER COLUMN complications SET NOT NULL;
ALTER TABLE diagnoses ADD CONSTRAINT unique_diagnosis UNIQUE (name, patient_id);

ALTER TABLE medicaments ALTER COLUMN name SET NOT NULL;
ALTER TABLE medicaments ALTER COLUMN manual SET NOT NULL;
ALTER TABLE medicaments ALTER COLUMN side_effects SET NOT NULL;
ALTER TABLE medicaments ADD CONSTRAINT unique_medicaments UNIQUE (name);
