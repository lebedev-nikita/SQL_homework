-- занести дату отправки в таблицу для своей аптеки
DROP FUNCTION IF EXISTS send_order;
CREATE OR REPLACE FUNCTION send_order(id INTEGER) RETURNS DATE AS $$
    UPDATE my_ds_online_orders AS tab
        SET send_date = current_date 
        WHERE order_id = id;
    SELECT current_date;
$$ LANGUAGE SQL;

-- SELECT send_order(5932);

DROP FUNCTION emails_who_ordered_in;
CREATE OR REPLACE FUNCTION emails_who_ordered_in(IN id INTEGER, OUT email TEXT, OUT item_1 TEXT, OUT item_2 TEXT, OUT item_3 TEXT, OUT item_4 TEXT) 
    RETURNS SETOF record 
    AS $$
        SELECT email, (order_list[1]->'dc_name')::TEXT, (order_list[2]->'dc_name')::TEXT, (order_list[3]->'dc_name')::TEXT, (order_list[4]->'dc_name')::TEXT
            FROM online_order INNER JOIN user_info USING (user_id)
            WHERE ds_id = id;
    $$ LANGUAGE SQL;

-- SELECT * FROM emails_who_ordered_in(123);
