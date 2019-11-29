DROP TABLE IF EXISTs ds_review;
DROP TABLE IF EXISTs dc_review;
DROP TABLE IF EXISTs online_order;
DROP TABLE IF EXISTs in_stock;

CREATE TABLE ds_review (
	review_id INT,
	
	ds_id INT,
	ds_name TEXT,
	ds_city TEXT,

	user_id INT,
	user_city TEXT,
	user_age INT,
	user_gender VARCHAR(8),

	stars INT,
	review_date DATE,
	advantages TEXT,
	disadvantages TEXT
);
 
CREATE TABLE dc_review (
	review_id INT,
	
	dc_id INT,
	dc_name TEXT,
	manufacturer_country TEXT,

	user_id INT,
	user_city TEXT,
	user_age INT,
	user_gender VARCHAR(7),

	stars INT,
	review_date DATE,
	advantages TEXT,
	disadvantages TEXT
);
 
CREATE TABLE online_order (
	order_id INT,

	ds_id INT,
	ds_city TEXT,
	ds_name TEXT,

	user_id INT,
	user_city TEXT,
	user_age INT,
	user_gender VARCHAR(7),

	order_list JSONB[],
	order_date DATE,
	send_date DATE,
	recieve_date DATE,
	total_price NUMERIC
);
 
CREATE TABLE in_stock (
	ds_id INT,
	ds_name TEXT,
	ds_city TEXT,

	dc_id INT,
	dc_name TEXT,

	price NUMERIC,
	current_amount INT
);