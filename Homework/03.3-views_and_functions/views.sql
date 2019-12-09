-- представление, дающее доступ к информации об онлайн-заказах, адресах их доставки и дате отправки
DROP VIEW IF EXISTS ds_128_online_orders;
CREATE VIEW ds_128_online_orders AS 
    SELECT address, order_id, item, amount, order_date, send_date
        FROM online_order oo INNER JOIN user_info u USING (user_id)
            INNER JOIN (
                SELECT order_id, (order_list[1]->'dc_name')::TEXT AS item, (order_list[1]->'amount')::INT AS amount FROM online_order
                UNION 
                SELECT order_id, (order_list[2]->'dc_name')::TEXT AS item, (order_list[2]->'amount')::INT AS amount FROM online_order
                UNION 
                SELECT order_id, (order_list[3]->'dc_name')::TEXT AS item, (order_list[3]->'amount')::INT AS amount FROM online_order
                UNION 
                SELECT order_id, (order_list[4]->'dc_name')::TEXT AS item, (order_list[4]->'amount')::INT AS amount FROM online_order
            ) ij USING (order_id)
        WHERE ds_id = 128
        ORDER BY order_id
;

SELECT * FROM ds_128_online_orders;

------------------------------------


-- материализованное представление, объединяющее: 
--информацию о пользователе
--его отзыв на аптеку 
--информацию об аптеке

DROP VIEW IF EXISTS full_ds_review;
CREATE VIEW full_ds_review AS
    SELECT ui.user_id AS USER_id, ui.city AS u_city, ui.age AS age, ui.gender, ui.phone AS u_phone, ui.email AS u_email,
           dr.review_id AS REVIEW_id, dr.stars, dr.review_date AS date, dr.advantages, dr.disadvantages,
           ds.ds_id AS DS_id, ds.ds_name, ds.city AS ds_city, ds.phone, ds.email AS ds_email
        FROM user_info ui INNER JOIN ds_review dr USING (user_id)
                          INNER JOIN drug_store ds USING (ds_id);

SELECT avg(stars)
    FROM full_ds_review 
    WHERE u_city = 'Москва';