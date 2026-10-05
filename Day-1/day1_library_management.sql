--A1--
CREATE TABLE Books(book_id INT PRIMARY KEY,book_name varchar(30),author varchar(50),princt int);
CREATE TABLE Members(member_id INT PRIMARY KEY,member_name varchar(40),city varchar(50),phone varchar(40));
CREATE TABLE Borrow(borrow_id INT PRIMARY KEY,book_id INT,member_id INT,borrow_date DATE); 
ALTER TABLE Books ADD category VARCHAR(50);
ALTER TABLE Books ADD quantitY INT;
ALTER TABLE Members ADD email VARCHAR(50);
ALTER TABLE Borrow ADD return_date DATE ;
ALTER TABLE Books ALTER COLUMN price TYPE DECIMAL(10,2);
ALTER TABLE Books RENAME COLUMN quantity TO stock_quantity;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;
--A2--
INSERT INTO Books
(book_id, book_name, author, price, category, stock_quantity)
VALUES
(101, 'SQL Basics', 'Nisha', 450.00, 'Technology', 12),
(102, 'Python Programming', 'Thiya', 650.50, 'Technology', 8),
(103, 'Data Structures', 'Lem', 550.00, 'Education', 15),
(104, 'Database Systems', 'Arjun', 720.75, 'Technology', 10),
(105, 'English Grammar', 'kumar', 300.00, 'Education', 20),
(106, 'The Silent Forest', 'Siva', 399.99, 'Fiction', 7),
(107, 'Machine Learning', 'Suresh', 850.00, 'Technology', 6),
(108, 'Indian History', 'Selvi', 480.25, 'History', 18),
(109, 'World of Science', 'Lakshmi Devi', 525.50, 'Science', 11),
(110, 'Web Development', 'Suriya', 775.00, 'Technology', 14);

INSERT INTO Members
(member_id, member_name, city, phone, email)
VALUES
(201, 'Anitha Kumar', 'Chennai', '9876543210', 'anitha@gmail.com'),
(202, 'Rahul Raj', 'Madurai', '9876543211', 'rahul@gmail.com'),
(203, 'Priya Sharma', 'Coimbatore', '9876543212', 'priya@gmail.com'),
(204, 'Arun Kumar', 'Tirunelveli', '9876543213', 'arun@gmail.com'),
(205, 'Meena Devi', 'Trichy', '9876543214', 'meena@gmail.com'),
(206, 'Karthik Babu', 'Salem', '9876543215', 'karthik@gmail.com'),
(207, 'Divya Ravi', 'Vellore', '9876543216', 'divya@gmail.com'),
(208, 'Suresh Kumar', 'Erode', '9876543217', 'suresh@gmail.com');

INSERT INTO Borrow(borrow_id, book_id, member_id, borrow_date)
VALUES
(301, 101, 201, '2026-09-01'),
(302, 102, 202, '2026-07-02'),
(303, 103, 203, '2026-08-03'),
(304, 101, 204, '2026-05-04'),
(305, 104, 205, '2026-03-05'),
(306, 105, 206, '2026-04-06'),
(307, 102, 207, '2026-11-07'),
(308, 106, 208, '2026-03-08'),
(309, 103, 201, '2026-06-09'),
(310, 107, 202, '2026-09-10');

INSERT INTO Books(book_id, book_name, author, price, category, stock_quantity)
VALUES(111, 'SQL Basics', 'Nisha', 450.00, 'Technology', 12);

INSERT INTO Members(member_id, member_name, city, phone, email)
VALUES(209, 'Kumar', 'Chennai', '9876577210', 'kkumar@gmail.com');

INSERT INTO Borrow(borrow_id, book_id, member_id, borrow_date)
VALUES(311, 109, 209, '2026-04-15');
--updates-
UPDATE Books SET price= 600 where book_id=103;

UPDATE Books SET price = price * 1.10 WHERE category = 'Technology';

UPDATE Books SET stock_quantity =stock_quantity +5;

UPDATE Members SET city ='Bengaluru' WHERE member_id = 206;

UPDATE Members SET email ='skyyy@gamil.com' WHERE member_id=209;

UPDATE Books SET category ='fiction' WHERE BOOK_ID=109 ;

UPDATE Borrow SET return_date =return_date +5;

