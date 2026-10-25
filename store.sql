USE StoreDB;
GO
INSERT INTO Customers (FullName, PhoneNumber, Email, ShippingAddress, RegistrationDate)
VALUES ('John Doe', '01012345678', 'john@email.com', 'Cairo, Egypt', '2026-06-01');
INSERT INTO Suppliers (Name, Country, Email, Address, ContactNumber)
VALUES 
('Tech Solutions', 'USA', 'info@tech.com', 'New York', '123456789'),
('Global Goods', 'Germany', 'contact@global.de', 'Berlin', '987654321'),
('Fast Logistics', 'Egypt', 'support@fast.eg', 'Cairo', '011223344');
INSERT INTO Categories (Name, Description, MainCategory)
VALUES 
('Electronics', 'Electronic devices and gadgets', NULL),
('Clothing', 'Men and Women apparel', NULL);
INSERT INTO Products (Name, UnitPrice)
VALUES ('Wireless Mouse', 250.00);
CREATE TABLE ArchivedStock (
    TranId INT PRIMARY KEY,
    ProductId INT,
    QuantityChange INT,
    TranDate DATETIME
);
INSERT INTO ArchivedStock (TranId, ProductId, QuantityChange, TranDate)
SELECT TransId, ProductId, QuantityChange, TransDate
FROM StockTransactions
WHERE TransDate < '2023-01-01';
UPDATE Products
SET UnitPrice = UnitPrice * 1.10
WHERE UnitPrice < 100.00;
UPDATE Orders
SET Status = CASE 
    WHEN OrderAmount > 5000 THEN 'Premium'
    ELSE 'Standard'
END;