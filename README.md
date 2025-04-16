# Task 6 – Sales Trend Analysis Using SQL

## 📌 Objective
To analyze monthly revenue and order volume using SQL aggregation techniques on an e-commerce dataset.

## 🧰 Tools Used
- SQLite3

## 📁 Dataset
File: online_sales_dataset.csv  
Total Columns: 17  
Relevant Columns Used:
- InvoiceDate: Date of the order
- InvoiceNo: Order ID
- Quantity, UnitPrice, Discount, ShippingCost: Used to calculate revenue

## 🧠 Logic
*Revenue Formula*:

Revenue = (Quantity × UnitPrice) - Discount + ShippingCost


## 🧊 Table Schema
The table online_sales contains 17 columns including:
InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, Discount, PaymentMethod, ShippingCost, Category, SalesChannel, ReturnStatus, ShipmentProvider, WarehouseLocation, OrderPriority.

## 📊 SQL Queries

### 📅 Monthly Revenue & Order Volume
sql
SELECT 
    strftime('%Y-%m', InvoiceDate) AS year_month,
    SUM((Quantity * UnitPrice) - Discount + ShippingCost) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM 
    online_sales
GROUP BY 
    year_month
ORDER BY 
    year_month;


### 🥇 Top 3 Months by Revenue
sql
SELECT 
    strftime('%Y-%m', InvoiceDate) AS year_month,
    SUM((Quantity * UnitPrice) - Discount + ShippingCost) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM 
    online_sales
GROUP BY 
    year_month
ORDER BY 
    total_revenue DESC
LIMIT 3;


## 📦 Output
The queries generate:
- Monthly revenue and order count trends
- Top 3 months with the highest sales

*Good luck and happy querying!*
