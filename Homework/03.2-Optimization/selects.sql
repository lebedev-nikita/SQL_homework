-- на одну таблицу
EXPLAIN SELECT avg(total_price) FROM online_order 
WHERE user_city = 'ae' AND user_age > 60; 

EXPLAIN SELECT count(ds_id) FROM online_order
WHERE ds_id > 1000000;


-- каково среднее количество заказов в аптеках с рейтингом (> 4) и (< 4)
EXPLAIN SELECT rating > 4 AS "rating > 4", avg(orders) AS avg_orders 
FROM (
	SELECT ds_id, avg(stars) AS rating, count(order_id) AS orders 
	FROM ds_review INNER JOIN online_order USING (ds_id) 
	WHERE online_order.user_city = 'Екатеринбург'
	GROUP BY ds_id
) AS some_name
GROUP BY (rating > 4);
