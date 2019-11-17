-- сколько есть лекарств данного типа в данной аптеке?

SELECT 
       sc.current_amount, 
       ds.name AS ds_name, 
       dc.name AS dc_name
FROM stock_control sc INNER JOIN drug_store ds USING (drug_store_id)
     INNER JOIN drug_class dc USING (drug_class_id)
-- WHERE dc.drug_class_id = 4
      -- AND ds.drug_store_id = 5
;