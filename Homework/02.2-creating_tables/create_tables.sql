CREATE TYPE FORM AS ENUM ('pills', 'suspension', 'powder', 'paste', 
                          'aerosol', 'inhaler', 'nebulizer',
                          'ampulas',
                          'skin patch', 'eye drops', 'ear drops', 'gel' 
);

CREATE TABLE drug_store (
    drug_store_id       SERIAL  PRIMARY KEY, 
    name                TEXT    NOT NULL,
    email               TEXT    NOT NULL UNIQUE,
    phone               TEXT    NOT NULL, -- только числа
    city                TEXT    NOT NULL,
    address             TEXT    NOT NULL
);

CREATE TABLE manufacturer (
    manufacturer_id     SERIAL  PRIMARY KEY,
    name                TEXT    NOT NULL,          
    email               TEXT    NOT NULL UNIQUE,
    phone               TEXT    NOT NULL,
    city                TEXT    NOT NULL,
    address             TEXT    NOT NULL
);

CREATE TABLE drug_class (
    drug_class_id       SERIAL      PRIMARY KEY,
    name                TEXT        NOT NULL UNIQUE,
    form                FORM        NOT NULL,  -- enum
    manufacturer_id     INT         NOT NULL REFERENCES manufacturer(manufacturer_id),
    amount_in_package   INT         NOT NULL CHECK (amount_in_package > 0),
    indications         TEXT        NOT NULL,
    contraindications   TEXT        NOT NULL,
    active_ingredients  TEXT        NOT NULL,
    shelf_life          INTERVAL    NOT NULL CHECK (shelf_life > INTERVAL '0 days')
);

CREATE TABLE provisioner (
    provisioner_id      SERIAL  PRIMARY KEY,
    name                TEXT    NOT NULL,
    email               TEXT    NOT NULL UNIQUE,
    phone               TEXT    NOT NULL,
    city                TEXT    NOT NULL,
    address             TEXT    NOT NULL
);

CREATE TABLE stock_control (
    drug_store_id   INT         NOT NULL REFERENCES drug_store(drug_store_id) ON DELETE CASCADE,
    drug_class_id   INT         NOT NULL REFERENCES drug_class(drug_class_id) ON DELETE CASCADE, 
    provisioner_id  INT         NOT NULL REFERENCES provisioner(provisioner_id) ON DELETE RESTRICT, 
    price           NUMERIC     NOT NULL            CHECK (price > 0), 
    current_amount  INT         NOT NULL DEFAULT 0  CHECK (current_amount >= 0),
    recommended_amount INT      NOT NULL DEFAULT 0  CHECK (recommended_amount >= 0),
    request_date    date        DEFAULT NULL,
    days_to_deliver INT         NOT NULL DEFAULT 7 CHECK (days_to_deliver > 0), 
    PRIMARY KEY (drug_store_id, drug_class_id)
);