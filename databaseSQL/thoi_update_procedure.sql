-- CALL update_Clients(1,'zzz@gmail','Abc@123','a','b','0991122345',NULL,NULL,NULL,NUll,null,null);
-- CALL update_Employees(5,'zzz@gmail','Abc@123','a','b','0123556414',NULL,NUll,null,null);
-- CALL update_Orders(9,'Success','Fast','2023-07-13',2023,2,NULL,NULL,NULL,NULL,'Cash','2023-07-12',2,NULL,NULL);
-- CALL update_Books(  1,  NULL,   'New description',  NULL,      NULL,     NULL,    50,         NULL,       2      );


use railway;
-- use new_schema;




										-- -- -- --
										--  Users --
                                        -- -- -- --

-- Update Clients procedure
DELIMITER //
CREATE PROCEDURE update_Clients(
  IN p_user_id INT,
  IN p_email VARCHAR(125),
  IN p_password_key VARCHAR(20),
  IN p_first_name VARCHAR(125),
  IN p_last_name VARCHAR(125),
  IN p_phone_number VARCHAR(10),
  IN p_level INT,
  IN p_vip_point INT,
  IN p_street VARCHAR(100),
  IN p_district VARCHAR(100),
  IN p_city VARCHAR(100),
  IN p_country VARCHAR(100)
)
BEGIN
--   DECLARE error_message VARCHAR(255);

  -- Check if user with given ID exists
  IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "User with given ID does not exist";
  END IF;

  -- Check if email is valid
  IF NOT REGEXP_LIKE(p_email, "^[^@]+@[^@]+$") THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Email must has @";
  END IF;

  -- Check if password is valid
  IF NOT (LENGTH(p_password_key) >= 6 AND LENGTH(p_password_key) <= 20
    AND REGEXP_LIKE(p_password_key, "[0-9]+") AND REGEXP_LIKE(p_password_key, "[a-z]+")
    AND REGEXP_LIKE(p_password_key, "[A-Z]+") AND REGEXP_LIKE(p_password_key, "[^a-zA-Z0-9 ]")) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Password must be from 6 to 20 characters and includes at least a number, an uppercase and a special symbol";
  END IF;

  -- Check if phone number is valid
  IF NOT REGEXP_LIKE(p_phone_number, '^[0-9]*$') OR SUBSTRING(p_phone_number, 1, 1) != '0' OR LENGTH(p_phone_number) != 10 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Phone must be all numbers and start with 0";
  END IF;
  
      IF EXISTS (SELECT 1 FROM Users WHERE phone_number = p_phone_number) THEN
	    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "This phone is already been use";
	  END IF;
      
      
      
     -- Check if level valid
     IF NOT (clevel >= 0 AND clevel <= 6) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT =  "Level must be from 0 to 6";
	 END IF;
     
	-- Check if vip point non-negative
     IF NOT cvip_point >= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT =  "Vip point must be non-negative";
	 END IF;
  -- Update data if all validations pass
  UPDATE Users
  SET email = COALESCE(p_email, email),
      password_key = COALESCE(p_password_key, password_key),
      first_name = COALESCE(p_first_name, first_name),
      last_name = COALESCE(p_last_name, last_name),
      phone_number = COALESCE(p_phone_number, phone_number)
  WHERE user_id = p_user_id;
  
  UPDATE Clients
  SET levels = coalesce(p_level, levels),
	  vip_point = coalesce(p_vip_point, vip_point)
  WHERE user_id = p_user_id;
  
  UPDATE users_address
  SET 
      street = COALESCE(p_street, street),
      district = COALESCE(p_district, district),
      city = COALESCE(p_city, city),
      country = COALESCE(p_country, country)
  WHERE user_id = p_user_id;
  

END;
//
DELIMITER



