DROP TRIGGER IF EXISTS check_buy ON stock_control;
DROP FUNCTION IF EXISTS checkBuy;

CREATE OR REPLACE FUNCTION checkBuy() RETURNS TRIGGER AS $check_buy$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        IF (TG_LEVEL = 'ROW') THEN
            -- если пытаются купить больше, чем есть - запретить
            IF NEW.current_amount < 0 THEN  
                RAISE EXCEPTION 'NOT ENOUGH ITEMS IN STOCK: have %, needed %', OLD.current_amount, OLD.current_amount - NEW.current_amount;
            END IF;
            -- если осталось мало лекарств - заказать
            IF NEW.current_amount::FLOAT / NEW.recommended_amount < 0.25 THEN 
                IF NEW.request_date IS NULL THEN

                    NEW.request_date = current_date;
                    RAISE NOTICE 'Very few items of "%" left in stock. Contacted "%" and ordered % items of "%" ', 
                        (SELECT dc.name 
                            FROM drug_class dc
                            WHERE dc.drug_class_id = NEW.drug_class_id),
                        (SELECT m.name 
                            FROM manufacturer m, drug_class dc
                            WHERE dc.drug_class_id = NEW.drug_class_id AND 
                                  m.manufacturer_id = dc.manufacturer_id),
                        (NEW.recommended_amount - NEW.current_amount),
                        (SELECT dc.name 
                            FROM drug_class dc
                            WHERE dc.drug_class_id = NEW.drug_class_id)
                    ;
                END IF;
            END IF;
        ELSE
            RAISE NOTICE 'BAD TG_LEVEL FOR TRIGGER "check_buy"';
        END IF;
    ELSE
        RAISE NOTICE 'BAD TG_OP FOR TRIGGER "check_buy"';
    END IF;

    RETURN NEW;
END;
$check_buy$ LANGUAGE plpgsql;


CREATE TRIGGER check_buy
    BEFORE UPDATE ON stock_control
    FOR EACH ROW EXECUTE PROCEDURE checkBuy();