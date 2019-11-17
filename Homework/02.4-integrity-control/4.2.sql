-- repeatable read - фантомное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM stock_control WHERE drug_store_id = 1 AND drug_class_id = 2;
END;