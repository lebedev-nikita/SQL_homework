-- read uncommitted - грязное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
--
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
END;

-- read uncommitted - потерянные изменения

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
--
UPDATE stock_control SET price = price+110 WHERE drug_store_id = 1 AND drug_class_id = 1;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
COMMIT;

SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
