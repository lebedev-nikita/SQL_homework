-- удалить из ассортимента аптеки с id 7 все виды лекарств, которых в ней нет и не рекомендуется иметь

DELETE FROM stock_control 
WHERE drug_store_id = 7 
      AND recommended_amount = 0
      AND current_amount = 0
;