DROP TABLE IF EXISTS ds_review;
DROP TABLE IF EXISTS dc_review;
DROP TABLE IF EXISTS online_order;
DROP TABLE IF EXISTS in_stock;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS drug_store;
DROP TABLE IF EXISTS drug_class;

CREATE TABLE ds_review (
    review_id INT,
    
    ds_id INT,

    user_id INT,

    stars INT,
    review_date DATE,
    advantages TEXT,
    disadvantages TEXT
);
 
CREATE TABLE dc_review (
    review_id INT,
    
    dc_id INT,

    user_id INT,

    stars INT,
    review_date DATE,
    advantages TEXT,
    disadvantages TEXT
);
 
CREATE TABLE online_order (
    order_id INT,

    ds_id INT,

    user_id INT,

    order_list JSONB[],
    order_date DATE,
    send_date DATE,
    recieve_date DATE,
    total_price NUMERIC
);
 
CREATE TABLE in_stock (
    ds_id INT,

    dc_id INT,

    price NUMERIC,
    current_amount INT
);

-------------

CREATE TABLE user_info (
    user_id INT,
    city TEXT,
    age INT,
    gender VARCHAR(8),
    phone TEXT,
    email TEXT,
    address TEXT
);

CREATE TABLE drug_store (
    ds_id INT,
    ds_name TEXT,
    city TEXT,
    phone TEXT,
    email TEXT
);

CREATE TABLE drug_class (
    dc_id INT,
    name TEXT,
    manufacturer_country TEXT
);