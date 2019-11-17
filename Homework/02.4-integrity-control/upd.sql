UPDATE stock_control
-- SET current_amount = current_amount - 1
SET current_amount = current_amount - 100
-- SET current_amount = current_amount - 1000
WHERE drug_store_id = 1 
      AND drug_class_id = 1
;
