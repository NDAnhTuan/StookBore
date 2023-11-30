use new_schema;
-- use railway;

CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(125) NOT NULL CHECK(LENGTH(email) <= 125 AND REGEXP_LIKE(email, "^[^@]+@[^@]+$") = TRUE) ,
    password_key VARCHAR(20) NOT NULL CHECK(LENGTH(password_key) >= 6 
                                    AND LENGTH(password_key) <= 20
                                    AND REGEXP_LIKE(password_key, "[0-9]+") = TRUE 
                                    AND REGEXP_LIKE(password_key, "[a-z]+") = TRUE
                                    AND REGEXP_LIKE(password_key, "[A-Z]+") = TRUE
                                    AND REGEXP_LIKE(password_key, "[^a-zA-Z0-9 ]") = TRUE),
    first_name VARCHAR(125) NOT NULL CHECK(LENGTH(first_name) <= 125) ,
    last_name VARCHAR(125) NOT NULL CHECK(LENGTH(last_name) <= 125) ,
    phone_number VARCHAR(10) NOT NULL CHECK(REGEXP_LIKE(phone_number, '^[0-9]*$') AND SUBSTRING(phone_number, 1, 1) = '0' AND LENGTH(phone_number) = 10),
--     If the user_type is TRUE means it is Employee, else it is Clients
    user_type BOOLEAN NOT NULL CHECK(user_type IN (TRUE, FALSE)),
    PRIMARY KEY (user_id)
) AUTO_INCREMENT = 0;

CREATE TABLE Users_Address (
    user_id INT NOT NULL,
    street VARCHAR(100) NOT NULL CHECK(LENGTH(street) < 255),
    district VARCHAR(100) NOT NULL CHECK(LENGTH(district) < 255),
    city VARCHAR(100) NOT NULL CHECK(LENGTH(city) < 255),
    country VARCHAR(100) NOT NULL CHECK(LENGTH(country) < 255),
    PRIMARY KEY (user_id,street,district,city,country)
); 


CREATE TABLE Employees (
    user_id INT NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE Clients (
    user_id INT NOT NULL,
    levels INT NOT NULL  DEFAULT 0 CHECK(levels >= 0 AND levels <= 6),
    vip_point INT NOT NULL DEFAULT 0  CHECK(vip_point >= 0),
    PRIMARY KEY (user_id)
);


CREATE TABLE Stock_Contains (
    book_id INT NOT NULL,
    stock_order_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity >=0),
    PRIMARY KEY (book_id, stock_order_id)
);

CREATE TABLE Stock_Order (
    stock_order_id INT NOT NULL AUTO_INCREMENT,
    producer VARCHAR(255) NOT NULL CHECK(LENGTH(producer) < 255),
    payment_method VARCHAR(30) NOT NULL CHECK(payment_method IN ("Internet Banking","Cash")),
    paid_date DATE,
    employee_id INT NOT NULL,
    PRIMARY KEY (stock_order_id)
) AUTO_INCREMENT = 0;

CREATE TABLE Books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL CHECK(LENGTH(title) <= 255),
    descriptions VARCHAR(255) NOT NULL CHECK(LENGTH(descriptions) <= 255),
    publisher VARCHAR(255) NOT NULL CHECK(LENGTH(publisher) <= 255),
    author VARCHAR(255) NOT NULL CHECK(LENGTH(author) <= 255),
    stock INT NOT NULL CHECK(stock >= 0),
    current_price INT NOT NULL CHECK (current_price > 0),
    edition_version INT NOT NULL DEFAULT 1 CHECK(edition_version >= 0) ,
    category_id INT NOT NULL,
    PRIMARY KEY (book_id)
) AUTO_INCREMENT = 0;

CREATE TABLE Category (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(125) NOT NULL CHECK (LENGTH(category_name) <= 125),
    PRIMARY KEY (category_id)
) AUTO_INCREMENT = 0;

CREATE TABLE Author_Dept (
    book_id INT NOT NULL,
    author VARCHAR(50) NOT NULL CHECK(LENGTH(author) <= 50),
    PRIMARY KEY (book_id)
);

CREATE TABLE Contain (
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity >=0),
    PRIMARY KEY (order_id,book_id)
);

CREATE TABLE Orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    order_status VARCHAR(50) NOT NULL CHECK(order_status IN ("Fail","Success","Processing")),
    shipment_method VARCHAR(20) NOT NULL CHECK(shipment_method IN("Normal","Fast","Flash")),
    shipment_date DATE,
    shipment_price INT NOT NULL CHECK(shipment_price >= 0),
    shipment_status INT CHECK(shipment_status IN(0,1,2,3)),
    street VARCHAR(255) NOT NULL CHECK(LENGTH(street) < 255),
    district VARCHAR(255) NOT NULL CHECK(LENGTH(district) < 255),
    city VARCHAR(255) NOT NULL CHECK(LENGTH(city) < 255),
    country VARCHAR(255) NOT NULL CHECK(LENGTH(country) < 255),
    payment_method VARCHAR(20) CHECK(payment_method IN ("Internet Banking","Cash")),
    paid_date DATE,
    client_id INT NOT NULL,
    PRIMARY KEY (order_id),
    CHECK (paid_date <= shipment_date)
) AUTO_INCREMENT = 0;

CREATE TABLE Manage (
    user_id INT NOT NULL,
    promotion_id INT NOT NULL,
    PRIMARY KEY (user_id, promotion_id)
);

CREATE TABLE Exchange (
    user_id INT NOT NULL,
    promotion_id INT NOT NULL,
    dates DATE NOT NULL,
    quantity INT NOT NULL CHECK(quantity >=0),
    PRIMARY KEY (user_id, promotion_id)
);

CREATE TABLE Promotion (
    promotion_id INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(125) NOT NULL CHECK(LENGTH(names) <= 125),
    start_valid_date DATE NOT NULL ,
    expired_date DATE,
    quantity INT NOT NULL CHECK(quantity >= 0),
    promotion_type BOOLEAN NOT NULL,
    PRIMARY KEY (promotion_id),
    CHECK (start_valid_date <= expired_date)
) AUTO_INCREMENT = 0;

CREATE TABLE Gift (
    promotion_id INT NOT NULL,
    number_of_use INT NOT NULL CHECK(number_of_use >= 0),
    sale_off_amount DECIMAL(10,2) NOT NULL CHECK(sale_off_amount > 0 AND sale_off_amount <= 1),
    times_used INT NOT NULL CHECK(times_used >= 0),
    PRIMARY KEY (promotion_id)
);

CREATE TABLE Discount (
    promotion_id INT NOT NULL,
    vip_point_cost INT NOT NULL CHECK(vip_point_cost >= 0),
    max_money_sale_off INT NOT NULL CHECK(max_money_sale_off > 0),
    amount DECIMAL(10,2) NOT NULL CHECK(amount > 0 AND amount <= 1),
    PRIMARY KEY (promotion_id)
);

CREATE TABLE Apply (
    order_id INT NOT NULL,
    promotion_id INT NOT NULL,
    PRIMARY KEY (order_id)
);