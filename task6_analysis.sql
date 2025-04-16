
-- Create the online_sales table with 17 columns
CREATE TABLE online_sales (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TEXT,
    UnitPrice REAL,
    CustomerID TEXT,
    Country TEXT,
    Discount REAL,
    PaymentMethod TEXT,
    ShippingCost REAL,
    Category TEXT,
    SalesChannel TEXT,
    ReturnStatus TEXT,
    ShipmentProvider TEXT,
    WarehouseLocation TEXT,
    OrderPriority TEXT
);

-- Query to compute monthly revenue and order volume
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

-- Query to get the top 3 months by total revenue
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
