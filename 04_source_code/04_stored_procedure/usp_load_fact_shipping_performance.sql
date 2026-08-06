/*==============================================================================
Script Name : usp_load_fact_shipping_performance.sql

Purpose     : Incrementally loads the Gold reporting table using the
              MERGE (UPSERT / SCD Type 1) pattern.

Input       : silver_shipping_data

Output      : Fact_Shipping_Performance

Project     : End-to-End E-Commerce Shipping Analytics
Platform    : Microsoft Fabric
==============================================================================*/

CREATE OR ALTER PROCEDURE usp_load_fact_shipping_performance
AS
BEGIN
    SET NOCOUNT ON;

    -- Incrementally synchronize the Gold reporting table using MERGE.
    MERGE dbo.Fact_Shipping_Performance AS Target

    USING (
        --Source query executing transformations on silver data

        SELECT
            Order_ID, Warehouse_Block, Shipping_Mode, Customer_Care_Calls,
    Customer_Rating, Product_Cost, Prior_Purchases, Product_Importance,
    Gender, Discount_Offered, Weight_in_Grams, Delivery_Status,
    Pricing_Category
        FROM silver_shipping_data
    ) AS Source
    ON (Target.Order_ID = Source.Order_ID)

    --Match Condition 1: If the record exists, update any operational fields that changed

    WHEN MATCHED THEN
        UPDATE SET
            Target.Warehouse_Block      = Source.Warehouse_Block,
            Target.Shipping_Mode        = Source.Shipping_Mode,
            Target.Customer_Care_Calls  = Source.Customer_Care_Calls,
            Target.Customer_Rating      = Source.Customer_Rating,
            Target.Product_Cost         = Source.Product_Cost,
            Target.Prior_Purchases      = Source.Prior_Purchases,
            Target.Product_Importance   = Source.Product_Importance,
            Target.Gender               = Source.Gender,
            Target.Discount_Offered     = Source.Discount_Offered,
            Target.Weight_in_Grams      = Source.Weight_in_Grams,
            Target.Delivery_Status      = Source.Delivery_Status,
            Target.Pricing_Category     = Source.Pricing_Category,
            Target.DW_Load_Timestamp    = GETDATE() --Update timestamp to show when it changed

    --Match Condition 2: If the record is brand new, insert it
    WHEN NOT MATCHED THEN
        INSERT (
            Order_ID, Warehouse_Block, Shipping_Mode, Customer_Care_Calls,  Customer_Rating,
            Product_Cost, Prior_Purchases, Product_Importance, Gender, Discount_Offered, 
            Weight_in_Grams, Delivery_Status, Pricing_Category, DW_Load_Timestamp
            )
        VALUES (
            Source.Order_ID, Source.Warehouse_Block, Source.Shipping_Mode, Source.Customer_Care_Calls,
            Source.Customer_Rating, Source.Product_Cost, Source.Prior_Purchases, Source.Product_Importance,
            Source.Gender, Source.Discount_Offered, Source.Weight_in_Grams, Source.Delivery_Status,
            Source.Pricing_Category, GETDATE()
            );
END;

/******************************************************************************
End of Procedure
******************************************************************************/