--DELETE--
DELETE FROM Books WHERE book_id=106;
DELETE FROM Borrow WHERE borrow_id=310;
DELETE FROM Books WHERE stock_quantity=0 ;

--A3--
SELECT * FROM Books;
SELECT book_name,author from Books;
SELECT book_name,category,price from Books;
select * from books where price >500;
select*from  books where price <500;
select * from books where price BETWEEN 300 AND 800;
SELECT*FROM BOOKS WHERE CATEGORY='Technology';
SELECT *FROM BOOKS WHERE AUTHOR='Nisha'
SELECT book_name FROM Books WHERE book_name LIKE 'S%';
SELECT BOOK_NAME FROM BOOKS WHERE BOOK_NAME LIKE '%SQL%';
SELECT book_name FROM Books WHERE category = 'Technology'
 OR category = 'Education';

SELECT book_name FROM Books WHERE price not in (500);
SELECT book_name FROM Books WHERE stock_quantity>10;
SELECT book_name FROM Books WHERE stock_quantity BETWEEN 5 AND 15;

--A4--
CREATE USER library_user WITH PASSWORD 'Library@123';
GRANT SELECT ON Books TO library_user;
GRANT INSERT ON Books TO library_user;
GRANT UPDATE ON Books TO library_user;
SELECT * FROM information_schema.role_table_grants WHERE grantee = 'library_user';
REVOKE INSERT ON Books FROM library_user;
REVOKE UPDATE ON Books FROM library_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO library_user;
REVOKE SELECT ON Books FROM library_user;
SELECT * FROM information_schema.role_table_grants WHERE grantee = 'library_user';

--A5--
SELECT * FROM Books ORDER BY price;
SELECT * FROM Books ORDER BY price DESC;
SELECT *FROM Books ORDER BY BOOK_NAME;
SELECT * FROM Books ORDER BY category ASC, price ASC;
SELECT * FROM Books ORDER BY price DESC LIMIT 3;
SELECT *FROM Books ORDER BY price  LIMIT 3;
SELECT * FROM Books ORDER BY STOCK_QUANTITY DESC LIMIT 5;
SELECT * FROM Members ORDER BY MEMBER_NAME  LIMIT 5;
SELECT * FROM Borrow ORDER BY borrow_date DESC LIMIT 5;

--A6--

SELECT COUNT(*) FROM BOOKS;
SELECT COUNT(*) FROM Members;
SELECT COUNT(*) FROM Borrow;
SELECT SUM(STOCK_QUANTITY)FROM BOOKS;
SELECT SUM(PRICE) FROM BOOKS;
SELECT AVG(PRICE) FROM BOOKS;
SELECT MAX(PRICE) FROM BOOKS;
SELECT MIN(PRICE) FROM BOOKS;
SELECT MAX(price) - MIN(price) AS price_difference FROM Books;
SELECT AVG(STOCK_QUANTITY) FROM BOOKS;

--A7--
SELECT category, COUNT(*) FROM BOOKS GROUP BY category;
SELECT category, avg(price) FROM BOOKS GROUP BY category;
SELECT category, max(price) FROM BOOKS GROUP BY category;
SELECT category, min(price) FROM BOOKS GROUP BY category;
SELECT category, sum(stock_quantity) FROM BOOKS GROUP BY category;
SELECT category,SUM(price * stock_quantity) AS total_value FROM Books GROUP BY category;
SELECT category, COUNT(*) AS book_count FROM Books GROUP BY category HAVING COUNT(*) > 2;
SELECT category,avg(price) FROM Books GROUP BY category HAVING avg(price) > 500;
SELECT author, COUNT(*)FROM Books GROUP BY author;
SELECT author, avg(price)FROM Books GROUP BY author;

--A8--
SELECT category,COUNT(*) FROM Books GROUP BY category HAVING COUNT(*)>2;
SELECT category,avg(price) FROM Books GROUP BY category HAVING avg(price) > 500;
SELECT AUTHOR,COUNT(*) FROM Books GROUP BY AUTHOR HAVING COUNT(*) > 1;
SELECT category,sum(stock_quantity) FROM Books GROUP BY category HAVING sum(stock_quantity)> 20;
SELECT AUTHOR,avg(price) FROM Books GROUP BY AUTHOR HAVING avg(price) > 600;


























