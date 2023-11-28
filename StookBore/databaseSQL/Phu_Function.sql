Use sql12665582;

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

select * from Promotion;
SELECT names as promotion_name, IsPromotionActive('Black Friday Sale') as status from Promotion
where names = 'Black Friday Sale';
-- =====================================================================================
