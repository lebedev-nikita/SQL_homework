-- serializable - фантомное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT drug_class_id, price FROM stock_control WHERE drug_store_id = 1;
--
SELECT drug_class_id, price FROM stock_control WHERE drug_store_id = 1;
COMMIT;