use sql12664900;
CREATE TABLE Users (
    user_id VARCHAR(10),
    email VARCHAR(10),
    password_key VARCHAR(10),
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    phone_number VARCHAR(10),
    user_type VARCHAR(10)
);

CREATE TABLE Users_Address (
    user_id VARCHAR(10),
    street VARCHAR(10),
    district VARCHAR(10),
    city VARCHAR(10),
    country VARCHAR(10),
);

CREATE TABLE Employees (
    user_id VARCHAR(10),
);

CREATE TABLE Clients (
    user_id VARCHAR(10),
    level VARCHAR(10),
    vip_point VARCHAR(10)
);

CREATE TABLE Stock_Contains (
    book_id VARCHAR(10),
    stock_order_id VARCHAR(10),
    quantify VARCHAR(10),
);

CREATE TABLE Stock_Order (
    stock_order_id VARCHAR(10),
    producer VARCHAR(10),
    payment_method VARCHAR(10),
    paid_date VARCHAR(10),
    employee_id VARCHAR(10)
);

CREATE TABLE Books (
    book_id VARCHAR(10),
    title VARCHAR(10),
    description VARCHAR(10),
    publisher VARCHAR(10),
    stock VARCHAR(10),
    current_price VARCHAR(10),
    edition_version VARCHAR(10),
    category_id VARCHAR(10)
);

CREATE TABLE Contain (
    order_id VARCHAR(10),
    book_id VARCHAR(10),
    quantify VARCHAR(10)
);

CREATE TABLE Category (
    category_id VARCHAR(10),
    category_name VARCHAR(10)
);

CREATE TABLE Author_Dept (
    book_id VARCHAR(10),
    author VARCHAR(10)
);

CREATE TABLE Orders (
    order_id VARCHAR(10),
    order_status VARCHAR(10),
    shipment_method VARCHAR(10),
    shipment_date VARCHAR(10),
    shipment_price VARCHAR(10),
    shipment_status VARCHAR(10),
    street VARCHAR(10),
    district VARCHAR(10),
    city VARCHAR(10),
    country VARCHAR(10),
    payment_method VARCHAR(10),
    paid_date VARCHAR(10),
    client_id VARCHAR(10)
);

CREATE TABLE Manage (
    user_id VARCHAR(10),
    promotion_id VARCHAR(10)
);

CREATE TABLE Exchange (
    user_id VARCHAR(10),
    promotion_id VARCHAR(10),
    date VARCHAR,
    quantify VARCHAR    
);

CREATE TABLE Promotion (
    promotion_id VARCHAR(10),
    name VARCHAR(10),
    start_valid_date VARCHAR,
    expired_date VARCHAR,
    quantity VARCHAR,
    promotion_type VARCHAR   
);

CREATE TABLE Gift (
    promotion_id VARCHAR(10),
    number_of_use VARCHAR(10),
    sale_off_amount VARCHAR(10),
    times_used VARCHAR(10)
);

CREATE TABLE Discount (
    promotion_id VARCHAR(10),
    vip_point_cost VARCHAR(10),
    sale_off_amount VARCHAR(10),
    max_money_sale_off VARCHAR(10),
    amount VARCHAR
);

CREATE TABLE Apply (
    order_id VARCHAR(10),
    promotion_id VARCHAR(10)
);
