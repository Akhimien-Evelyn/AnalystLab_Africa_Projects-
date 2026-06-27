--- SELECT / WHERE / ORDER BY
--- All shipped orders from the USA, most recent first
SELECT ordernumber, quantityordered, orderlinenumber, orderdate, status, country
FROM sales_data_sample
WHERE COUNTRY = 'USA'
AND status = 'shipped'
ORDER BY ORDERDATE DESC;

--- Total record count
SELECT COUNT(*) AS total_records 
FROM sales_data_sample;

--- Distinct entity count
SELECT
COUNT(DISTINCT ORDERNUMBER) AS Unique_orders,
COUNT(DISTINCT CUSTOMERNAME) AS Unique_customer,
COUNT(DISTINCT PRODUCTCODE) AS Unique_product,
COUNT(DISTINCT COUNTRY) AS Unique_countries
FROM sales_data_sample;

--- Creating Revenue column
ALTER TABLE sales_data_sample
ADD COLUMN Revenue DECIMAL(10,2);

--- Modifying revenue column
ALTER TABLE sales_data_sample
MODIFY COLUMN Revenue DECIMAL(20,2);

--- Updating Revenue column
UPDATE sales_data_sample
SET Revenue = quantityordered * priceeach;

--- Selected columns
SELECT ORDERNUMBER, QUANTITYORDERED, PRICEEACH, Revenue
FROM sales_data_sample;

--- GROUP BY + Aggregate functions
--- Total revenue, average order line value, and number of line items per product line
SELECT 
sum(Revenue) AS TotalRevenue,
round(avg(orderlinenumber),2) AS avg_line_value,
COUNT(DISTINCT productline) AS Line_Items
FROM sales_data_sample
group by PRODUCTLINE;

--- Total revenue, average order line value, and Total number of line items
SELECT 
sum(Revenue) AS TotalRevenue,
round(avg(orderlinenumber),2) AS avg_line_value,
COUNT(DISTINCT productline) AS Line_Items
FROM sales_data_sample;

--- GROUP BY + HAVING
--- Customers whose total lifetime spend exceeds $100,000
SELECT CUSTOMERNAME,
round(SUM(Revenue), 2) AS lifetime_spend
FROM sales_data_sample
GROUP BY CUSTOMERNAME
HAVING SUM(Revenue) > 100000
ORDER BY lifetime_spend DESC;

--- TOP 10 COUNTRRIES BY REVENUE
SELECT COUNTRY, SUM(REVENUE) AS total_revenue
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY total_revenue DESC
LIMIT 10;

--- 
SELECT COUNT(DISTINCT STATUS), STATUS
FROM sales_data_sample
GROUP BY STATUS;

--- Total quantity ordered by status and country
SELECT SUM(QUANTITYORDERED) AS total_quantity, STATUS, COUNTRY
FROM sales_data_sample
GROUP BY STATUS, COUNTRY;

--- THE DELIVERY STATUS OF GOODS
SELECT SUM(QUANTITYORDERED) AS total_quantity, STATUS
FROM sales_data_sample
GROUP BY STATUS;

--- total quantities shipped in each country
SELECT SUM(QUANTITYORDERED) AS total_quantity, STATUS, COUNTRY
FROM sales_data_sample
WHERE STATUS = 'Shipped'
GROUP BY STATUS, COUNTRY;

--- total quantities shipped in each country
SELECT SUM(QUANTITYORDERED) AS total_quantity, STATUS, COUNTRY
FROM sales_data_sample
WHERE STATUS = 'Shipped'
GROUP BY STATUS, COUNTRY;

--- total quantities cancelled and disputed in each country
SELECT SUM(QUANTITYORDERED) AS total_quantity, STATUS, COUNTRY
FROM sales_data_sample
WHERE STATUS IN  ('Disputed', 'Cancelled') 
GROUP BY STATUS, COUNTRY;

--- Total revenue by Year
SELECT YEAR_ID, SUM(Revenue) AS Total_Revenue
FROM sales_data_sample
GROUP BY YEAR_ID
ORDER BY Total_Revenue DESC;

--- Total revenue by month
SELECT MONTH_ID, SUM(Revenue) AS Total_Revenue
FROM sales_data_sample
GROUP BY MONTH_ID
ORDER BY Total_Revenue DESC;

--- Average order value
SELECT 
    SUM(SALES) AS total_revenue,
    SUM(QUANTITYORDERED) AS total_quantity_sold,
    AVG(SALES) AS avg_line_item_value,
    SUM(SALES) / COUNT(DISTINCT ORDERNUMBER) AS average_order_value
FROM sales_data_sample;

--- Annual revenue and order volume
SELECT 
    YEAR_ID, 
    SUM(SALES) AS annual_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales_data_sample
GROUP BY YEAR_ID
ORDER BY YEAR_ID;

--- monthly sales performance breakdown
SELECT 
    YEAR_ID,
    MONTH_ID,
    SUM(SALES) AS monthly_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales_data_sample
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

--- performance by product line
SELECT 
    PRODUCTLINE,
    SUM(SALES) AS total_revenue,
    SUM(QUANTITYORDERED) AS total_items_sold,
    COUNT(DISTINCT ORDERNUMBER) AS unique_orders_count
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY total_revenue DESC;

--- Deal size distribution
SELECT 
    DEALSIZE,
    COUNT(*) AS line_item_count,
    SUM(SALES) AS combined_sales_value
FROM sales_data_sample
GROUP BY DEALSIZE
ORDER BY combined_sales_value DESC;
