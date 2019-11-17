-- какие лекарства доставляются в аптки из других городов

SELECT ds.name AS ds_name,
       dc.name AS dc_name, 
       ds.city AS ds_city,
       prov.city AS prov_city
FROM stock_control sc INNER JOIN drug_class dc USING (drug_class_id)
     INNER JOIN drug_store ds USING (drug_store_id)
     INNER JOIN provisioner prov USING (provisioner_id)
WHERE ds.city != prov.city
ORDER BY ds.name
;