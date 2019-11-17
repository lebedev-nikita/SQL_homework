-- repeatable read - неповторяющееся чтение // нет

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
--
SELECT price FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 1;
END;

-- repeatable read - фантомное чтение // нет

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT drug_class_id, price FROM stock_control WHERE drug_store_id = 1;
--
SELECT drug_class_id, price FROM stock_control WHERE drug_store_id = 1;
END;


--- DELETE FROM stock_control WHERE drug_class_id = 5 AND drug_store_id = 1;