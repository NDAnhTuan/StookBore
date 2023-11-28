-- Thủ tục 1: Hiển thị thông tin sách có số lượng tồn kho lớn hơn 3, sắp xếp theo tên sách
-- Bảng Books vs Stock_Contains
DELIMITER //

CREATE PROCEDURE GetBooksInStockAbove3()
BEGIN
    SELECT Books.book_id, Books.title, Books.stock
    FROM Books
    JOIN Stock_Contains ON Books.book_id = Stock_Contains.book_id
    WHERE Books.stock > 3
    ORDER BY Books.book_id ASC;
END //

DELIMITER ;



-- Thủ tục 2: Thống kê số lượng đơn hàng của mỗi khách hàng, chỉ hiển thị những khách hàng có số lượng đơn hàng trên 0
-- Bảng Clients vs Orders
DELIMITER //

CREATE PROCEDURE GetCustomerOrderCount()
BEGIN
    SELECT Clients.user_id, COUNT(Orders.order_id) AS OrderCount
    FROM Clients
    LEFT JOIN Orders ON Clients.user_id = Orders.client_id
    GROUP BY Clients.user_id
    HAVING COUNT(Orders.order_id) > 0
    ORDER BY OrderCount DESC, Clients.user_id ASC;
END //

DELIMITER ;


-- Thủ tục 3: Lấy thông tin đơn hàng của một khách hàng cụ thể
-- Bảng Orders vs Clients
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(
    ClientID INT(11)
)
BEGIN
    SELECT * FROM Orders
    WHERE Orders.client_id = ClientID
    ORDER BY Orders.shipment_date DESC;
END //

DELIMITER ;

-- Thủ tục 4: Chi tiết thông tin đơn hàng với mỗi cuốn sách và một thể loại
-- Orders vs Contain vs Books vs Category
DELIMITER //

CREATE PROCEDURE GetOrderDetails(
    OrderID INT(11)
)
BEGIN
    SELECT
        Orders.order_id,
        Orders.order_status,
        Orders.shipment_method,
        Orders.shipment_date,
        Orders.shipment_price,
        Orders.shipment_status,
        Orders.payment_method,
        Orders.paid_date,
        Contain.book_id,
        Books.title AS book_title,
        Books.descriptions AS book_description,
        Books.publisher AS book_publisher,
        Books.author AS book_author,
        Books.stock AS book_stock,
        Books.current_price AS book_current_price,
        Contain.quantity,
        Books.edition_version AS book_edition_version,
        Category.category_name AS book_category
    FROM Orders
    INNER JOIN Contain ON Orders.order_id = Contain.order_id
    INNER JOIN Books ON Contain.book_id = Books.book_id
    INNER JOIN Category ON Books.category_id = Category.category_id
    WHERE Orders.order_id = OrderID;
END //

DELIMITER ;


-- Gọi thủ tục 1
CALL GetBooksInStockAbove3();

-- Gọi thủ tục 2
CALL GetCustomerOrderCount();

-- Gọi thủ tục 3 với tham số đầu vào là ID của một khách hàng cụ thể (ví dụ: '123')
CALL GetCustomerOrders (3);

-- Gọi thủ tục chi tiết đơn hàng với mỗi cuốn sách và một thể loại với tham số đầu vào là ID của một đơn hàng cụ thể (ví dụ: 'ABC123')
CALL GetOrderDetails (4);
