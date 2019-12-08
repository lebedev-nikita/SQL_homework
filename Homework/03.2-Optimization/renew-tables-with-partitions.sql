DROP INDEX IF EXISTS user_age_index;
DROP INDEX IF EXISTS user_city_index;

DROP TABLE IF EXISTs ds_review;
DROP TABLE IF EXISTs dc_review;
DROP TABLE IF EXISTs online_order;
DROP TABLE IF EXISTs in_stock;

-- DROP TABLE IF EXISTS online_order_2010;
-- DROP TABLE IF EXISTS online_order_2011;
-- DROP TABLE IF EXISTS online_order_2012;
-- DROP TABLE IF EXISTS online_order_2013;
-- DROP TABLE IF EXISTS online_order_2014;
-- DROP TABLE IF EXISTS online_order_2015;
-- DROP TABLE IF EXISTS online_order_2016;
-- DROP TABLE IF EXISTS online_order_2017;
-- DROP TABLE IF EXISTS online_order_2018;
-- DROP TABLE IF EXISTS online_order_2019;


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
 
CREATE TABLE in_stock (
	ds_id INT,
	ds_name TEXT,
	ds_city TEXT,

	dc_id INT,
	dc_name TEXT,

	price NUMERIC,
	current_amount INT
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
) PARTITION BY RANGE (order_date);

CREATE TABLE online_order_2010 PARTITION OF online_order
	FOR VALUES FROM ('2010-01-01') TO ('2011-01-01');

CREATE TABLE online_order_2011 PARTITION OF online_order
	FOR VALUES FROM ('2011-01-01') TO ('2012-01-01');

CREATE TABLE online_order_2012 PARTITION OF online_order
	FOR VALUES FROM ('2012-01-01') TO ('2013-01-01');

CREATE TABLE online_order_2013 PARTITION OF online_order
	FOR VALUES FROM ('2013-01-01') TO ('2014-01-01');

CREATE TABLE online_order_2014 PARTITION OF online_order
	FOR VALUES FROM ('2014-01-01') TO ('2015-01-01');

CREATE TABLE online_order_2015 PARTITION OF online_order
	FOR VALUES FROM ('2015-01-01') TO ('2016-01-01');

CREATE TABLE online_order_2016 PARTITION OF online_order
	FOR VALUES FROM ('2016-01-01') TO ('2017-01-01');

CREATE TABLE online_order_2017 PARTITION OF online_order
	FOR VALUES FROM ('2017-01-01') TO ('2018-01-01');

CREATE TABLE online_order_2018 PARTITION OF online_order
	FOR VALUES FROM ('2018-01-01') TO ('2019-01-01');

CREATE TABLE online_order_2019 PARTITION OF online_order
	FOR VALUES FROM ('2019-01-01') TO ('2020-01-01');

CREATE INDEX ON online_order (order_date);