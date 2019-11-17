-- сообщить о заказе нескольких видов лекарств в данную аптеку (просто установить дату заказа)

UPDATE stock_control
SET request_date = current_date
WHERE drug_store_id = 1
      AND
         drug_class_id = 1
      OR drug_class_id = 2
      OR drug_class_id = 4
;