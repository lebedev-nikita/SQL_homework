-- types: varchar(123), int, real, date, time, timestamp, inrerval
-- POSTGRESS PRO: point

\dt # напечатать список таблиц
\d tableName # показать структуру таблицы

CREATE TABLE weather (
    city    varchar(80),
    temp_lo int,
    temp_hi int,
    prcp    real,   # уровень осадков
    date    date
);  

CREATE TABLE cities (
    name        varchar(80),
    location    point
);

DROP TABLE weather      # deletes table

INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');

INSERT INTO weather(city, temp_hi, prcp, temp_lo, date) VALUES ('Moscow', 24, 0.2, -23, '2019-09-13');

SELECT * FROM weather;
SELECT * FROM cities;
SELECT city FROM weather;

SELECT city, (temp_lo + temp_hi)/2 AS temp_avg, date FROM weather;

SELECT * FROM weather WHERE city='San Francisco';
SELECT * FROM weather WHERE city='San Francisco' AND prcp > 0.0;

SELECT * FROM weather ORDER BY city;  # sorts results by city
SELECT * FROM weather ORDER BY prcp;
SELECT * FROM weather ORDER BY city, temp_lo; # сортировка по city, а результат по temp_lo

SELECT DISTINCT city FROM weather ORDER BY city;  # вывод не повторяющихся значений city
SELECT DISTINCT city, date FROM weather ORDER BY city; # вывод не повторяющихся ПАР значений city, date


-- -- -- -- -- -- -- JOIN:
SELECT * FROM weather, cities WHERE city = name; # склеивает две подходящие строки из двух таблиц в одну 

SELECT city, temp_lo, temp_hi, prcp, date, location 
    FROM weather, cities 
    WHERE city = name; # указываем нужные столбцы вручную
    # без 'WHERE city = name' будут выведены все возможные склеенные пары строк из двух таблиц

# если имена столбцов повторяются в разных таблицах, приходится указывать их имена вместе с таблицей:
SELECT weather.city, weather.temp_lo, weather.temp_hi, weather.prcp, weather.date, cities.location 
    FROM weather, cities 
    WHERE weather.city = cities.name; 

-- A INNER JOIN B:
SELECT * FROM weather INNER JOIN cities ON (city = name); # полный аналог строки 42
                                                          # выводит и склеивает A^B
-- A OUTER JOIN B:
# выводит A, где возможно - объединяет с B, где нет - пустые клетки
SELECT * FROM weather LEFT OUTER JOIN cities ON (weather.city = cities.name);

# выводит B, где возможно - объединяет с A, где нет - пустые клетки
SELECT * FROM weather RIGHT OUTER JOIN cities ON (weather.city = cities.name);

# выводит AvB, где возможно - объединяет, где нет - пустые клетки
SELECT * FROM weather FULL OUTER JOIN cities ON (weather.city = cities.name);

-- псевдонимы:
SELECT *
    FROM weather w, cities c
    WHERE w.city = c.name;

# Вывести записи, где температура лежит в диапазоне температур других записей
SELECT W1.city, W1.temp_lo AS low, W1.temp_hi AS high,
       W2.city, W2.temp_lo AS low, W2.temp_hi AS high
    FROM weather W1, weather W2
    WHERE W1.temp_lo < W2.temp_lo AND W1.temp_hi > W2.temp_hi;

----- Агрегатные функции: count(), sub(), avg() - ср. арифм, max(), min()
SELECT max(temp_hi) FROM weather;

SELECT city FROM weather WHERE temp_hi = (SELECT max(temp_hi) FROM weather);

# GROUP BY
SELECT city, max(temp_hi) 
    FROM weather 
    GROUP BY city;

# HAVING
SELECT city, max(temp_hi) 
    FROM weather 
    GROUP BY city
    HAVING max(temp_hi) > 40;

# LIKE
# Названия, начинающиеся на 'S'
SELECT city, max(temp_hi) 
    FROM weather 
    WHERE city LIKE 'S%'
    GROUP BY city
    HAVING max(temp_hi) > 40;

# WHERE  - выполняется до агрегатных функций и не должно их содержать
# HAVING - выполняется после агрегатных функций и (обычно) !ДОЛЖНО! их содержать

-- Изменение значений в таблице
# UPDATE
UPDATE weather
    SET temp_hi = temp_hi-2, temp_lo = temp_lo-2
    WHERE date > '1994-11-28';

# DELETE
DELETE FROM weather WHERE city = 'Gelenjik';


-- Оконные функции: обычные функции с OVER
SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname)
    FROM empsalary;

SELECT depname, empno, salary, 
       rank() OVER (PARTITION BY depname ORDER BY salary DESC)
    FROM empsalary;
