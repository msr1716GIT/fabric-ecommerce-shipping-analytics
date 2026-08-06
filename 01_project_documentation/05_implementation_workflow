# Implementation Workflow

This project follows a streamlined Medallion Architecture implemented in Microsoft Fabric. The solution transforms raw shipping data into a reliable, business-ready Gold dataset that supports analytics and reporting while maintaining a simple and efficient engineering process.

## Bronze Layer

- Uploaded the source CSV file into OneLake Files.
- Used a Microsoft Fabric Notebook with Spark SQL to ingest the raw dataset.
- Preserved the original data by storing it as the **bronze_shipping_data** Delta table in the Lakehouse.

## Silver Layer

The Silver layer focuses on improving data quality and preparing the dataset for business reporting.

Key implementation steps include:

- Data type conversions using T-SQL.
- Column standardization and data validation.
- Added business-friendly attributes:
  - Delivery_Status
  - Pricing_Category
- Added **Silver_Load_Timestamp** for operational tracking and auditing.
- Stored the transformed data as **silver_shipping_data**.

## Gold Layer

The Gold layer prepares the final reporting dataset for analytics and business intelligence.

Key implementation steps include:

- Developed a Stored Procedure using a high-performance **MERGE** statement.
- Implemented incremental loading using the **SCD Type 1 (UPSERT)** pattern.
- Created the **Fact_Shipping_Performance** table as a single denormalized Gold Fact Table.
- Added **DW_Load_Timestamp** for data warehouse auditing.
- Implemented Row-Level Security (RLS) on the **Warehouse_Block** column to demonstrate role-based data access.

> **Note:** Microsoft Fabric currently does not support user impersonation within personal workspaces, so end-to-end validation of RLS across multiple users could not be fully demonstrated.

## Semantic Model

- Built an explicit Power BI Semantic Model using Direct Lake mode.
- Created reusable DAX measures for operational reporting and KPI calculations.

## Reporting

- Developed a one-page **Executive Fulfillment & Operations Dashboard** in Power BI.
- Included KPI cards, interactive slicers, and operational visualizations that support business analysis and decision-making.

## Pipeline Orchestration

Microsoft Fabric Data Pipelines orchestrate the complete workflow by automating the movement of data through the Bronze, Silver, Gold layers.
