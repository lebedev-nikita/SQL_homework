-- read committed - грязное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE stock_control SET price = price + 100 WHERE drug_store_id = 1 AND drug_class_id = 1;
--
COMMIT;


-- read committed - неповторяющееся чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE stock_control SET price = price + 100 WHERE drug_store_id = 1 AND drug_class_id = 1;
COMMIT;