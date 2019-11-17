INSERT INTO drug_store (drug_store_id, name, email, phone, city, address) VALUES (1, 'zdorovye', 'zdorovye@gmail.com', '322-22-33', 'Moscow', 'Lomonosovsky pr-t, 27/11');
INSERT INTO drug_store VALUES (2,  'bodrost365', 'bodrost365@gmail.com', '232-32-22', 'Moscow', 'Red Square, 33');
INSERT INTO drug_store VALUES (3,  'happiness', 'happiness@gmail.com', '334-35-99', 'Moscow', 'Vernadskogo pr-t, 11');
INSERT INTO drug_store VALUES (4,  'stay alive', 'stay_alive@gmail.com', '111-45-32', 'Saint Petersburg', 'Lenina, 17');
INSERT INTO drug_store VALUES (5,  'apteka', 'apteka@yandex.ru', '332-11-85', 'Magnitogorsk', 'Zeleniy per, 19');
INSERT INTO drug_store VALUES (6,  'pills for you', 'pills_for_you@mail.ru', '245-67-89', 'Magnitogorsk', 'Severnaya, 12');
INSERT INTO drug_store VALUES (7,  'Lubavushka', 'Lubavushka@yandex.ru', '123-45-67', 'Magnitogorsk', 'Yuzhnaya, 32');
INSERT INTO drug_store VALUES (8,  'bodrost', 'bodrost@mail.ru', '332-11-32', 'Saint Petersburg', 'Nevsky pr-t, 12');
INSERT INTO drug_store VALUES (9,  'happy', 'happiness@yandex.ru', '265-34-65', 'Novokuznetsk', 'Vaynera, 2' );
INSERT INTO drug_store VALUES (10, 'jivika', 'jivika@gmail.com', '222-11-33', 'Moscow', 'Vernadskogo pr-t, 12');


INSERT INTO manufacturer (manufacturer_id, name, email, phone, city, address) VALUES (1, 'Bayer', 'bayer@gmail.com', '334-33-21', 'New York', '17-th avenue, 84');
INSERT INTO manufacturer VALUES (2, 'Unifarm', 'unifarm@gmail.com','441-32-11', 'London', 'Baker street, 221b');
INSERT INTO manufacturer VALUES (3, 'Tengger cavalry', 'tenger_cavalry@yandex.ru', '321-54-76', 'Gobi desert', 'third barkhan from the oasis' );
INSERT INTO manufacturer VALUES (4, 'oneFarm', 'onefarm@yandex.ru', '211-45-87', 'Petrozavodsk', 'Lenina,3');
INSERT INTO manufacturer VALUES (5, 'naturalPills', 'naturalPills@mail.ru', '543-45-67', 'Novokuznetsk', 'Bunina, 12b');
INSERT INTO manufacturer VALUES (6, 'rosgosfarm', 'rosgosfarm@yandex.ru', '789-76-76', 'Ivanovo', 'Pochtovaya, 21');
INSERT INTO manufacturer VALUES (7, 'medicine', 'medicine@gmail.com', '123-32-10', 'Reykyavik', 'Midborg, 12' );


INSERT INTO provisioner (provisioner_id, name, email, phone, city, address) VALUES (1, 'medstock1', 'medstock1@gmail.com', '8-800-555-35-35', 'Moscow', 'Michurinsky pr-t, 73' );
INSERT INTO provisioner VALUES (2, 'medstock2', 'medstock2@yandex.ru', '+7-916-350-80-79', 'Moscow', 'Karetnaya, 15');
INSERT INTO provisioner VALUES (3, 'medsklad', 'medsklad@yandex.ru', '543-21-35', 'Novokuznetsk', 'Smakovaya, 2' );
INSERT INTO provisioner VALUES (4, 'drugprov', 'drugprov@mail.ru', '333-22-11', 'Magnitogorsk', 'Konnaya, 102a' );
INSERT INTO provisioner VALUES (5, 'ip ivanov ivan ivanich', 'ivan_ivanich@mail.ru', '123-32-10', 'Saint Petersburg', 'aptechnaya, 4' );
INSERT INTO provisioner VALUES (6, 'delivery sklad', 'delivery_sklad@gmail.com', '111-22-33', 'Novokuznetsk', '8 marta, 38' );
INSERT INTO provisioner VALUES (7, 'med_delivery', 'med_delivery@mail.ru', '221-22-12', 'Novokuznetsk', 'Inzhirnaya, 44' );
INSERT INTO provisioner VALUES (8, 'ooo med_tov_sell', 'med_tov_sell@yandex.ru', '222-22-22', 'Saint Petersburg', 'Bronnaya, 43a' );


