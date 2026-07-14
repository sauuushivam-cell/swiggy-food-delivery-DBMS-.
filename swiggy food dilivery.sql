-- Swiggy Food Delivery Database Project

-- Customers Table
CREATE TABLE Customers(
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Phone TEXT,
    Address TEXT
);


-- Restaurants Table
CREATE TABLE Restaurants(
    RestaurantID INTEGER PRIMARY KEY,
    RestaurantName TEXT,
    Location TEXT,
    Rating REAL
);


-- Menu Items Table
CREATE TABLE Menu_Items(
    ItemID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    ItemName TEXT,
    Category TEXT,
    Price REAL,
    FOREIGN KEY(RestaurantID) REFERENCES Restaurants(RestaurantID)
);


-- Delivery Partners Table
CREATE TABLE Delivery_Partners(
    PartnerID INTEGER PRIMARY KEY,
    PartnerName TEXT,
    Phone TEXT
);


-- Orders Table
CREATE TABLE Orders(
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    RestaurantID INTEGER,
    PartnerID INTEGER,
    OrderDate TEXT,
    Status TEXT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY(PartnerID) REFERENCES Delivery_Partners(PartnerID)
);


-- Order Items Table
CREATE TABLE Order_Items(
    OrderItemID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    ItemID INTEGER,
    Quantity INTEGER,
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY(ItemID) REFERENCES Menu_Items(ItemID)
);


-- Payments Table
CREATE TABLE Payments(
    PaymentID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    Amount REAL,
    PaymentMode TEXT,
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);


-- Reviews Table
CREATE TABLE Reviews(
    ReviewID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    RestaurantID INTEGER,
    Rating INTEGER,
    Comment TEXT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(RestaurantID) REFERENCES Restaurants(RestaurantID)
);


-- Insert Customer Data
INSERT INTO Customers VALUES
(1,'Shivam','9876543210','Guna'),
(2,'Rahul','9123456780','Indore'),
(3,'Aman','9988776655','Bhopal');


-- Insert Restaurant Data
INSERT INTO Restaurants VALUES
(101,'Food Palace','Guna',4.5),
(102,'Pizza Point','Indore',4.3),
(103,'Burger Hub','Bhopal',4.6);


-- Insert Menu Data
INSERT INTO Menu_Items VALUES
(1,101,'Burger','Fast Food',120),
(2,102,'Pizza','Italian',250),
(3,103,'French Fries','Fast Food',100);


-- Insert Delivery Partner Data
INSERT INTO Delivery_Partners VALUES
(201,'Raj','9876501234'),
(202,'Vikas','9123456789');


-- Insert Orders Data
INSERT INTO Orders VALUES
(5001,1,101,201,'2026-07-15','Delivered'),
(5002,2,102,202,'2026-07-15','Delivered');


-- Insert Order Items Data
INSERT INTO Order_Items VALUES
(1,5001,1,2),
(2,5002,2,1);


-- Insert Payments Data
INSERT INTO Payments VALUES
(9001,5001,240,'UPI'),
(9002,5002,250,'Card');


-- Insert Reviews Data
INSERT INTO Reviews VALUES
(1,1,101,5,'Good Food'),
(2,2,102,4,'Nice Pizza');


-- Display Output
SELECT * FROM Customers;

SELECT * FROM Orders;
