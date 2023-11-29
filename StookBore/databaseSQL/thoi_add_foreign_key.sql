-- use new_schema;
use railway;

ALTER TABLE Users_Address
ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE Employees
ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE Clients
ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE Stock_Contains
ADD FOREIGN KEY (book_id) REFERENCES Books (book_id),
ADD FOREIGN KEY (stock_order_id) REFERENCES Stock_Order (stock_order_id);

ALTER TABLE Stock_Order
ADD FOREIGN KEY (employee_id) REFERENCES Employees (user_id);

ALTER TABLE Books
ADD FOREIGN KEY (category_id) REFERENCES Category (category_id);

ALTER TABLE Contain
ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id),
ADD FOREIGN KEY (book_id) REFERENCES Books (book_id);

ALTER TABLE Author_Dept
ADD FOREIGN KEY (book_id) REFERENCES Books (book_id);

ALTER TABLE Orders
ADD FOREIGN KEY (client_id) REFERENCES Clients (user_id);

ALTER TABLE Exchange
ADD FOREIGN KEY (user_id) REFERENCES Clients (user_id),
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id);

ALTER TABLE Manage
ADD FOREIGN KEY (user_id) REFERENCES Employees (user_id),
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id);

ALTER TABLE Exchange
ADD FOREIGN KEY (user_id) REFERENCES Clients (user_id),
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id);

ALTER TABLE Gift 
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id);

ALTER TABLE Discount
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id);

ALTER TABLE Apply
ADD FOREIGN KEY (promotion_id) REFERENCES Promotion (promotion_id),
ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);