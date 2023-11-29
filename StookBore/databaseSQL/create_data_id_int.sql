use sys;

INSERT INTO Users (email,password_key,first_name,last_name,phone_number,user_type)
VALUES ('an@gmail.com','an@123','Nguyen Van','An','0112233445',FALSE),
	   ('bao@gmail.com','bao@123','Le Duc','Bao','0223344556',FALSE),
       ('chau@gmail.com','chau@123','Tran Thi','Chau','0334455667',FALSE),
       ('duc@gmail.com','duc@123','Nguyen Van','Duc','0445566778',FALSE),
	   ('em@gmail.com','em@123','Le Thi','Em','0556677889',TRUE),
       ('giang@gmail.com','giang@456','Tran Duc','Giang','0667788991',FALSE),
       ('huong@gmail.com','huong@456','Nguyen Le','Huong','0778899112',FALSE),
       ('khanh@gmail.com','khanh@456','Dao Xuan','Khanh','0889911223', FALSE),
       ('linh@gmail.com','linh@456','Le Van','Linh','0991122334',FALSE),
       ('minh@gmail.com','minh@456','Tran Van','Minh','0224466881',FALSE),
       ('nhan@gmail.com','nhanh@246','Vo Ngoc Thanh','Nhan','0224466882',TRUE),
       ('nhat@gmail.com','nhat@246','Truong Hoang','Nhat','0224466883',TRUE),
       ('oanh@gmail.com','oanh@246','Le Thi','Oanh','0224466884',FALSE),
       ('phuong@gmail.com','phuong@246','Tran Duc','Phuong','0224466885',FALSE),
       ('quynh@gmail.com','quynh@246','Tran Thuy','Quynh','0224466886',FALSE),
       ('rang@gmail.com','rang@357','Thai Ngoc','Rang','0224466887',TRUE),
       ('thanh@gmail.com','thanh@357','Kim Nhat','Thanh','0224466888',FALSE),
       ('uyen@gmail.com','uyen@357','Tran Thi','Uyen','0224466889',FALSE),
       ('xinh@gmai.com','xinh@357','Le Thi','Xinh','0335577991',FALSE),
       ('y@gmail.com','y@123456','Tran Nhu','Y','0335577992',FALSE);

INSERT INTO Users_Address (user_id,street,district,city,country)
VALUES (1,'Le Duan','Quan 1','Ho Chi Minh','Viet Nam'),
		(2,'Tran Hung Dao','Ho Xa','Dong Ha','Viet Nam'),
	   (3,'Tran Duy Hung','Vinh Lam','Ho Chi Minh','Viet Nam'),
	   (4,'Le Thanh Tong','Vinh Chap','Ha Noi','Viet Nam'),
	   (5,'Tran Nhan Tong','Vinh Lam','Vinh','Viet Nam'),
	   (6,'Vo Thi Sau','Vinh Son','Hue','Viet Nam'),
	   (7,'Dinh Bo Linh','Vinh Nam','Quy Nhon','Viet Nam'),
	   (8,'Le Quy Don','Quang Vinh','Nghe An','Viet Nam'),
	   (9,'Ngo Quyen','Quang Dien','Ha Long','Viet Nam'),
	   (10,'Nguyen Hue','Hoan Kiem','Ha Noi','Viet Nam'),
		(11,'Ly Thuong Kiet','Thanh Xuan','Ha Noi','Viet Nam'),
		(12,'Pham Hung','Nam Tu Liem','Ha Noi','Viet Nam'),
		(13,'Hoang Quoc Viet','Ba Dinh','Ha Noi','Viet Nam'),
		(14,'Pham Ngu Lao','Quan 1','Ho Chi Minh','Viet Nam'),
		(15,'Nguyen Hue','Quan 1','Ho Chi Minh','Viet Nam'),
		(16,'Le Loi','Quan 1','Ho Chi Minh','Viet Nam'),
		(17,'Nguyen Thi Minh Khai','Quan 3','Ho Chi Minh','Viet Nam'),
		(18,'Cong Xa','Quan 10','Ho Chi Minh','Viet Nam'),
		(19,'Nguyen Van Cu','Quan 1','Ho Chi Minh','Viet Nam'),
		(20,'Nguyen Thi Minh Khai','Quan 1','Ho Chi Minh','Viet Nam');

INSERT INTO Employees(user_id)
VALUES (5),
	   (11),
       (12),
       (16);
	
INSERT INTO Clients (user_id,levels,vip_point)
VALUES (1,5,190),
		(2,0,0),
	   (3,0,0),
       (4,1,50),
       (6,1,25),
       (7,2,160),
       (8,2,60),
       (9,2,30),
       (10,3,300),
       (13,3,255),
       (14,4,1000),
       (15,4,955),
       (17,5,505),
       (18,6,680),
       (19,6,1960),
       (20,4,350);
       

