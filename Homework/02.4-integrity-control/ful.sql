UPDATE stock_control
SET current_amount = 303, request_date = NULL
WHERE drug_store_id = 1 
      AND drug_class_id = 1
;
