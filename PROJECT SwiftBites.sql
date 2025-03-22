CREATE DATABASE SwiftBites;
USE SwiftBites;

CREATE TABLE Customers (
Cust_ID VARCHAR(10) PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
PhoneNum VARCHAR(15),
Address VARCHAR(255),
RegistrationDate date
); 

CREATE TABLE Restaurant (
Restaurant_ID VARCHAR(10) PRIMARY KEY,
Name VARCHAR(100),
Address VARCHAR(255),
Number VARCHAR(15),
TypeFood VARCHAR(50),
Hours VARCHAR(50)
);

CREATE TABLE Delivery_Rides (
Rider_ID VARCHAR(10) PRIMARY KEY,
Name VARCHAR(100),
PhoneNumber VARCHAR(15),
VehicleType VARCHAR(50),
AvailabilityStatus VARCHAR(20),
Ratings DECIMAL(2,1)
); 

CREATE TABLE Orders (
Order_ID VARCHAR(10) PRIMARY KEY,
Cust_ID VARCHAR(10),
Restaurant_ID VARCHAR(10),
Rider_ID VARCHAR(10),
OrderDate DATE,
TotalAmount DECIMAL(6,2),
OrderStatus VARCHAR(20),
PaymentMethod VARCHAR(50),
FOREIGN KEY (Cust_ID) REFERENCES Customers (Cust_ID),
FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
FOREIGN KEY (Rider_ID) REFERENCES Delivery_Rides(Rider_ID)
);

