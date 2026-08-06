# Data Dictionary

The following data dictionary describes the columns used in the final **Fact_Shipping_Performance** table. This table serves as the reporting layer for the Power BI Semantic Model and Executive Fulfillment & Operations Dashboard.

| Column | Data Type | Business Description | Source | Example |
|---------|-----------|----------------------|--------|---------|
| Order_ID | INT | Unique identifier for each shipment record. | Source | 31415 |
| Warehouse_Block | VARCHAR | Warehouse location responsible for processing the shipment. | Source | B |
| Shipping_Mode | VARCHAR | Shipping method used to deliver the order. | Source | Flight |
| Customer_Care_Calls | INT | Number of customer service calls made regarding the shipment. | Source | 3 |
| Customer_Rating | INT | Customer satisfaction rating ranging from 1 to 5. | Source | 4 |
| Product_Cost | DECIMAL | Cost of the purchased product. | Source | 144.76 |
| Prior_Purchases | INT | Number of previous purchases made by the customer. | Source | 3 |
| Product_Importance | VARCHAR | Business classification indicating the importance of the product (Low, Medium, or High). | Source | High |
| Gender | VARCHAR | Customer gender. | Source | Male |
| Discount_Offered | DECIMAL | Discount applied to the order. | Source | 12.00 |
| Weight_in_gms | INT | Product weight in grams. | Source | 1738 |
| Delivery_Status | VARCHAR | Business-friendly delivery status derived from the original delivery indicator. | Derived | On Time |
| Pricing_Category | VARCHAR | Business-friendly pricing category derived from the discount offered. | Derived | Standard Pricing |
| DW_Load_Timestamp | DATETIME2 | Timestamp indicating when the record was loaded into the Gold reporting table. | System Generated | 2026-07-05 08:58:33 |
