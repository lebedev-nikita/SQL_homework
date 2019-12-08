EXPLAIN SELECT avg(total_price) FROM online_order 
WHERE user_city = 'Москва' AND user_age > 60 AND order_date BETWEEN '2019-01-01' AND '2020-01-01';

EXPLAIN ANALYZE SELECT rating > 4 AS "rating > 4", avg(orders) AS avg_orders 
FROM (
	SELECT ds_id, avg(stars) AS rating, count(order_id) AS orders 
	FROM ds_review INNER JOIN online_order USING (ds_id) 
	GROUP BY ds_id
) AS some_name
GROUP BY (rating > 4);
