-- repeatable read - неповторяющееся чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE stock_control SET price = price + 100 WHERE drug_store_id = 1 AND drug_class_id = 1;
COMMIT;



-- repeatable read - фантомное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO stock_control (drug_store_id, 
                           drug_class_id, 
                           provisioner_id,
                           price, current_amount, recommended_amount, request_date, days_to_deliver)
    VALUES ( 1, -- 'zdorovye'
             5, -- 'mustard plaster'
             7,
             699.99, 121, 500, NULL, DEFAULT );
END;