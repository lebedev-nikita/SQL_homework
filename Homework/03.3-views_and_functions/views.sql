DROP VIEW my_ds_online_orders;

CREATE VIEW my_ds_online_orders AS 
SELECT * FROM online_order WHERE ds_id = 128;

SELECT * FROM my_ds_online_orders WHERE order_date > '2019-06-01';

------------------------------------

