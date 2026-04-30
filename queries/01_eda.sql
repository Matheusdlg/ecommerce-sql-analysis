-- =========================================
-- Exploratory Data Analysis (EDA)
-- =========================================

-- Definition:
-- Valid products = StockCodes that are NOT composed only of letters
-- (letter-only codes represent operational entries such as fees, postage, etc.)

-- =========================================
-- Total Revenue (Net)
-- =========================================
-- Includes returns (negative quantities) to reflect real net revenue

SELECT 
SUM(Quantity * UnitPrice) AS total_revenue
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE StockCode IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$');


-- =========================================
-- Total Orders
-- =========================================
-- Excludes cancelled invoices (InvoiceNo starting with 'C')
-- Keeps only orders containing valid products

SELECT 
COUNT(DISTINCT InvoiceNo) AS total_orders
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE InvoiceNo NOT LIKE 'C%'
AND StockCode IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$');


-- =========================================
-- Total Customers
-- =========================================
-- Counts only customers who purchased valid products

SELECT 
COUNT(DISTINCT CustomerID) AS total_customers
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE CustomerID IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$');


-- =========================================
-- Average Order Value (AOV)
-- =========================================
-- Calculated as total revenue divided by total number of orders

SELECT 
SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE InvoiceNo NOT LIKE 'C%'
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$');
