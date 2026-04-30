# 📊 E-commerce Sales Analysis (Online Retail Dataset)

## Objective

This project analyzes the Online Retail dataset from a UK-based e-commerce company to identify sales patterns, seasonality, customer behavior, and product performance, aiming to uncover insights that can improve business performance.

---

## Dataset

The dataset used in this project is the Online Retail dataset, available on Kaggle.  
It contains transactional data from a UK-based e-commerce company.

The dataset includes the following key fields:

- **InvoiceNo**: Unique identifier for each transaction. Multiple products purchased in the same order share the same InvoiceNo.
- **StockCode**: Product identifier. May also include codes for operational entries such as fees and postage.
- **Description**: Product name or description.
- **Quantity**: Number of units purchased per transaction.
- **InvoiceDate**: Date and time of the transaction.
- **UnitPrice**: Price per unit of the product.
- **CustomerID**: Unique identifier for each customer.
- **Country**: Country where the customer is located.

---

## Data Cleaning

The following data cleaning steps were applied to ensure consistency and accuracy in the analysis:

- **Removal of non-product entries**:  
  StockCodes composed only of letters were excluded, as they represent operational records such as fees, postage, or services, which could distort product and revenue analysis.

- **Handling of returns (negative quantities)**:  
  Returns were kept in the dataset to calculate net revenue. This ensures that refunded transactions offset original purchases, providing a more realistic view of business performance.

- **Handling of cancellations**:  
  Cancellation records (InvoiceNo starting with 'C') were treated depending on the metric.  
  - Included when calculating revenue (to maintain net values)  
  - Excluded when counting orders (to reflect only completed transactions)

- **Null value treatment**:  
  Records with NULL values in key fields (such as CustomerID and Description) were handled to avoid distortions in rankings and aggregations, ensuring more reliable insights.

---

## Analysis

The analysis was divided into three main parts:

- **EDA (Exploratory Data Analysis)**  
  Overall metrics such as total revenue, total orders, number of customers, and average order value.

- **Product Analysis**  
  Identification of top products by quantity sold and revenue.

- **Customer Analysis**  
  Evaluation of customer behavior through revenue, number of orders, and average order value.

---

## Key Insights

- **Sales Growth Over Time**  
  Sales show a clear upward trend over the analyzed period, indicating business growth and expansion of the e-commerce operation.

- **Seasonality and Peak Periods**  
  November 2011 represents the peak in both revenue and order volume, highlighting strong seasonality driven by holiday shopping (Black Friday and Christmas).  
  A similar pattern can be observed in December 2010, which outperformed the following early months of 2011.

- **Customer Behavior Patterns**  
  High-frequency customers are not necessarily the highest revenue generators.  
  Customers with many orders tend to have smaller basket sizes, while top revenue customers typically have higher average order values with fewer transactions.

- **Product Performance Dynamics**  
  Products with high sales volume are not always the top revenue drivers.  
  High-volume products tend to have lower unit prices, generating scale in quantity but not necessarily in revenue, while higher-priced products contribute more significantly to total revenue.

---

## Tools Used

- **SQL (BigQuery)** for data querying and analysis  
- **GitHub** for project organization and version control

---