INSERT INTO Stock_Contains (book_id, stock_order_id, quantity)
VALUES (5,1,100),
       (11,2,200),
       (12,1,150),
       (15,3,700),
       (6, 2, 250),
       (7, 1, 100),
       (8, 2, 80),
       (9, 3, 200),
       (10, 4, 255),
       (13, 5, 1000),
       (14, 5, 955),
       (16, 7, 680),
       (20, 11, 50),
       (21, 12, 50),
       (22, 6, 300),
       (23, 8, 400),
       (24, 9, 500),
       (25, 10, 600);

        
INSERT INTO Stock_Order (producer, payment_method, paid_date, employee_id)
VALUES ('ABC Books','Internet Banking','2023-04-01',5),
       ('XYZ Publishing','Cash','2023-04-02',11),
       ('PQR Media','Internet Banking','2023-04-03',12),
       ('LMN Press','Cash','2023-04-04',16),
       ('DEF Literature','Internet Banking','2023-04-05',5),
       ('RST Comics','Cash','2023-04-06',11),
       ('GHI Comics','Cash','2023-04-07',11),
       ('UVW Magazines','Internet Banking','2023-04-08',12),
       ('EFG Newspapers','Cash','2023-04-09',16),
       ('JKL Books','Internet Banking','2023-04-10',5),
       ('JKL Magazines','Internet Banking','2023-04-11',12),
       ('MNO Newspapers','Cash','2023-04-12',16);



INSERT INTO Books (title, descriptions, publisher, author, stock, current_price, edition_version, category_id)
VALUES ('The Hitchhikers Guide to the Galaxy','A hilarious and irreverent sci-fi comedy about the meaning of life, the universe, and everything','Pan Books','Douglas Adams',50,200000,6,1),
       ('Harry Potter and the Philosophers Stone','The first book in the magical and adventurous series about a young wizard and his friends','Bloomsbury','J.K. Rowling',100,249000,1,2),
       ('The Da Vinci Code','A thrilling and controversial mystery that explores the secrets of Christianity and the Holy Grail','Doubleday','Dan Brown',80,375000,1,3),
       ('The Hunger Games','A dystopian and action-packed novel about a deadly reality show where teenagers fight to the death','Scholastic','Suzanne Collins',60,294000,1,4),
       ('The Lord of the Rings','An epic and classic fantasy saga about the quest to destroy the One Ring and save Middle-earth','Allen & Unwin','J.R.R. Tolkien',40,499000,2,5),
       ('The Catcher in the Rye','A controversial and influential coming-of-age story about a rebellious teenager and his alienation from society','Little, Brown and Company','J.D. Salinger',30,224000,1,6),
       ('To Kill a Mockingbird','A Pulitzer Prize-winning novel that deals with racism, justice, and morality in the American South','J.B. Lippincott & Co.','Harper Lee',20,274000,1,6),
       ('Nineteen Eighty-Four','A dystopian and political novel that warns about the dangers of totalitarianism and surveillance','Secker & Warburg','George Orwell',25,249000,1,6),
       ('The Kite Runner','A powerful and emotional novel that explores the themes of friendship, betrayal, and redemption in Afghanistan','Riverhead Books','Khaled Hosseini',35,349000,1,7),
       ('The Girl with the Dragon Tattoo','A gripping and suspenseful crime novel that involves a missing heiress, a journalist, and a hacker','Norstedts Förlag','Stieg Larsson',45,399000,1,3),
       ('The Fault in Our Stars','A heartbreaking and romantic novel about two teenagers who fall in love despite having terminal illnesses','Dutton Books','John Green',55,299000,1,8),
       ('The Alchemist','A inspirational and philosophical novel that follows the journey of a young shepherd who seeks his destiny','HarperCollins','Paulo Coelho',65,102000,1,9),
       ('The Chronicles of Narnia','A beloved and enchanting series of childrens fantasy novels that feature talking animals, magic, and adventure','Geoffrey Bles','C.S. Lewis',70,83000,1,5),
       ('The Little Prince','A charming and poetic tale that explores the themes of love, friendship, and innocence through the eyes of a young prince','Reynal & Hitchcock','Antoine de Saint-Exupéry',75,75000,1,9),
       ('The Shining','A terrifying and atmospheric horror novel that centers on a haunted hotel and a family in danger','Doubleday','Stephen King',85,49000,1,10),
       ('Pride and Prejudice','A witty and romantic novel that portrays the manners, marriage, and class in the Regency era','T. Egerton','Jane Austen',90,139000,1,11),
       ('Frankenstein','A Gothic and science fiction novel that tells the story of a scientist who creates a monstrous creature','Lackington, Hughes, Harding, Mavor & Jones','Mary Shelley',95,249000,1,12),
       ('The Hobbit','A delightful and adventurous prequel to The Lord of the Rings that follows the journey of a reluctant hobbit','George Allen & Unwin','J.R.R. Tolkien',100,499000,4,5),
       ('The Handmaids Tale','A dystopian and feminist novel that depicts a society where women are oppressed and enslaved','McClelland and Stewart','Margaret Atwood',105,375000,1,13),
       ('The Great Gatsby','A classic and tragic novel that explores the themes of wealth, love, and corruption in the Jazz Age','Charles Scribners Sons','F. Scott Fitzgerald',110,74000,1,14),
       ('Dune','A science fiction masterpiece that tells the story of a desert planet and its struggle for freedom and survival','Chilton Books','Frank Herbert',115,88000,1,1),
       ('The Lion, the Witch and the Wardrobe','The second book in The Chronicles of Narnia series that introduces the magical world of Narnia and its inhabitants','Geoffrey Bles','C.S. Lewis',120,110000,1,5),
       ('Sherlock Holmes: The Complete Novels and Stories','A collection of the classic detective stories that feature the brilliant and eccentric Sherlock Holmes and his loyal friend Dr. Watson','Bantam Classics','Sir Arthur Conan Doyle',125,451000,1,3),
       ('Brave New World','A dystopian and satirical novel that depicts a futuristic society where people are conditioned and controlled by technology and drugs','Chatto & Windus','Aldous Huxley',130,789000,1,4),
       ('Wuthering Heights','A Gothic and romantic novel that portrays the passionate and doomed love between Heathcliff and Catherine Earnshaw','Thomas Cautley Newby','Emily Brontë',135,660000,1,12);