INSERT INTO drug_class (drug_class_id, name, form, manufacturer_id, 
                        amount_in_package, indications, contraindications, active_ingredients, shelf_life)
    VALUES (1, 'Komplivit vitamins 60', 'pills', 4,
            60, 'Hypovitaminosis', 'Individual intolerance', 'vitamins A, B, C', '1 year');
INSERT INTO drug_class  
    VALUES (2, 'Komplivit vitamins 30', 'pills', 4,
            30, 'Hypovitaminosis', 'Individual intolerance', 'vitamins A, B, C', '1 year');
INSERT INTO drug_class  
    VALUES (3, 'Novokain', 'ampulas', 6,
            12, 'Local pain', 'Hipersensitivity', 'Hydrochloride', '3 years');
INSERT INTO drug_class  
    VALUES (4, 'Blend-a-med', 'paste', 3,
            1, 'sensitive teeth', 'Individual intolerance', 'sorbitol, PEG-6, Hydrated Silica, Tetrapotassium Pyrophosphate', '2 years, 6 months');
INSERT INTO drug_class  
    VALUES (5, 'mustard plaster', 'skin patch', 7,
            18, 'any illness', 'no', 'mustard', '1 year');
INSERT INTO drug_class  
    VALUES (6, 'Tera-flu', 'suspension', 2,
            1, 'cough, sore throat', 'Individual intolerance', 'paracetamol, fenilefrin, feniramin', '1 year, 6 months');
INSERT INTO drug_class  
    VALUES (7, 'Heptral', 'pills', 1,
            36, 'liver problevs', 'bipolar disorder', 'ademetionite', '3 years');
INSERT INTO drug_class  
    VALUES (8, 'Nauralica', 'pills', 5,
            36, 'Hypovitaminosis', 'Individual intolerance', 'natural vitamins', '6 months');

-- 1
INSERT INTO stock_control (drug_store_id, 
                           drug_class_id, 
                           provisioner_id,
                           price, current_amount, recommended_amount, request_date, days_to_deliver)
    VALUES ( 1, -- 'zdorovye'
             1, -- 'Komplivit vitamins 60'
             7,
             699.99, 121, 500, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 1, -- 'zdorovye'
             2, -- 'Komplivit vitamins 30'
             1,
             499.99, 375, 800, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 1, -- 'zdorovye'
             3, -- 'Novokain'
             2,
             399.99, 143, 200, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 1, -- 'zdorovye'
             4, -- 'Blend-a-med'
             2,
             119.99, 111, 300, NULL, DEFAULT );
-- 2
INSERT INTO stock_control 
    VALUES ( 2, -- 'bodrost365'
             5, -- 'mustard plaster'
             2,
             99.99, 200, 200, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 2, -- 'bodrost365'
             6, -- 'Tera-flu'
             6,
             349.99, 333, 400, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 2, -- 'bodrost365'
             7, -- 'Heptral'
             1,
             1399.99, 17, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 2, -- 'bodrost365'
             8, -- 'Nauralica'
             1,
             449.99, 46, 100, NULL, DEFAULT) ;
-- 3
INSERT INTO stock_control 
    VALUES ( 3, -- 'happiness'
             6, -- 'Tera-flu'
             1,
             349.99, 333, 480, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 3, -- 'happiness'
             3, -- 'Novokain'
             5,
             1399.99, 87, 150, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 3, -- 'happiness'
             8, -- 'Nauralica'
             1,
             349.99, 87, 100, NULL, DEFAULT );
