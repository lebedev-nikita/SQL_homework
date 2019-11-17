-- read uncommitted - грязное чтение

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
UPDATE stock_control SET price = price + 100 WHERE drug_store_id = 1 AND drug_class_id = 1;
--
COMMIT;


-- read uncommitted - потерянные изменения

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
UPDATE stock_control SET price = price+120 WHERE drug_store_id = 1 AND drug_class_id = 1;
--
COMMIT;