INSERT INTO Category (category_name)
VALUES ('Science Fiction'),
       ('Fantasy'),
       ('Mystery'),
       ('Dystopian'),
       ('Classic'),
       ('Literature'),
       ('Historical Fiction'),
       ('Romance'),
       ('Philosophy'),
       ('Horror'),
       ('Regency'),
       ('Gothic'),
       ('Feminist'),
       ('Jazz Age');
       
INSERT INTO Contain (order_id, book_id, quantity)
VALUES (1,1,2),
       (1,4,1),
       (1,8,3),
       (2,3,2),
       (2,7,1),
       (2,9,2),
       (3,2,1),
       (3,6,2),
       (3,14,1),
       (4,5,3),
       (4,10,2),
       (4,15,1),
       (5,1,2),
       (5,11,1),
       (5,12,3),
       (6,13,2),
       (6,16,1),
       (6,17,2),
       (7,18,1),
       (7,19,2),
       (7,20,1),
       (8,21,3),
       (8,22,2),
       (8,23,1),
       (9,24,2);


INSERT INTO Orders (order_status, shipment_method, shipment_date, shipment_price, shipment_status, street, district, city, country, payment_method, paid_date, client_id)
VALUES ('Success','Normal','2023-05-01',10,2,'123 Main Street','District 1','Ho Chi Minh City','Vietnam','Cash','2023-04-01',6),
       ('Success','Fast','2023-05-02',20,2,'456 Second Avenue','District 2','Ho Chi Minh City','Vietnam','Internet Banking','2023-04-02',2),
       ('Success','Flash','2023-05-03',30,2,'789 Third Boulevard','District 3','Ho Chi Minh City','Vietnam','Cash','2023-04-03',1),
       ('Success','Normal','2023-05-04',10,2,'101 Fourth Lane','District 4','Ho Chi Minh City','Vietnam','Internet Banking','2023-04-04',3),
       ('Success','Fast','2023-05-05',20,2,'102 Fifth Street','District 5','Ho Chi Minh City','Vietnam','Cash','2023-04-05',12),
       ('Success','Flash','2023-05-06',30,2,'103 Sixth Avenue','District 6','Ho Chi Minh City','Vietnam','Internet Banking','2023-04-06',9),
       ('Success','Normal','2023-05-07',10,2,'104 Seventh Boulevard','District 7','Ho Chi Minh City','Vietnam','Cash','2023-04-07',7),
       ('Success','Fast','2023-05-08',20,2,'105 Eighth Lane','District 8','Ho Chi Minh City','Vietnam','Internet Banking','2023-04-08',17),
       ('Success','Flash','2023-05-09',30,2,'106 Ninth Street','District 9','Ho Chi Minh City','Vietnam','Cash','2023-04-09',19);

INSERT INTO Author_Dept (book_id, author)
SELECT book_id, author FROM Books;