-- 4
INSERT INTO stock_control 
    VALUES ( 4, -- 'stay alive'
             5, -- 'mustard plaster'
             8,
             99.99, 20, 200, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 4, -- 'stay alive'
             3, -- 'Novokain'
             8,
             349.99, 133, 400, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 4, -- 'stay alive'
             7, -- 'Heptral'
             3,
             1399.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 4, -- 'stay alive'
             8, -- 'Nauralica'
             5,
             349.99, 37, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 4, -- 'stay alive'
             2, -- 'Komplivit vitamins 30'
             5,
             349.99, 47, 100, NULL, DEFAULT );
-- 5
INSERT INTO stock_control 
    VALUES ( 5, -- 'apteka'
             4, -- 'Blend-a-med'
             4,
             99.99, 111, 200, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 5, -- 'apteka'
             6, -- 'Tera-flu'
             2,
             349.99, 333, 400, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 5, -- 'apteka'
             7, -- 'Heptral'
             4,
             1399.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 5, -- 'apteka'
             8, -- 'Nauralica'
             4,
             349.99, 57, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 5, -- 'apteka'
             2, -- 'Komplivit vitamins 30'
             1,
             349.99, 41, 100, NULL, DEFAULT );
-- 6
INSERT INTO stock_control 
    VALUES ( 6, -- 'pills for you'
             8, -- 'Nauralica'
             4,
             349.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 6, -- 'pills for you'
             3, -- 'Novokain'
             4,
             849.99, 16, 180, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 6, -- 'pills for you'
             4, -- 'Blend-a-med'
             4,
             129.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 6, -- 'pills for you'
             1, -- 'Komplivit vitamins 60'
             4,
             749.99, 380, 1000, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 6, -- 'pills for you'
             2, -- 'Komplivit vitamins 30'
             6,
             899.99, 71, 150, NULL, DEFAULT );
-- 7
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             8, -- 'Nauralica'
             4,
             349.99, 27, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             3, -- 'Novokain'
             8,
             849.99, 97, 180, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             4, -- 'Blend-a-med'
             4,
             129.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             1, -- 'Komplivit vitamins 60'
             4,
             749.99, 800, 1000, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             2, -- 'Komplivit vitamins 30'
             4,
             899.99, 111, 150, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 7, -- 'Lubavushka'
             5, -- 'mustard plaster'
             4,
             899.99, 0, 0, NULL, DEFAULT );
-- 8
INSERT INTO stock_control 
    VALUES ( 8, -- 'bodrost'
             8, -- 'Nauralica'
             1,
             349.99, 27, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 8, -- 'bodrost'
             3, -- 'Novokain'
             8,
             849.99, 89, 180, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 8, -- 'bodrost'
             4, -- 'Blend-a-med'
             5,
             129.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 8, -- 'bodrost'
             1, -- 'Komplivit vitamins 60'
             8,
             749.99, 800, 1000, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 8, -- 'bodrost'
             2, -- 'Komplivit vitamins 30'
             5,
             899.99, 111, 150, NULL, DEFAULT );
-- 9
INSERT INTO stock_control 
    VALUES ( 9, -- 'happy'
             8, -- 'Nauralica'
             3,
             349.99, 37, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 9, -- 'happy'
             3, -- 'Novokain'
             6,
             849.99, 97, 180, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 9, -- 'happy'
             4, -- 'Blend-a-med'
             7,
             129.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 9, -- 'happy'
             1, -- 'Komplivit vitamins 60'
             2,
             749.99, 800, 1000, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 9, -- 'happy'
             2, -- 'Komplivit vitamins 30'
             6,
             899.99, 111, 150, NULL, DEFAULT );

-- 10
INSERT INTO stock_control 
    VALUES ( 10, -- 'jivika'
             5, -- 'mustard plaster'
             2,
             99.99, 200, 200, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 10, -- 'jivika'
             6, -- 'Tera-flu'
             1,
             349.99, 333, 400, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 10, -- 'jivika'
             7, -- 'Heptral'
             4,
             1399.99, 87, 100, NULL, DEFAULT );
INSERT INTO stock_control 
    VALUES ( 10, -- 'jivika'
             8, -- 'Nauralica'
             1,
             349.99, 87, 100, NULL, DEFAULT );

-- Последовательности