-- read committed - грязное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
--
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
END;

-- read committed - неповторяющееся чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
--
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
END;
