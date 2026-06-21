/* SELECTING EVERYTHING
*/
SELECT * FROM [ONLINE RETAIL CLEANED]

--- Total Row
SELECT COUNT(*) AS Total_Rows FROM [ONLINE RETAIL CLEANED]

--- Basic Statistics
SELECT 
    MIN(Quantity) AS Min_Qty,
    MAX(Quantity) AS max_qty,
    AVG(Quantity) AS avg_qty,
    STDEV(Quantity) AS StdDev_Quantity,
    MIN(UnitPrice) AS min_price,
    MAX(UnitPrice) AS max_price,
    AVG(UnitPrice) AS avg_price,
    MAX(Revenue) AS max_Revenue,
    AVG(Revenue) AS avg_Revenue,
    MIN(Revenue) AS Min_Revenue,
    STDEV(UnitPrice) AS StDev_price
FROM [ONLINE RETAIL CLEANED]

--- Total Revenue and Total Orders
SELECT
     ROUND(SUM(Revenue), 2) AS Total_Revenue,
     COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM [ONLINE RETAIL CLEANED]

--- Load or Confirm the Table Exist
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'ONLINE RETAIL CLEANED'

--- LOAD/VIEW FIRST 10 ROWS
SELECT TOP 10 * FROM [ONLINE RETAIL CLEANED] 

--- NUMBER OF COLUMNS
SELECT COUNT(*) AS Total_Columns
   FROM INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_NAME = 'ONLINE RETAIL CLEANED'

--- DISTINCT VALUES IN EVERY CATEGORICAL COLUMN
SELECT
COUNT(DISTINCT InvoiceNo) AS Unique_Invoices,
COUNT(DISTINCT StockCode) AS Unique_Products,
COUNT(DISTINCT Description) AS Unique_Descriptions,
COUNT(DISTINCT CustomerID) AS Unique_Customers,
COUNT(DISTINCT Country) AS Unique_Countries
FROM [ONLINE RETAIL CLEANED]

--- TOP 10 COUNTRIES
SELECT TOP 10 COUNTRY,
     COUNT(*) AS Transaction_Count
FROM [ONLINE RETAIL CLEANED]
GROUP BY Country
ORDER BY Transaction_Count DESC

--- EXPLORATORY ANALYSIS
------- TOP SELLING PRODUCTS (BY REVENUE)
SELECT TOP 10 Description,
     COUNT(*) AS Transaction_Count,
     SUM(Quantity) AS Quantity,
     ROUND(SUM(Revenue), 2) AS Revenue,
     ROUND(AVG(UnitPrice), 2) AS Avg_Price
     FROM [ONLINE RETAIL CLEANED]
     WHERE Description IS NOT NULL
     GROUP BY Description
     ORDER BY Revenue DESC
  
  ---- HIGHEST REVENUE GENERATING COUNTRIES
  SELECT TOP 10 Country,
  COUNT(DISTINCT InvoiceNo) AS Total_Orders,
  COUNT(DISTINCT CustomerID) AS Total_Customers,
  SUM(Quantity) AS Total_Units_Sold,
  ROUND(SUM(Revenue), 2) AS Total_Revenue,
  ROUND(SUM(Revenue) * 100.0 / 
         SUM(SUM(Revenue)) OVER (),2) AS Revenue_Pct
         FROM [ONLINE RETAIL CLEANED]
         GROUP BY Country
         ORDER BY Total_Revenue DESC

    --- MONTHLY SALES TREND
    SELECT YEAR(InvoiceDate) AS YEAR,
           MONTH(InvoiceDate) AS Month_Num,
           DATENAME(MONTH,InvoiceDate) AS Month_Name,
           COUNT(DISTINCT InvoiceNo) AS Total_Orders,
           SUM(Quantity) AS Total_Units_Sold,
           ROUND(SUM(Revenue), 2) AS Monthly_Revenue,
           ROUND(AVG(Revenue), 2) AS Avg_Order_Revenue
    FROM [ONLINE RETAIL CLEANED]
    GROUP BY 
           YEAR(InvoiceDate),
           MONTH(InvoiceDate),
           DATENAME(MONTH, InvoiceDate)
    ORDER BY YEAR, Month_Num

 ---- MOST PURCHASED PRODUCTS (BY QUANTITY)
    SELECT TOP 10 Description AS Product,
           SUM(Quantity) AS Total_Units_Sold,
           COUNT(DISTINCT InvoiceNo) AS Orders_Containing_Product,
           COUNT(DISTINCT CustomerID) AS Customers_Who_Bought,
           ROUND(AVG(UnitPrice), 2) AS Avg_Price
           FROM [ONLINE RETAIL CLEANED]
           WHERE Description IS NOT NULL
           GROUP BY Description
           ORDER BY Total_Units_Sold DESC

--- CUSTOMER PURCHASING BEHAVIOUR
   SELECT TOP 15 CustomerID, Country,
          COUNT(DISTINCT InvoiceNo) AS Total_Orders,
          SUM(Quantity) AS Total_Items_Bought,
          ROUND(SUM(Revenue), 2) AS Total_Spent,
          ROUND(AVG(Revenue), 2) AS Avg_Order_Value,
          MIN(CAST(InvoiceDate AS date)) AS First_Purchase,
          MAX(CAST(InvoiceDate AS date)) AS Last_Purchase,
          DATEDIFF(DAY,
                MIN(InvoiceDate),
                MAX(InvoiceDate)) AS Date_Diff
  FROM [ONLINE RETAIL CLEANED]
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID, Country
    ORDER BY Total_Spent DESC

--- ORDER SIZE DISTRIBUTION
SELECT CASE
    WHEN Quantity BETWEEN 1 AND 5 THEN '1-5 Units'
    WHEN Quantity BETWEEN 6 AND 10 THEN '6-10 Units'
    WHEN Quantity BETWEEN 11 AND 20 THEN '11-20 Units'
    WHEN Quantity BETWEEN 21 AND 50 THEN '21-50 Units'
    WHEN Quantity BETWEEN 51 AND 100 THEN '51-100 Units'
    ELSE '100+ UNITS'
  END AS Order_Size_Group,
  COUNT(*) AS Num_Transactions,
  ROUND(COUNT(*) * 100.0/ 
      SUM(COUNT(*)) OVER(), 2) AS Pct_Of_Total
  FROM [ONLINE RETAIL CLEANED]
  GROUP BY
  CASE
     WHEN Quantity BETWEEN 1 AND 5 THEN '1-5 Units'
    WHEN Quantity BETWEEN 6 AND 10 THEN '6-10 Units'
    WHEN Quantity BETWEEN 11 AND 20 THEN '11-20 Units'
    WHEN Quantity BETWEEN 21 AND 50 THEN '21-50 Units'
    WHEN Quantity BETWEEN 51 AND 100 THEN '51-100 Units'
    ELSE '100+ UNITS'
  END 
  ORDER BY MIN(Quantity)
     
      