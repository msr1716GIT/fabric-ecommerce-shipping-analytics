/*==============================================================================
Script Name : 01_create_silver_table.sql

Purpose     : Creates the Silver layer by standardizing data types,
              validating the source data, and implementing business-friendly
              attributes for downstream reporting.

Input       : bronze_shipping_data

Output      : silver_shipping_data

Project     : End-to-End E-Commerce Shipping Analytics
Platform    : Microsoft Fabric
==============================================================================*/

CREATE OR ALTER PROCEDURE usp_create_silver_table
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Drop Silver table if it already exists
    DROP TABLE IF EXISTS dbo.silver_shipping_data;


    -- Step 2: Create the Silver table with proper schemas and transformed business logic
    CREATE TABLE dbo.silver_shipping_data AS
    SELECT 
        -- Core Identifiers & Metrics (Standardizing Column Names)
        CAST(ID AS INT)                             AS Order_ID,
        CAST(Warehouse_block AS VARCHAR(10))        AS Warehouse_Block,
        CAST(Mode_of_Shipment AS VARCHAR(50))       AS Shipping_Mode,
        CAST(Customer_care_calls AS INT)            AS Customer_Care_Calls,
        CAST(Customer_rating AS INT)                AS Customer_Rating,
        CAST(Cost_of_the_Product AS DECIMAL(10, 2)) AS Product_Cost,
        CAST(Prior_purchases AS INT)                AS Prior_Purchases,
        CAST(Product_importance AS VARCHAR(20))     AS Product_Importance,
        CAST(Gender AS VARCHAR(10))                 AS Gender,
        CAST(Discount_offered AS DECIMAL(10, 2))    AS Discount_Offered,
        CAST(Weight_in_gms AS INT)                  AS Weight_in_Grams,
        CAST([Reached.on.Time_Y.N] AS INT)          AS Reached_On_Time,

        -- Business Logic Transformations
        CASE 
            WHEN [Reached.on.Time_Y.N] = 1 THEN 'Delayed'
            WHEN [Reached.on.Time_Y.N] = 0 THEN 'On-Time'
            ELSE 'Unknown'
        END AS Delivery_Status,

        CASE 
            WHEN Discount_offered > 20 THEN 'Aggressive Discount'
            ELSE 'Standard Pricing'
        END AS Pricing_Category,

        -- Audit Metadata
        CAST(GETDATE() AS DATETIME2(6))             AS Silver_Load_Timestamp

    FROM lh_ecom_shipping.dbo.bronze_shipping_data;


END;

/******************************************************************************
End of Procedure
******************************************************************************/