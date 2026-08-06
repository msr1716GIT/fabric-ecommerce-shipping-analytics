/*==============================================================================
Script Name : 02_silver_data_profile.sql

Purpose     : Profiles the Silver layer to confirm row counts, uniqueness, 
              missing values, data type consistency, numeric ranges, 
              and category distributions before downstream processing.

Input       : silver_shipping_data

Output      : silver_shipping_data

Project     : End-to-End E-Commerce Shipping Analytics
Platform    : Microsoft Fabric
==============================================================================*/

--------------------------------------------------------------
-- 1. Total Rows
--------------------------------------------------------------
SELECT COUNT(*) AS Total_Rows
FROM silver_shipping_data;


--------------------------------------------------------------
-- 2. Duplicate Order IDs
--------------------------------------------------------------
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Order_ID) AS Distinct_Order_IDs,
    COUNT(*) - COUNT(DISTINCT Order_ID) AS Duplicate_Order_IDs
FROM silver_shipping_data;


--------------------------------------------------------------
-- 3. Missing Values
--------------------------------------------------------------
SELECT
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Order_ID,
    SUM(CASE WHEN Warehouse_Block IS NULL THEN 1 ELSE 0 END) AS Warehouse_Block,
    SUM(CASE WHEN Shipping_Mode IS NULL THEN 1 ELSE 0 END) AS Shipping_Mode,
    SUM(CASE WHEN Customer_Care_Calls IS NULL THEN 1 ELSE 0 END) AS Customer_Care_Calls,
    SUM(CASE WHEN Customer_Rating IS NULL THEN 1 ELSE 0 END) AS Customer_Rating,
    SUM(CASE WHEN Product_Cost IS NULL THEN 1 ELSE 0 END) AS Product_Cost,
    SUM(CASE WHEN Prior_Purchases IS NULL THEN 1 ELSE 0 END) AS Prior_Purchases,
    SUM(CASE WHEN Product_Importance IS NULL THEN 1 ELSE 0 END) AS Product_Importance,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender,
    SUM(CASE WHEN Discount_Offered IS NULL THEN 1 ELSE 0 END) AS Discount_Offered,
    SUM(CASE WHEN Weight_in_Grams IS NULL THEN 1 ELSE 0 END) AS Weight_in_Grsms
FROM silver_shipping_data;


--------------------------------------------------------------
-- 4. Numeric Ranges
--------------------------------------------------------------
SELECT
    MIN(Product_Cost) AS Min_Product_Cost,
    MAX(Product_Cost) AS Max_Product_Cost,
    AVG(Product_Cost) AS Avg_Product_Cost,

    MIN(Discount_Offered) AS Min_Discount,
    MAX(Discount_Offered) AS Max_Discount,
    AVG(Discount_Offered) AS Avg_Discount,

    MIN(Weight_in_Grams) AS Min_Weight,
    MAX(Weight_in_Grams) AS Max_Weight,
    AVG(Weight_in_Grams) AS Avg_Weight
FROM silver_shipping_data;


--------------------------------------------------------------
-- 5. Category Distribution
--------------------------------------------------------------

WITH CombinedData AS (
    SELECT 'Warehouse Block' AS Category, Warehouse_Block AS Item, COUNT(*) AS Orders
    FROM silver_shipping_data
    GROUP BY Warehouse_Block

    UNION ALL

    SELECT 'Shipping Mode' AS Category, Shipping_Mode AS Item, COUNT(*) AS Orders
    FROM silver_shipping_data
    GROUP BY Shipping_Mode

    UNION ALL

    SELECT 'Product Importance' AS Category, Product_Importance AS Item, COUNT(*) AS Orders
    FROM silver_shipping_data
    GROUP BY Product_Importance

    UNION ALL

    SELECT 'Gender' AS Category, Gender AS Item, COUNT(*) AS Orders
    FROM silver_shipping_data
    GROUP BY Gender
)
SELECT Category, Item, Orders
FROM CombinedData
ORDER BY 
    CASE Category 
        WHEN 'Warehouse Block' THEN 1
        WHEN 'Shipping Mode' THEN 2
        WHEN 'Product Importance' THEN 3
        WHEN 'Gender' THEN 4
    END,
    Orders DESC;


--------------------------------------------------------------
-- 6. Customer Rating Distribution
--------------------------------------------------------------
SELECT
    Customer_Rating,
    COUNT(*) AS Orders
FROM silver_shipping_data
GROUP BY Customer_Rating
ORDER BY Customer_Rating;


--------------------------------------------------------------
-- 7. Data Type Validation
--------------------------------------------------------------
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'silver_shipping_data'
ORDER BY ORDINAL_POSITION;
