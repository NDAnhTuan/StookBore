-- CALL insert_Employee('a@aa','Abc@123','a','b','0112233445',TRUE,'aa','bb','cc','Viet Nam');
-- CALL insert_Clients('a@aa','Abc@123','a','b','0112233445',FALSE,0,0,'aa','bb','cc','Viet Nam');
-- CALL insert_Order('Success','Fast','2023-11-01',10,2,'stt','aa','bb','Viet Nam','Cash','2023-10-29',17,2,3);
-- CALL insert_Books('Aaa','hihi','tao','jk',10,10000,7,3);
-- use new_schema;
use railway;
										-- -- -- --
										-- 	Users --
                                        -- -- -- --


-- Insert Clients procedure
DELIMITER //
CREATE PROCEDURE insert_Clients(
  IN cemail VARCHAR(125),
  IN cpassword_key VARCHAR(20),
  IN cfirst_name VARCHAR(125),
  IN clast_name VARCHAR(125),
  IN cphone_number VARCHAR(10),
  IN cuser_type BOOLEAN,
  IN clevel INT,
  IN cvip_point INT,
  IN cstreet VARCHAR(100),
  IN cdistrict VARCHAR(100),
  IN ccity VARCHAR(100),
  IN ccountry VARCHAR(100)
)
BEGIN
  DECLARE last_user_id INT;
  
  -- Check if email is valid
  IF NOT REGEXP_LIKE(cemail, "^[^@]+@[^@]+$") THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Email must has @";
  END IF;

  -- Check if password is valid
  IF NOT (LENGTH(cpassword_key) >= 6 AND LENGTH(cpassword_key) <= 20
    AND REGEXP_LIKE(cpassword_key, "[0-9]+") AND REGEXP_LIKE(cpassword_key, "[a-z]+")
    AND REGEXP_LIKE(cpassword_key, "[A-Z]+") AND REGEXP_LIKE(cpassword_key, "[^a-zA-Z0-9 ]")) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Password must be from 6 to 20 characters and includes at least a number, an uppercase and a special symbol";
  END IF;

  -- Check if phone number is valid
  IF NOT REGEXP_LIKE(cphone_number, '^[0-9]*$') OR SUBSTRING(cphone_number, 1, 1) != '0' OR LENGTH(cphone_number) != 10 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Phone must be all numbers and start with 0";
  END IF;
  
  -- Check if user type is valid
	 IF NOT cuser_type = FALSE THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT =  "Client user type must be FALSE";
	 END IF;
     
 -- Insert data if all validations pass
  INSERT INTO Users (email, password_key, first_name, last_name, phone_number, user_type)
  VALUES (cemail, cpassword_key, cfirst_name, clast_name, cphone_number, cuser_type);
  
  SET last_user_id = LAST_INSERT_ID();
  
  INSERT INTO Users_Address (user_id, street, district, city, country)
  VALUES (last_user_id, cstreet, cdistrict, ccity, ccountry);
  

	INSERT INTO Clients (user_id, levels, vip_point) VALUES (last_user_id, clevel, cvip_point);
  
END;
//
DELIMITER


-- Insert Employees procedure
DELIMITER //
CREATE PROCEDURE insert_Employee(
  IN cemail VARCHAR(125),
  IN cpassword_key VARCHAR(20),
  IN cfirst_name VARCHAR(125),
  IN clast_name VARCHAR(125),
  IN cphone_number VARCHAR(10),
  IN cuser_type BOOLEAN,
  IN cstreet VARCHAR(100),
  IN cdistrict VARCHAR(100),
  IN ccity VARCHAR(100),
  IN ccountry VARCHAR(100)
)
BEGIN
  DECLARE last_user_id INT;
  
  -- Check if email is valid
  IF NOT REGEXP_LIKE(cemail, "^[^@]+@[^@]+$") THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Email must has @";
  END IF;

  -- Check if password is valid
  IF NOT (LENGTH(cpassword_key) >= 6 AND LENGTH(cpassword_key) <= 20
    AND REGEXP_LIKE(cpassword_key, "[0-9]+") AND REGEXP_LIKE(cpassword_key, "[a-z]+")
    AND REGEXP_LIKE(cpassword_key, "[A-Z]+") AND REGEXP_LIKE(cpassword_key, "[^a-zA-Z0-9 ]")) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Password must be from 6 to 20 characters and includes at least a number, an uppercase and a special symbol";
  END IF;

  -- Check if phone number is valid
  IF NOT REGEXP_LIKE(cphone_number, '^[0-9]*$') OR SUBSTRING(cphone_number, 1, 1) != '0' OR LENGTH(cphone_number) != 10 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Phone must be all numbers and start with 0";
  END IF;
  
  -- Check if user type is valid
	 IF NOT cuser_type = TRUE THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT =  "Employee user type must be TRUE";
	 END IF;
     
 -- Insert data if all validations pass
  INSERT INTO Users (email, password_key, first_name, last_name, phone_number, user_type)
  VALUES (cemail, cpassword_key, cfirst_name, clast_name, cphone_number, cuser_type);
  
  SET last_user_id = LAST_INSERT_ID();
  
  INSERT INTO Users_Address (user_id, street, district, city, country)
  VALUES (last_user_id, cstreet, cdistrict, ccity, ccountry);
  

	INSERT INTO Employees (user_id) VALUES (last_user_id);
  
