-- =========================================
-- Product Analysis
-- =========================================

-- Definition:
-- Valid products = StockCodes that are NOT composed only of letters
-- (letter-only codes represent operational entries such as fees and postage)

-- =========================================
-- Top Products by Quantity Sold
-- =========================================
-- Uses net quantity (includes returns)
-- This avoids overestimating products with large sales that were later fully returned

SELECT 
UPPER(Description) AS product,
SUM(Quantity) AS total_quantity
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE Description IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$')
GROUP BY UPPER(Description)
ORDER BY total_quantity DESC
LIMIT 10;


-- =========================================
-- Top Products by Revenue
-- =========================================
-- Uses net revenue (includes returns)
-- Prevents misleading rankings caused by large transactions that were refunded

SELECT 
UPPER(Description) AS product,
SUM(Quantity * UnitPrice) AS total_revenue
FROM `projeto-01-sql-online-reta.retail_projeto_01.retail`
WHERE Description IS NOT NULL
AND NOT REGEXP_CONTAINS(StockCode, '^[A-Za-z]+$')
GROUP BY UPPER(Description)
ORDER BY total_revenue DESC
LIMIT 10;
