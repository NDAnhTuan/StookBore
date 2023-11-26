use sql12664900;

CREATE TABLE Users (
    user_id VARCHAR(10) NOT NULL CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    email VARCHAR(30) NOT NULL CHECK(LEN(user_id) <= 125) ,
    password_key VARCHAR(20) CHECK(LEN(password_key) >= 6 
                                    AND LEN(password_key) <= 20
                                    AND REGEXP_LIKE(password_key, "[0-9]+") = TRUE 
                                    AND REGEXP_LIKE(password_key, "[a-z]+") = TRUE
                                    AND REGEXP_LIKE(password_key, "[A-Z]+") = TRUE
                                    AND REGEXP_LIKE(password_key, "[^a-zA-Z0-9 ]") = TRUE),
    first_name VARCHAR(125) NOT NULL CHECK(LEN(user_id) <= 125) ,
    last_name VARCHAR(125) NOT NULL CHECK(LEN(user_id) <= 125) ,
    phone_number VARCHAR(10) NOT NULL CHECK(LEN(phone_number) = 10),
    user_type BOOLEAN,
    PRIMARY KEY (user_id)
);

CREATE TABLE Users_Address (
    user_id VARCHAR(10) NOT NULL CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    street VARCHAR(20) NOT NULL,
    district VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    country VARCHAR(15) NOT NULL,
    PRIMARY KEY (user_id,street,district,city,country),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)
); 

CREATE TABLE Employees (
    user_id VARCHAR(10) NOT NULL CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)
);

CREATE TABLE Clients (
	user_id VARCHAR(10) NOT NULL CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    levels INT CHECK(levels >= 0 AND levels <= 6),
    vip_point INT CHECK(vip_point >= 0),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)

);

CREATE TABLE Stock_Contains (
    book_id VARCHAR(10) NOT NULL,
    stock_order_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (book_id, stock_order_id),
    FOREIGN KEY (book_id)
    REFERENCES Books (book_id),
    FOREIGN KEY (stock_order_id)
    REFERENCES Stock_Order (stock_order_id)
);

CREATE TABLE Stock_Order (
    stock_order_id VARCHAR(10) NOT NULL CHECK(LEN(stock_order_id) <= 10 AND STRTOINT(stock_order_id, 10) >= 0 AND PATINDEX("%[^0-9]%", stock_order_id) = 0),
    producer VARCHAR(255) NOT NULL CHECK(LEN(producer) < 255),
    payment_method VARCHAR(20) NOT NULL CHECK(payment_method IN ("Internet Banking","Cash")),
    paid_date DATE,
    employee_id VARCHAR(10) NOT NULL CHECK(LEN(employee_id) <= 10 AND STRTOINT(employee_id, 10) >= 0 AND PATINDEX("%[^0-9]%", employee_id) = 0),
    PRIMARY KEY (stock_order_id),
    FOREIGN KEY (employee_id)
    REFERENCES Employees (user_id)
);

CREATE TABLE Books (
    book_id VARCHAR(10) NOT NULL CHECK(LEN(book_id) <= 10 AND STRTOINT(book_id, 10) >= 0 AND PATINDEX("%[^0-9]%", book_id) = 0),
    title VARCHAR(255) NOT NULL CHECK(LEN(title) <= 255),
    descriptions VARCHAR(255) NOT NULL CHECK(LEN(descriptions) <= 255),
    publisher VARCHAR(255) NOT NULL CHECK(LEN(publisher) <= 255),
    author VARCHAR(255) NOT NULL CHECK(LEN(author) <= 255),
    stock INT NOT NULL CHECK(stock >= 0 AND PATINDEX("%[^0-9]%", stock) = 0),
    current_price DECIMAL(10,2) NOT NULL CHECK (current_price > 0 AND PATINDEX("%[^0-9]%", current_price) = 0),
    edition_version INT NOT NULL CHECK(edition_version >= 0 AND PATINDEX("%[^0-9]%", edition_version) = 0),
    category_id VARCHAR(10),
    PRIMARY KEY (book_id),
    FOREIGN KEY (category_id)
    REFERENCES Category (category_id)
);

CREATE TABLE Contain (
    order_id VARCHAR(10),
    book_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (order_id,book_id),
    FOREIGN KEY (order_id)
    REFERENCES Orders (order_id),
    FOREIGN KEY (book_id)
    REFERENCES Books (book_id)
);

