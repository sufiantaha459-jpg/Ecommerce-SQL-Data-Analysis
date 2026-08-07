-- Project 3: Ecommerce SQL Data Analysis


-- Query 1: Display a sample of 10 orders
SELECT *
FROM orders
LIMIT 10;


-- Query 2: Count all imported orders
SELECT COUNT(*) AS TotalOrders
FROM orders;


-- Query 3: Display delivered orders
SELECT *
FROM orders
WHERE OrderStatus = 'Delivered'
LIMIT 10;


-- Query 4: Display the 10 highest-value orders
SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;


-- Query 5: Calculate total revenue by product
SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM orders
GROUP BY Product
ORDER BY TotalRevenue DESC;


-- Query 6: Count orders by status
SELECT
    OrderStatus,
    COUNT(*) AS NumberOfOrders
FROM orders
GROUP BY OrderStatus
ORDER BY NumberOfOrders DESC;


-- Query 7: Calculate average unit price by product
SELECT
    Product,
    ROUND(AVG(UnitPrice), 2) AS AverageUnitPrice
FROM orders
GROUP BY Product
ORDER BY AverageUnitPrice DESC;


-- Query 8: Analyse delivered orders and revenue by product
SELECT
    Product,
    COUNT(*) AS DeliveredOrders,
    ROUND(SUM(TotalPrice), 2) AS DeliveredRevenue
FROM orders
WHERE OrderStatus = 'Delivered'
GROUP BY Product
ORDER BY DeliveredRevenue DESC;