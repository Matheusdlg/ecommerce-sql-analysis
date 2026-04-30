-- =========================================
-- Customer Analysis
-- =========================================

-- Insight:
-- High-frequency customers are not necessarily the highest revenue generators.
-- This indicates different customer behavior patterns:
-- some customers buy frequently with smaller baskets,
-- while others generate high revenue with fewer purchases.


-- =========================================
-- Top Customers by Revenue
-- =========================================
-- Uses net revenue (includes returns) to reflect real customer value

SELECT 
CustomerID,
SUM(Quantity * UnitPrice) AS total_revenue
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE CustomerID IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$')
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================
-- Top Customers by Number of Orders
-- =========================================
-- Excludes cancelled invoices to count only completed purchases

SELECT 
CustomerID,
COUNT(DISTINCT InvoiceNo) AS total_orders
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$')
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;


-- =========================================
-- Average Order Value per Customer
-- =========================================
-- Combines revenue and order count to understand customer spending behavior

SELECT 
CustomerID,
SUM(Quantity * UnitPrice) AS total_revenue,
COUNT(DISTINCT InvoiceNo) AS total_orders,
SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE CustomerID IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$')
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;
