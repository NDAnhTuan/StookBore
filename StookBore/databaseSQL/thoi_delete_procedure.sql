-- use new_schema;
-- CALL delete_Book(3);
use railway;
-- Delete Book procedure
DELIMITER //

CREATE PROCEDURE delete_Book(
  IN p_book_id INT
)
BEGIN
  DECLARE error_message VARCHAR(255);

  -- Check if book_id exists
  IF NOT EXISTS (SELECT 1 FROM Books WHERE book_id = p_book_id) THEN
    SET error_message = 'Book with the given ID does not exist';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Check if the book is referenced in other tables (foreign key constraints)
  IF EXISTS (SELECT 1 FROM Contain WHERE book_id = p_book_id) THEN
    SET error_message = 'Cannot delete the book because it is referenced in Contain table';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;
  

    IF EXISTS (SELECT 1 FROM Stock_Contains WHERE book_id = p_book_id) THEN
    SET error_message = 'Cannot delete the book because it is referenced Stock Contains table';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
  END IF;

  -- Perform the deletion
  DELETE FROM Books WHERE book_id = p_book_id;
END //

DELIMITER ;

