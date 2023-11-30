use railway;

-- =====================================================================================
-- function checks if the email of a given user ID matches a provided email
DELIMITER //
CREATE FUNCTION ValidateUserEmail(userID_input INT, email_input VARCHAR(125))
RETURNS BOOLEAN
BEGIN
    DECLARE actual_email VARCHAR(125);
    IF userID_input IS NULL OR email_input IS NULL THEN
        RETURN FALSE;
    END IF;
    SELECT email INTO actual_email FROM Users WHERE user_id = userID_input;
    IF actual_email = email_input THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END//
DELIMITER ;

-- test
select * from Users;
SELECT user_id, ValidateUserEmail(1, 'an@gmail.com') AS email_status FROM Users
WHERE user_id = 1;
-- =====================================================================================


-- =====================================================================================
-- function used for check a promotion is valid or not
DELIMITER //
CREATE FUNCTION IsPromotionActive(promotion_name VARCHAR(125))
RETURNS BOOLEAN
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;

    IF promotion_name IS NULL THEN
        RETURN FALSE;
    END IF;

    SELECT start_valid_date, expired_date INTO start_date, end_date FROM Promotion WHERE names = promotion_name;
    IF CURRENT_DATE() BETWEEN start_date AND end_date THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END//
DELIMITER ;

-- test
select * from Promotion;
SELECT names as promotion_name, IsPromotionActive('Black Friday Sale') as status from Promotion
where names = 'Black Friday Sale';
-- =====================================================================================


-- function calculate total purchased of a customer
DELIMITER //
CREATE FUNCTION TotalCustomerPurchase(client_id_input INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2) DEFAULT 0.0;
    DECLARE cur_order_id INT;
    DECLARE cur_total DECIMAL(10,2);
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE promotionID INT;
	DECLARE promotion_type_id BOOLEAN;
	DECLARE discount_amount DECIMAL(10,2);
	DECLARE max_discount DECIMAL(10,2);
	DECLARE discount_rate DECIMAL(10,2);
    DECLARE shipmentPrice INT;

    DECLARE cur CURSOR FOR 
        SELECT o.order_id 
        FROM Orders o 
        LEFT JOIN Apply a ON o.order_id = a.order_id
        WHERE o.client_id = client_id_input;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    purchase_loop: LOOP
        FETCH cur INTO cur_order_id;
        IF done THEN
            LEAVE purchase_loop;
        END IF;

        SELECT SUM(b.current_price * c.quantity) INTO cur_total
        FROM Contain c
        JOIN Books b ON c.book_id = b.book_id
        WHERE c.order_id = cur_order_id;

        -- Determine if there is a promotion and its type
		SELECT a.promotion_id, p.promotion_type INTO promotionID, promotion_type_id
		FROM Apply a
		JOIN Promotion p ON a.promotion_id = p.promotion_id
		WHERE a.order_id = cur_order_id;
            
        IF promotionID IS NOT NULL THEN
			IF NOT promotion_type_id THEN -- FALSE for Gift
				SELECT sale_off_amount INTO discount_amount
				FROM Gift
				WHERE promotion_id = promotionID;
				SET cur_total = cur_total - cur_total * discount_amount;
			ELSE -- TRUE for Discount
				SELECT amount, max_money_sale_off INTO discount_rate, max_discount
				FROM Discount
				WHERE promotion_id = promotionID;
				SET discount_amount = LEAST(cur_total * discount_rate, max_discount);
				SET cur_total = cur_total - discount_amount;
			END IF;
		END IF;
        
		-- add shipment price
        SELECT shipment_price INTO shipmentPrice
        FROM Orders
        WHERE order_id = cur_order_id;
        SET cur_total = cur_total + shipmentPrice * 1000;
        SET total = total + cur_total;
    END LOOP;
    CLOSE cur;

    RETURN total;
END//
DELIMITER ;

-- test
SELECT TotalCustomerPurchase(1); 
SELECT * from Books;