CREATE TABLE Category (
    category_id VARCHAR(10) NOT NULL CHECK(LEN(category_id) <= 10 AND STRTOINT(category_id, 10) >= 0 AND PATINDEX("%[^0-9]%", category_id) = 0),
    category_name VARCHAR(125) NOT NULL CHECK (LEN(category_name) <= 125),
    PRIMARY KEY (category_id)
    
);

CREATE TABLE Author_Dept (
    book_id VARCHAR(10),
    author VARCHAR(50),
    PRIMARY KEY (book_id),
    FOREIGN KEY (book_id)
    REFERENCES Books (book_id)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) CHECK(LEN(order_id) <= 10 AND STRTOINT(order_id, 10) >= 0  AND PATINDEX("%[^0-9]%", order_id) = 0),
    order_status VARCHAR(50) NOT NULL CHECK(order_status IN ("Fail","Success","Shipping")),
    shipment_method VARCHAR(20) NOT NULL CHECK(shipment_method IN("Normal","Fast","Flash")),
    shipment_date DATE,
    shipment_price INT CHECK(shipment_price >= 0),
    shipment_status INT NOT NULL CHECK(shipment_status IN(0,1,2,3)),
    street VARCHAR(255) NOT NULL CHECK(LEN(street) < 255),
    district VARCHAR(255) NOT NULL CHECK(LEN(street) < 255),
    city VARCHAR(255) NOT NULL CHECK(LEN(street) < 255),
    country VARCHAR(255) NOT NULL CHECK(LEN(street) < 255),
    payment_method VARCHAR(20) NOT NULL CHECK(payment_method IN ("Internet Banking","Cash")),
    paid_date DATE,
    client_id VARCHAR(10),
    PRIMARY KEY (order_id),
    CHECK (paid_date <= shipment_date)
);

CREATE TABLE Manage (
    user_id VARCHAR(10) CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    promotion_id VARCHAR(10),
    PRIMARY KEY (user_id, promotion_id),
    FOREIGN KEY (user_id)
    REFERENCES Employees (user_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)

);

CREATE TABLE Exchange (
    user_id VARCHAR(10) CHECK(LEN(user_id) <= 10 AND STRTOINT(user_id, 10) >= 0 AND PATINDEX("%[^0-9]%", user_id) = 0),
    promotion_id VARCHAR(10),
    dates date,
    quantity INT,
    PRIMARY KEY (user_id, promotion_id),
    FOREIGN KEY (user_id)
    REFERENCES Clients (user_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)
);

CREATE TABLE Promotion (
    promotion_id VARCHAR(10) CHECK(LEN(promotion_id) <= 10 AND STRTOINT(promotion_id, 10) >= 0 AND PATINDEX("%[^0-9]%", promotion_id) = 0),
    names VARCHAR(125) CHECK(LEN(names) <= 125),
    start_valid_date DATE,
    expired_date DATE,
    quantity INT CHECK(quantity >= 0),
    promotion_type BOOLEAN,
    PRIMARY KEY (promotion_id),
    CHECK (start_valid_date <= expired_date)
);

CREATE TABLE Gift (
    promotion_id VARCHAR(10) CHECK(LEN(promotion_id) <= 10 AND STRTOINT(promotion_id, 10) >= 0 AND PATINDEX("%[^0-9]%", promotion_id) = 0),
    number_of_use INT CHECK(number_of_use >= 0),
    sale_off_amount INT,
    times_used INT CHECK(times_used >= 0),
    PRIMARY KEY (promotion_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)
);

CREATE TABLE Discount (
    promotion_id VARCHAR(10) CHECK(LEN(promotion_id) <= 10 AND STRTOINT(promotion_id, 10) >= 0 AND PATINDEX("%[^0-9]%", promotion_id) = 0),
    vip_point_cost INT CHECK(vip_point_cost >= 0),
    sale_off_amount INT,
    max_money_sale_off INT CHECK(max_money_sale_off >= 0),
    amount INT CHECK(amount >= 1 AND amount <= 100),
    PRIMARY KEY (promotion_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)
);

CREATE TABLE Apply (
    order_id VARCHAR(10),
    promotion_id VARCHAR(10),
    PRIMARY KEY (order_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id),
    FOREIGN KEY (order_id)
    REFERENCES Orders (order_id)
);