END;
//
DELIMITER



										-- -- -- --
										-- 	Orders --
                                        -- -- -- --
-- Insert Orders procedure
DELIMITER //

CREATE PROCEDURE insert_Order(
  IN p_order_status VARCHAR(50),
  IN p_shipment_method VARCHAR(20),
  IN p_shipment_date DATE,
  IN p_shipment_price INT,
  IN p_shipment_status INT,
  IN p_street VARCHAR(255),
  IN p_district VARCHAR(255),
  IN p_city VARCHAR(255),
  IN p_country VARCHAR(255),
  IN p_payment_method VARCHAR(20),
  IN p_paid_date DATE,
  IN p_client_id INT,
  IN p_book_id INT,
  IN p_quantity INT
)
BEGIN
  DECLARE error_message VARCHAR(255);
  DECLARE last_order_id INT;

  -- Check if order status is valid
  IF NOT (p_order_status IN ('Fail', 'Success', 'Processing')) THEN
    SET error_message = 'Order status must be one of three values: Fail / Success / Processing';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if shipment method is valid
  IF NOT (p_shipment_method IN ('Normal', 'Fast', 'Flash')) THEN
    SET error_message = 'Shipment method must be one of three values: Normal / Fast / Flash';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if shipment date is valid
  IF p_shipment_date IS NULL THEN
    SET error_message = 'Shipment date cannot be null';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if shipment price is valid
  IF NOT (p_shipment_price >= 0) THEN
    SET error_message = 'Shipment price must be non-negative';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if shipment status is valid
  IF NOT (p_shipment_status IN (0, 1, 2, 3)) THEN
    SET error_message = 'Shipment status must be one of four values: 0 / 1 / 2 / 3';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if payment method is valid
  IF NOT (p_payment_method IN ('Internet Banking', 'Cash')) THEN
    SET error_message = 'Payment method must be one of two values: Internet Banking / Cash';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if paid date is valid
  IF p_paid_date IS NOT NULL AND p_paid_date > p_shipment_date THEN
    SET error_message = 'Paid date must be on or before shipment date';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if client_id exists 
  IF NOT EXISTS (SELECT 1 FROM Clients WHERE user_id = p_client_id) THEN
    SET error_message = 'Invalid client_id';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;
  
    -- Check if book_id exists 
  IF NOT EXISTS (SELECT 1 FROM Books WHERE book_id = p_book_id) THEN
    SET error_message = 'Invalid book_id';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;
  
  IF NOT (p_quantity >= 0) THEN
    SET error_message = 'Quantity must be non-negative';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- If all validations pass, insert data into Orders table
  INSERT INTO Orders (
    order_status, shipment_method, shipment_date, shipment_price, shipment_status,
    street, district, city, country, payment_method, paid_date, client_id
  ) VALUES (
    p_order_status, p_shipment_method, p_shipment_date, p_shipment_price, p_shipment_status,
    p_street, p_district, p_city, p_country, p_payment_method, p_paid_date, p_client_id
  );
  
  SET last_order_id = LAST_INSERT_ID();
  INSERT INTO Contain ( order_id, book_id, quantity ) VALUES (last_order_id, p_book_id, p_quantity);

END;
//
DELIMITER 

										-- -- -- --
										--  Books --
                                        -- -- -- --
DELIMITER //
CREATE PROCEDURE insert_Books(
    IN p_title VARCHAR(255),
    IN p_descriptions VARCHAR(255),
    IN p_publisher VARCHAR(255),
    IN p_author VARCHAR(255),
    IN p_stock INT,
    IN p_current_price INT,
    IN p_edition_version INT,
    IN p_category_id INT
)
BEGIN
    DECLARE error_message VARCHAR(255);
    DECLARE last_book_id INT;

    -- Check if title is not null and within the length limit
    IF p_title IS NULL OR LENGTH(p_title) > 255 THEN
        SET error_message = 'Title must be less than 255 characters';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if descriptions are not null and within the length limit
    IF p_descriptions IS NULL OR LENGTH(p_descriptions) > 255 THEN
        SET error_message = 'Descriptions must be less than 255 characters';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if publisher is not null and within the length limit
    IF p_publisher IS NULL OR LENGTH(p_publisher) > 255 THEN
        SET error_message = 'Publisher must be less than 255 characters';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if author is not null and within the length limit
    IF p_author IS NULL OR LENGTH(p_author) > 255 THEN
        SET error_message = 'Author must be less than 255 characters';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if stock is non-negative
    IF p_stock < 0 THEN
        SET error_message = 'Stock must be non-negative';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if current_price is positive
    IF p_current_price <= 0 THEN
        SET error_message = 'Current price must be positive';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if edition_version is non-negative
    IF p_edition_version < 0 THEN
        SET error_message = 'Edition version must be non-negative';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if category_id exists (assuming there's a Category table with category_id)
    IF NOT EXISTS (SELECT 1 FROM Category WHERE category_id = p_category_id) THEN
        SET error_message = 'Invalid category_id';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- If all validations pass, insert data into Books table
    INSERT INTO Books (title, descriptions, publisher, author, stock, current_price, edition_version, category_id)
    VALUES (p_title, p_descriptions, p_publisher, p_author, p_stock, p_current_price, p_edition_version, p_category_id);
    
    SET last_book_id = LAST_INSERT_ID();
    
    INSERT INTO Author_Dept (book_id, author) VALUES (last_book_id, p_author);
    

END;

