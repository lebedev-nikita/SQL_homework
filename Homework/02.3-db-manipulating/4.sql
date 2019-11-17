-- Каких лекарств не хватает, где их заказать и куда везти

SELECT prov.email AS prov_email, 
       ds.name AS ds_name, 
       ds.city AS ds_city, 
       ds.address AS ds_address, 
       dc.name AS dc_name,
       sc.recommended_amount - sc.current_amount AS amount_to_send
FROM stock_control sc INNER JOIN drug_class dc USING (drug_class_id) 
     INNER JOIN drug_store ds USING (drug_store_id)
     INNER JOIN provisioner prov USING (provisioner_id)
WHERE sc.current_amount < sc.recommended_amount/2 
      AND drug_store_id = 1
      AND request_date IS NULL
       OR current_date - request_date > days_to_deliver
ORDER BY ds.drug_store_id, prov.provisioner_id
;