INSERT INTO Manage (user_id, promotion_id)
VALUES (5,2),
       (5,10),
       (5,7),
       (5,12),
       (5,19),
       (11,3),
       (11,14),
       (11,1),
       (11,15),
       (12,6),
       (12,16),
       (12,4),
       (12,17),
       (12,8),
       (12,20),
       (12,11),
       (16,5),
       (16,9),
       (16,13),
       (16,18);

INSERT INTO Exchange (user_id, promotion_id, dates, quantity) VALUES 
(1, 1, '2022-11-26', 2), 
(2, 3, '2022-12-29', 1), 
(3, 5, '2023-03-16', 3), 
(4, 7, '2023-05-09', 1), 
(6, 9, '2023-06-19', 2), 
(7, 11, '2023-10-16', 1), 
(8, 13, '2023-12-11', 4), 
(9, 15, '2023-03-06', 2), 
(10, 17, '2023-04-21', 1), 
(13, 2, '2022-12-11', 2), 
(14, 4, '2023-02-13', 1), 
(15, 6, '2023-04-17', 3), 
(17, 8, '2023-06-26', 1), 
(18, 10, '2023-08-21', 2), 
(19, 12, '2023-11-21', 1), 
(20, 14, '2023-01-31', 4);



INSERT INTO Promotion (names, start_valid_date, expired_date, quantity, promotion_type)
VALUES  ('Black Friday Sale', '2022-11-24', '2022-11-27', 1000, TRUE),
		('Christmas Gift Card', '2022-12-01', '2022-12-31', 500, TRUE),
		('New Year Discount', '2022-12-28', '2023-01-05', 800, TRUE),
		('Valentines Day Special', '2023-02-01', '2023-02-14', 300, TRUE),
		('Spring Clearance', '2023-03-01', '2023-03-31', 600, TRUE),
		('Easter Giveaway', '2023-04-10', '2023-04-17', 400, TRUE),
		('Mothers Day Offer', '2023-05-01', '2023-05-10', 200, TRUE),
		('Summer Sale', '2023-06-01', '2023-06-30', 700, TRUE),
		('Fathers Day Deal', '2023-06-11', '2023-06-20', 200, TRUE),
		('Back to School', '2023-08-01', '2023-08-31', 500, TRUE),
		('Halloween Treat', '2023-10-01', '2023-10-31', 300, TRUE),
		('Thanksgiving Bonus', '2023-11-01', '2023-11-30', 400, FALSE),
		('Winter Wonderland', '2023-12-01', '2023-12-31', 900, FALSE),
		('Chinese New Year Celebration', '2023-01-22', '2023-02-06', 500, FALSE),
		('Womens Day Surprise', '2023-03-01', '2023-03-08', 300, FALSE),
		('St. Patricks Day Lucky Draw', '2023-03-10', '2023-03-17', 200, FALSE),
		('Earth Day Awareness', '2023-04-01', '2023-04-22', 100, FALSE),
		('Independence Day Extravaganza', '2023-07-01', '2023-07-04', 400, FALSE),
		('Labor Day Reward', '2023-09-01', '2023-09-07', 300, FALSE),
		('Veterans Day Tribute', '2023-11-01', '2023-11-11', 200, FALSE);


INSERT INTO Gift (promotion_id, number_of_use, sale_off_amount, times_used) VALUES
(1, 67, 0.1, 0),
(2, 102, 0.2, 2),
(3, 85, 0.15, 1),
(4, 123, 0.05, 3),
(5, 74, 0.25, 0),
(6, 96, 0.1, 2),
(7, 81, 0.2, 1),
(8, 109, 0.15, 4),
(9, 88, 0.05, 0),
(10, 69, 0.25, 3),
(11, 118, 0.1, 2);
-- (11, 76, 0.2, 1),
-- (12, 99, 0.15, 3),
-- (13, 106, 0.05, 0),
-- (14, 83, 0.25, 2),
-- (15, 92, 0.1, 1),
-- (16, 72, 0.2, 4),
-- (17, 127, 0.15, 0),
-- (18, 79, 0.05, 3),
-- (19, 94, 0.25, 2);

INSERT INTO Discount (promotion_id, vip_point_cost, max_money_sale_off, amount) VALUES
(12, 10, 70000, 0.1),
(13, 15, 80000, 0.15),
(14, 20, 95000, 0.2),
(15, 40, 150000, 0.4),
(16, 50, 200000, 0.5),
(17, 80, 450000, 0.8),
(18, 100, 500000, 1),
(19, 50, 200000, 0.5),
(20, 40, 150000, 0.4);


INSERT INTO Apply (order_id, promotion_id)
VALUES (8,2),
	   (1,4),
       (6,9),
       (3,7),
       (2,5),
       (7,3),
       (5,12);