-- Update Employee procedure
DELIMITER //
CREATE PROCEDURE update_Employees(
  IN p_user_id INT,
  IN p_email VARCHAR(125),
  IN p_password_key VARCHAR(20),
  IN p_first_name VARCHAR(125),
  IN p_last_name VARCHAR(125),
  IN p_phone_number VARCHAR(10),
  IN p_street VARCHAR(100),
  IN p_district VARCHAR(100),
  IN p_city VARCHAR(100),
  IN p_country VARCHAR(100)
)
BEGIN
--   DECLARE error_message VARCHAR(255);

  -- Check if user with given ID exists
  IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "User with given ID does not exist";
  END IF;

  -- Check if email is valid
  IF NOT REGEXP_LIKE(p_email, "^[^@]+@[^@]+$") THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Email must has @";
  END IF;

  -- Check if password is valid
  IF NOT (LENGTH(p_password_key) >= 6 AND LENGTH(p_password_key) <= 20
    AND REGEXP_LIKE(p_password_key, "[0-9]+") AND REGEXP_LIKE(p_password_key, "[a-z]+")
    AND REGEXP_LIKE(p_password_key, "[A-Z]+") AND REGEXP_LIKE(p_password_key, "[^a-zA-Z0-9 ]")) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Password must be from 6 to 20 characters and includes at least a number, an uppercase and a special symbol";
  END IF;

  -- Check if phone number is valid
  IF NOT REGEXP_LIKE(p_phone_number, '^[0-9]*$') OR SUBSTRING(p_phone_number, 1, 1) != '0' OR LENGTH(p_phone_number) != 10 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "Phone must be all numbers and start with 0";
  END IF;
  
      IF EXISTS (SELECT 1 FROM Users WHERE phone_number = p_phone_number) THEN
	    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  "This phone is already been use";
	  END IF;

  -- Update data if all validations pass
  UPDATE Users
  SET email = COALESCE(p_email, email),
      password_key = COALESCE(p_password_key, password_key),
      first_name = COALESCE(p_first_name, first_name),
      last_name = COALESCE(p_last_name, last_name),
      phone_number = COALESCE(p_phone_number, phone_number)
  WHERE user_id = p_user_id;
  
  UPDATE users_address
  SET 
      street = COALESCE(p_street, street),
      district = COALESCE(p_district, district),
      city = COALESCE(p_city, city),
      country = COALESCE(p_country, country)
  WHERE user_id = p_user_id;
  

END;
//
DELIMITER


										-- -- -- --
										--  Orders --
                                        -- -- -- --

-- Update Order procedure
DELIMITER //

CREATE PROCEDURE update_Orders(
  IN p_order_id INT,
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

  -- Check order id exists
  IF NOT EXISTS (SELECT 1 FROM Orders WHERE order_id = p_order_id) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT =  "Order with given ID does not exist";
  END IF;

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

  -- Update data if all validations pass
  UPDATE Orders
  SET 
    order_status = COALESCE(p_order_status, order_status),
    shipment_method = COALESCE(p_shipment_method, shipment_method),
    shipment_date = COALESCE(p_shipment_date, shipment_date),
    shipment_price = COALESCE(p_shipment_price, shipment_price),
    shipment_status = COALESCE(p_shipment_status, shipment_status),
    street = COALESCE(p_street, street),
    district = COALESCE(p_district, district),
    city = COALESCE(p_city, city),
    country = COALESCE(p_country, country),
    payment_method = COALESCE(p_payment_method, payment_method),
    paid_date = COALESCE(p_paid_date, paid_date),
    client_id = COALESCE(p_client_id, client_id)
  WHERE order_id = p_order_id;

  -- Check if book_id exists 
  IF p_book_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Books WHERE book_id = p_book_id) THEN
    SET error_message = 'Invalid book_id';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if quantity is non-negative
  IF p_quantity IS NOT NULL AND NOT (p_quantity >= 0) THEN
    SET error_message = 'Quantity must be non-negative';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Update Contain table
  UPDATE Contain
  SET 
    book_id = COALESCE(p_book_id, book_id),
    quantity = COALESCE(p_quantity, quantity)
  WHERE order_id = p_order_id;

END;
//
DELIMITER
										-- -- -- --
										--  Books --
                                        -- -- -- --


DELIMITER //

CREATE PROCEDURE update_Books(
  IN p_book_id INT,
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

  -- Check if book_id exists
  IF NOT EXISTS (SELECT 1 FROM Books WHERE book_id = p_book_id) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Book with given ID does not exist';
  END IF;

  -- Check if title is valid
  IF LENGTH(p_title) > 255 THEN
    SET error_message = 'Title must be at most 255 characters';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if descriptions is valid
  IF LENGTH(p_descriptions) > 255 THEN
    SET error_message = 'Descriptions must be at most 255 characters';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if publisher is valid
  IF LENGTH(p_publisher) > 255 THEN
    SET error_message = 'Publisher must be at most 255 characters';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if author is valid
  IF LENGTH(p_author) > 255 THEN
    SET error_message = 'Author must be at most 255 characters';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if stock is valid
  IF p_stock < 0 THEN
    SET error_message = 'Stock must be non-negative';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if current_price is valid
  IF p_current_price <= 0 THEN
    SET error_message = 'Current price must be greater than 0';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if edition_version is valid
  IF p_edition_version < 0 THEN
    SET error_message = 'Edition version must be non-negative';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if category_id exists
  IF NOT EXISTS (SELECT 1 FROM Category WHERE category_id = p_category_id) THEN
    SET error_message = 'Invalid category_id';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Update data if all validations pass
  UPDATE Books
  SET 
    title = COALESCE(p_title, title),
    descriptions = COALESCE(p_descriptions, descriptions),
    publisher = COALESCE(p_publisher, publisher),
    author = COALESCE(p_author, author),
    stock = COALESCE(p_stock, stock),
    current_price = COALESCE(p_current_price, current_price),
    edition_version = COALESCE(p_edition_version, edition_version),
    category_id = COALESCE(p_category_id, category_id)
  WHERE book_id = p_book_id;
END;

