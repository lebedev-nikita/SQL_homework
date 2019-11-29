-- на одну таблицу
SELECT avg(total_price) FROM online_order WHERE user_city = 'Москва' AND user_age > 30;

-- на две таблицы: 
SELECT rating > 4 AS "hello", avg(orders) AS avg_orders FROM (SELECT ds_id, avg(stars) AS rating, count(order_id) AS orders FROM ds_review INNER JOIN online_order USING (ds_id) GROUP BY ds_id) AS name GROUP BY (rating > 4);
