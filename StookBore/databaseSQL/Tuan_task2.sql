use railway;
-- Phương án 2
DROP TABLE IF EXISTS grand_total_view;
DROP TRIGGER IF EXISTS order_update_grand_total;
DROP TRIGGER IF EXISTS check_promotion_validity;


CREATE TEMPORARY TABLE grand_total_view (
	order_id INT NOT NULL,
    sub_total INT NOT NULL, 
	grand_total INT NOT NULL
);


SELECT *
   FROM grand_total_view;
  
 delimiter // 
CREATE TRIGGER order_update_grand_total
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
DECLARE temp INT DEFAULT 0;
DECLARE ship_temp DOUBLE DEFAULT 0;
SET temp = (
	SELECT SUM(current_price * quantity)
    FROM Contain
    INNER JOIN Books ON Contain.book_id = Books.book_id
    WHERE Contain.order_id = NEW.order_id);

SET ship_temp = (
	SELECT
		shipment_price
	FROM Orders WHERE order_id = NEW.order_id);
	INSERT INTO grand_total_view (order_id, sub_total, grand_total)
    VALUES ( NEW.order_id, temp, temp + ship_temp);
END //
delimiter ;

delimiter // 

CREATE TRIGGER check_promotion_validity 
AFTER INSERT ON Apply
FOR EACH ROW
BEGIN
    DECLARE valid_date BOOLEAN;
    SET valid_date = (
		SELECT
        start_valid_date <= current_date AND expired_date >= current_date
		FROM Promotion WHERE promotion_id = NEW.promotion_id);

    IF valid_date THEN
		BEGIN
			DECLARE check_type BOOLEAN;
            DECLARE ship_temp DOUBLE DEFAULT 0;
            
            SET ship_temp = (SELECT
				shipment_price
			 FROM Orders WHERE order_id = NEW.order_id);
             
            SET check_type = (SELECT
				promotion_type 
			 FROM Promotion WHERE promotion_id = NEW.promotion_id);
            IF NOT check_type THEN
				BEGIN
					DECLARE amount_grant DOUBLE DEFAULT 0;
                    DECLARE grant_temp DOUBLE DEFAULT 0;
                    
                    SET amount_grant = (
                    SELECT
						sale_off_amount
						FROM Gift WHERE promotion_id = NEW.promotion_id AND number_of_use > times_used);
					SET grant_temp = (
                    SELECT
						sub_total*(1 - amount_grant) + ship_temp
					FROM grand_total_view WHERE order_id = NEW.order_id);

                    UPDATE  grand_total_view
                    SET grand_total = grant_temp
                    WHERE order_id = NEW.order_id;
                END;
			ELSE
				BEGIN
					DECLARE amount_grant DOUBLE DEFAULT 0;
                    DECLARE max_amount_grant DOUBLE DEFAULT 0;
                    DECLARE grant_temp DOUBLE DEFAULT 0;
                    SET amount_grant = (
                    SELECT
						amount
						FROM Discount WHERE promotion_id = NEW.promotion_id);
					SET max_amount_grant = (
                    SELECT
						max_money_sale_off
						FROM Discount WHERE promotion_id = NEW.promotion_id);
					SET grant_temp = (
                    SELECT
						IF(sub_total*amount_grant > max_amount_grant, sub_total - max_amount_grant + ship_temp, sub_total*(1-amount_grant) + ship_temp)
					FROM grand_total_view WHERE order_id = NEW.order_id);
					
                    UPDATE  grand_total_view
                    SET grand_total = (grant_temp)
                    WHERE order_id = NEW.order_id;
                END;
			END IF;
        END;
    END IF;
END; //

delimiter ;
