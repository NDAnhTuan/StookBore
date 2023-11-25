use sql12664900;

CREATE TABLE Users (
    user_id VARCHAR(10),
    email VARCHAR(30),
    password_key VARCHAR(12),
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    phone_number VARCHAR(10),
    user_type VARCHAR(10),
    PRIMARY KEY (user_id)
);

CREATE TABLE Users_Address (
    user_id VARCHAR(10),
    street VARCHAR(20),
    district VARCHAR(20),
    city VARCHAR(20),
    country VARCHAR(15),
    PRIMARY KEY (user_id,street,district,city,country),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)
); 

CREATE TABLE Employees (
    user_id VARCHAR(10),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)
);

CREATE TABLE Clients (
    user_id VARCHAR(10),
    levels INT,
    vip_point INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id)

);

CREATE TABLE Stock_Contains (
    book_id VARCHAR(10),
    stock_order_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (book_id, stock_order_id),
    FOREIGN KEY (book_id)
    REFERENCES Books (book_id),
    FOREIGN KEY (stock_order_id)
    REFERENCES Stock_Order (stock_order_id)
);

CREATE TABLE Stock_Order (
    stock_order_id VARCHAR(10),
    producer VARCHAR(30),
    payment_method VARCHAR(20),
    paid_date DATE,
    employee_id VARCHAR(10),
    PRIMARY KEY (stock_order_id),
    FOREIGN KEY (employee_id)
    REFERENCES Employees (user_id)
);

CREATE TABLE Books (
    book_id VARCHAR(10),
    title VARCHAR(50),
    descriptions VARCHAR(200),
    publisher VARCHAR(30),
    stock INT,
    current_price INT,
    edition_version VARCHAR(20),
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
    category_id VARCHAR(10),
    category_name VARCHAR(20),
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
    order_id VARCHAR(10),
    order_status VARCHAR(10),
    shipment_method VARCHAR(20),
    shipment_date DATE,
    shipment_price INT,
    shipment_status VARCHAR(10),
    street VARCHAR(20),
    district VARCHAR(20),
    city VARCHAR(20),
    country VARCHAR(15),
    payment_method VARCHAR(20),
    paid_date DATE,
    client_id VARCHAR(10),
    PRIMARY KEY (order_id)
);

CREATE TABLE Manage (
    user_id VARCHAR(10),
    promotion_id VARCHAR(10),
    PRIMARY KEY (user_id, promotion_id),
    FOREIGN KEY (user_id)
    REFERENCES Employees (user_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)

);

CREATE TABLE Exchange (
    user_id VARCHAR(10),
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
    promotion_id VARCHAR(10),
    names VARCHAR(10),
    start_valid_date DATE,
    expired_date DATE,
    quantity INT,
    promotion_type VARCHAR(10),
    PRIMARY KEY (promotion_id)
);

CREATE TABLE Gift (
    promotion_id VARCHAR(10),
    number_of_use INT,
    sale_off_amount INT,
    times_used INT,
    PRIMARY KEY (promotion_id),
    FOREIGN KEY (promotion_id)
    REFERENCES Promotion (promotion_id)
);

CREATE TABLE Discount (
    promotion_id VARCHAR(10),
    vip_point_cost INT,
    sale_off_amount INT,
    max_money_sale_off INT,
    amount INT,
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
