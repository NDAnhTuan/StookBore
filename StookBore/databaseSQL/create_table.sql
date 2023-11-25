use sql12664900;

CREATE TABLE Users (
    user_id VARCHAR(10),
    email VARCHAR(30),
    password_key VARCHAR(12),
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    phone_number VARCHAR(10),
    user_type VARCHAR(10)
);

CREATE TABLE Users_Address (
    user_id VARCHAR(10),
    street VARCHAR(20),
    district VARCHAR(20),
    city VARCHAR(20),
    country VARCHAR(15)
);

CREATE TABLE Employees (
    user_id VARCHAR(10)
);

CREATE TABLE Clients (
    user_id VARCHAR(10),
    levels INT,
    vip_point INT
);

CREATE TABLE Stock_Contains (
    book_id VARCHAR(10),
    stock_order_id VARCHAR(10),
    quantity INT
);

CREATE TABLE Stock_Order (
    stock_order_id VARCHAR(10),
    producer VARCHAR(30),
    payment_method VARCHAR(20),
    paid_date DATE,
    employee_id VARCHAR(10)
);

CREATE TABLE Books (
    book_id VARCHAR(10),
    title VARCHAR(50),
    descriptions VARCHAR(200),
    publisher VARCHAR(30),
    stock INT,
    current_price INT,
    edition_version VARCHAR(20),
    category_id VARCHAR(10)
);

CREATE TABLE Contain (
    order_id VARCHAR(10),
    book_id VARCHAR(10),
    quantity INT
);

CREATE TABLE Category (
    category_id VARCHAR(10),
    category_name VARCHAR(20)
);

CREATE TABLE Author_Dept (
    book_id VARCHAR(10),
    author VARCHAR(50)
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
    client_id VARCHAR(10)
);

CREATE TABLE Manage (
    user_id VARCHAR(10),
    promotion_id VARCHAR(10)
);

CREATE TABLE Exchange (
    user_id VARCHAR(10),
    promotion_id VARCHAR(10),
    dates date,
    quantity INT
);

CREATE TABLE Promotion (
    promotion_id VARCHAR(10),
    names VARCHAR(10),
    start_valid_date DATE,
    expired_date DATE,
    quantity INT,
    promotion_type VARCHAR(10)
);

CREATE TABLE Gift (
    promotion_id VARCHAR(10),
    number_of_use INT,
    sale_off_amount INT,
    times_used INT
);

CREATE TABLE Discount (
    promotion_id VARCHAR(10),
    vip_point_cost INT,
    sale_off_amount INT,
    max_money_sale_off INT,
    amount INT
);

CREATE TABLE Apply (
    order_id VARCHAR(10),
    promotion_id VARCHAR(10)
);
