-- CREATE DATABASE car_rental;
-- USE car_rental;
-- CREATE TABLE Customer (
--     customer_id INT PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     phone VARCHAR(20) NOT NULL,
--     driver_license_no VARCHAR(30) NOT NULL UNIQUE,
--     date_of_birth DATE NOT NULL
-- );
-- CREATE TABLE Payment (
--     payment_id INT PRIMARY KEY,
--     payment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
--     amount DECIMAL(10,2) NOT NULL,
--     payment_method VARCHAR(30) NOT NULL,
--     CHECK (amount > 100)
-- );
-- CREATE TABLE Rental (
--     rental_id INT PRIMARY KEY,
--     customer_id INT NOT NULL,
--     payment_id INT NOT NULL,
--     start_date DATE NOT NULL,
--     end_date DATE NOT NULL,
--     status VARCHAR(20) NOT NULL DEFAULT 'active',

--     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
--     FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
-- );
-- ALTER TABLE Customer
-- ADD COLUMN registration_date DATE DEFAULT (CURRENT_DATE);

-- ALTER TABLE Payment
-- MODIFY payment_method VARCHAR(50);

-- ALTER TABLE Rental
-- RENAME COLUMN status TO rental_status;

-- ALTER TABLE Rental
-- ADD CONSTRAINT check_dates CHECK (end_date >= start_date);

-- INSERT INTO Customer VALUES
-- (1,'Aiken','Amanbay','Icam@mail.com','87005673434','DL1001','2008-01-05',CURRENT_DATE),
-- (2,'Aruzhan','Tulegenova','aruzhan@mail.com','87006783456','DL1002','2009-09-05',CURRENT_DATE),
-- (3,'Ali','Sultanov','ali@mail.com','87005763433','DL1003','2009-07-22',CURRENT_DATE),
-- (4,'Moldir','Olzhabaeva','molka@mail.com','87004444444','DL1004','2009-11-03',CURRENT_DATE),
-- (5,'Asylai','Zhumakulova','asylai@mail.com','87005555555','DL1005','2009-02-17',CURRENT_DATE);

-- INSERT INTO Payment VALUES
-- (1,'2024-03-01',500,'card'),
-- (2,'2024-03-02',650,'cash'),
-- (3,'2024-03-03',700,'card'),
-- (4,'2024-03-04',800,'online'),
-- (5,'2024-03-05',550,'card');

-- INSERT INTO Rental VALUES
-- (1,1,1,'2024-03-01','2024-03-05','completed'),
-- (2,2,2,'2024-03-02','2024-03-06','active'),
-- (3,3,3,'2024-03-03','2024-03-07','completed'),
-- (4,4,4,'2024-03-04','2024-03-08','active'),
-- (5,5,5,'2024-03-05','2024-03-09','completed');

SHOW TABLES;
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT * FROM Rental;

-- SELECT
--     Rental.rental_id,
--     Customer.first_name,
--     Customer.last_name,
--     Payment.amount,
--     Rental.start_date,
--     Rental.end_date,
--     Rental.rental_status
-- FROM Rental
-- JOIN Customer ON Rental.customer_id = Customer.customer_id
-- JOIN Payment ON Rental.payment_id = Payment.payment_id;