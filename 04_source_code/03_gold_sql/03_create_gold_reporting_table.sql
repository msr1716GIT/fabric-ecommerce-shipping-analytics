/*==============================================================================
Script Name : 03_create_gold_reporting_table.sql

Purpose     : Creates the gold table structure to load incremental processed data
              through usp_load_fact_shipping_performance SP

Input       : None

Output      : Fact_Shipping_Performance

Project     : End-to-End E-Commerce Shipping Analytics
Platform    : Microsoft Fabric
==============================================================================*/

CREATE TABLE Fact_Shipping_Performance (
    Order_ID INT NOT NULL,
    Warehouse_Block VARCHAR(10) NOT NULL,
    Shipping_Mode VARCHAR(50),
    Customer_Care_Calls INT,
    Customer_Rating INT,
    Product_Cost DECIMAL(18,2),
    Prior_Purchases INT,
    Product_Importance VARCHAR(50),
    Gender VARCHAR(10),
    Discount_Offered DECIMAL(18,2),
    Weight_in_Grams INT,
    Delivery_Status VARCHAR(20) NOT NULL,
    Pricing_Category VARCHAR(50) NOT NULL,
    DW_Load_Timestamp DATETIME2(6)
);
