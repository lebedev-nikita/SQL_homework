-- какие и сколько лекарств есть в 3-ей аптеке

SELECT ds.name AS ds_name,
       dc.name AS dc_name,
       sc.current_amount AS amount
FROM stock_control sc INNER JOIN drug_store ds USING (drug_store_id)
     INNER JOIN drug_class dc USING (drug_class_id)
WHERE ds.drug_store_id = 3
ORDER BY ds.drug_store_id;
;