CREATE TABLE Menu_Items (
Item_ID VARCHAR(10) PRIMARY KEY,
Restaurant_ID VARCHAR(10),
ItemName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(6,2),
Availability VARCHAR(20),
FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Payments (
Payment_ID INT PRIMARY KEY,
Cust_ID VARCHAR(10),
Order_ID VARCHAR(10),
Amount DECIMAL(6,2),
Payment_Method VARCHAR(50),
Payment_Status VARCHAR(20),
Transaction_Date DATETIME,
FOREIGN KEY (Cust_ID) REFERENCES Customers(Cust_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

ALTER TABLE Customers 
ADD (Gender VARCHAR(10), DateofBirth DATE);

SHOW COLUMNS FROM Customers;

SELECT * FROM Customers;
SELECT * FROM Restaurant;
SELECT * FROM Delivery_Rides;
SELECT * FROM Orders;
SELECT * FROM Menu_Items;
SELECT * FROM Payments;

INSERT INTO Customers 
(Cust_ID, Name, Email, PhoneNum, Address, RegistrationDate, Gender, DateofBirth)
VALUES
('001', 'Emma Watson', 'emmawatson@gmail.com', '1123456665', '123 St, City A', '2023-09-12', 'Female', '1990-03-12'),
('002', 'Rihana Chong', 'rihannachong@gmail.com', '0986384618', '22 St, City B', '2023-03-21', 'Female', '1992-05-10'),
('003', 'Olivia Wilson', 'oliviaWilson@gmail.com', '0877646700', '145 St, City C', '2022-11-01', 'Female', '1988-11-11'),
('004', 'Adam Smith', 'AdamSmith@gmail.com', '1722341120', '111 St, City D', '2022-03-19', 'Male', '1990-02-12'),
('005', 'Ariana Smith', 'ArianaGrande@gmail.com', '1134257809', '10 St, City D', '2022-07-15', 'Female', '1994-05-21'),
('006', 'Shawn Lukas', 'shawnluk@gmail.com', '1290937125', '145 St, City A', '2022-10-25', 'Female', '1990-12-12'),
('007', 'Charlie Holmes', 'CharlieHolmes@gmail.com', '1111342422', '37 St, City B', '2009-09-11', 'Female', '1992-05-11'),
('008', 'Taylor Rodrigo', 'TaylorRod@gmail.com', '0332171822', '257 St, City C', '2014-05-12', 'Female', '1988-07-25'),
('009', 'Ketty Sarah', 'KetSarah@gmail.com', '1742332754', '999 St, City D', '2022-11-06', 'Male', '1990-06-06'),
('010', 'Bruno Alli', 'BrunoAlli@gmail.com', '0194257809', '876, St, City D', '2016-11-12', 'Female', '1993-04-28');

INSERT INTO Restaurant 
(Restaurant_ID, Name, Address, Number, TypeFood, Hours) 
VALUES
('R001', 'Tasty Bites', '321 St, City A', '0987655544', 'Fast Food', '10:00am-10:00pm'),
('R002', 'Sushi Express', '654 Ocean Rd, City B', '0887765433', 'Japanese', '9:00am-11:00am'),
('R003', 'Italian Feast', '789 Pasta Ave, City C', '1922324555', 'Italian', '11:00am-9:00pm'),
('R004', 'Healthy Greens', '234 Vegan St, City A', '9876543323', 'Vegan', '8:00am-8:00pm'),
('R005', 'BBQ Heaven', '887 Grill St, City B', '1233435798', 'BBQ', '2:00pm-1:00am'),
('R006', 'Ocean Delights', '45 Beach Ave, City A', '0987651234', 'Seafood', '10:30am-9:30pm'),
('R007', 'Spicy Hub', '123 Curry St, City B', '0897612345', 'Indian', '11:00am-11:00pm'),
('R008', 'Steak House', '777 Grill Rd, City C', '0998765432', 'Steakhouse', '12:00pm-12:00am'),
('R009', 'Green Garden', '99 Healthy St, City A', '0912345678', 'Vegetarian', '7:00am-7:00pm'),
('R010', 'Sweet Treats', '555 Dessert Ln, City B', '0876543219', 'Desserts', '9:00am-10:00pm');

INSERT INTO Delivery_Rides 
(Rider_ID, Name, PhoneNumber, VehicleType, AvailabilityStatus, Ratings) 
VALUES
('D001', 'Alex John', '9012345666', 'Motorcycle', 'Available', 4.8),
('D002', 'Sarah Hudson', '0987655142', 'Car', 'On Delivery', 4.6),
('D003', 'Jake Miller', '0876543393', 'Scooter', 'Available', 4.9),
('D004', 'Emily Alexander', '1233409876', 'Motorcycle', 'Off Duty', 4.8),
('D005', 'Ryan McWilson', '8976543321', 'Bicycle', 'Available', 5.0),
('D006', 'Nathan Drake', '0987650987', 'Van', 'Available', 4.7),
('D007', 'Sophia Carter', '0912345678', 'Motorcycle', 'On Delivery', 4.5),
('D008', 'Michael Brown', '0898765432', 'Car', 'Off Duty', 4.6),
('D009', 'Emily Watson', '0876543210', 'Bicycle', 'Available', 4.9),
('D010', 'Daniel Lee', '0998765432', 'Scooter', 'On Delivery', 4.8);

INSERT INTO Orders 
(Order_ID, Cust_ID, Restaurant_ID, Rider_ID, OrderDate, TotalAmount, OrderStatus, PaymentMethod)
VALUES
('O001', '001', 'R001', 'D001', '2023-02-05', 29.90, 'Delivered', 'Credit Card'),
('O002', '002', 'R002', 'D002', '2023-04-12', 15.00, 'In Progress', 'PayPal'),
('O003', '003', 'R003', 'D003', '2023-05-24', 32.40, 'Delivered', 'Cash'),
('O004', '004', 'R004', 'D004', '2023-08-11', 15.90, 'Cancelled', 'Debit Card'),
('O005', '005', 'R005', 'D005', '2023-10-12', 22.30, 'Out for Delivery', 'Debit Card'),
('O006', '006', 'R006', 'D006', '2023-11-20', 45.50, 'Delivered', 'Credit Card'),
('O007', '007', 'R007', 'D007', '2023-12-05', 18.75, 'Preparing', 'PayPal'),
('O008', '008', 'R008', 'D008', '2024-01-15', 60.00, 'Delivered', 'Cash'),
('O009', '009', 'R009', 'D009', '2024-02-01', 25.00, 'Out for Delivery', 'Credit Card'),
('O010', '010', 'R010', 'D010', '2024-03-10', 35.20, 'Delivered', 'Debit Card');

INSERT INTO Menu_Items 
(Item_ID, Restaurant_ID, ItemName, Category, Price, Availability)
VALUES
('M001', 'R001', 'Cheeseburger', 'Fast Food', 10.90, 'Available'),
('M002', 'R002', 'Salmon Sushi', 'Japanese', 9.90, 'Available'),
('M003', 'R003', 'Pepperoni Pizza', 'Italian', 19.90, 'Available'),
('M004', 'R004', 'Vegan Beef Bowl', 'Vegan', 15.00, 'Out of Stock'),
('M005', 'R005', 'BBQ Chicken Wings', 'BBQ', 23.99, 'Available'),
('M006', 'R002', 'Teriyaki Chicken', 'Japanese', 12.50, 'Available'),
('M007', 'R001', 'Double Cheeseburger', 'Fast Food', 14.90, 'Available'),
('M008', 'R003', 'Margherita Pizza', 'Italian', 18.90, 'Out of Stock'),
('M009', 'R005', 'Spicy BBQ Ribs', 'BBQ', 27.99, 'Available'),
('M010', 'R004', 'Vegan Tofu Salad', 'Vegan', 11.50, 'Available');

INSERT INTO Payments 
(Payment_ID, Cust_ID, Order_ID, Amount, Payment_Method, Payment_Status, Transaction_Date)
VALUES
(101, '001', 'O001', 25.99, 'Credit Card', 'Completed', '2025-03-02 12:30:43'),
(102, '002', 'O002', 18.50, 'PayPal', 'Failed', '2025-02-25 11:49:08'),
(103, '003', 'O003', 12.80, 'Cash', 'Pending', '2025-03-10 14:32:19'),
(104, '004', 'O004', 30.00, 'Debit Card', 'Completed', '2025-03-09 13:17:27'),
(105, '005', 'O005', 22.00, 'Cash', 'Pending', '2025-03-08 13:21:14'),
(106, '006', 'O006', 45.50, 'Credit Card', 'Completed', '2025-03-05 10:15:30'),
(107, '007', 'O007', 19.99, 'PayPal', 'Pending', '2025-03-11 16:45:55'),
(108, '008', 'O008', 27.75, 'Cash', 'Completed', '2025-03-06 09:10:22'),
(109, '009', 'O009', 35.00, 'Debit Card', 'Failed', '2025-03-07 18:22:40'),
(110, '010', 'O010', 50.00, 'Credit Card', 'Pending', '2025-03-12 20:05:18');

UPDATE Customers
SET Name = 'Shawn Menderes' , Email = 'ShawnMender@gmail.com'
WHERE Name = 'Shawn Lukas';

DELETE FROM Customers 
WHERE Name='Bruno Alli';

SELECT * FROM Customers WHERE Gender = 'Female'; -- Retrieve Records with Condition
SELECT * FROM Orders WHERE OrderStatus = 'Delivered' AND PaymentMethod = 'Cash'; -- Retrieve Records with Two Condition

-- Sorting Records
SELECT * FROM Delivery_Rides ORDER BY Ratings DESC;

-- Joining Two Tables
SELECT Customers.Name, Orders.OrderDate, Orders.TotalAmount
FROM Customers
JOIN Orders ON Customers.Cust_ID = Orders.Cust_ID;

-- Join Three Tables
SELECT Orders.Order_ID, Customers.Name, Restaurant.Name
FROM Orders
JOIN Customers ON Orders.Cust_ID = Customers.Cust_ID
JOIN Restaurant ON Orders.Restaurant_ID = Restaurant.Restaurant_ID;

-- Aggregate Functions
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT MIN(TotalAmount) AS MinimumOrder FROM Orders;
SELECT MAX(TotalAmount) AS MaximumOrder FROM Orders;
SELECT AVG(Ratings) AS AverageRating FROM Delivery_Rides;