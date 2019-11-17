-- зарегистрировать поступление лекарств в данную аптеку в размере 150 штук

UPDATE stock_control
SET current_amount = current_amount + 150,
    days_to_deliver = current_date - request_date + 5,
    request_date = NULL
WHERE drug_store_id = 1
      AND drug_class_id = 2
;