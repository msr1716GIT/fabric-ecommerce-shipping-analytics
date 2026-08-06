# Data Transformation

This project follows a streamlined Medallion Architecture to progressively transform raw shipping data into business-ready information for analytics and reporting.

## Bronze Layer

The source CSV file was uploaded into OneLake Files and ingested into the Lakehouse using a Microsoft Fabric Notebook with Spark SQL.

The Bronze layer preserves the raw source data without applying business transformations. Its primary purpose is to maintain an original copy of the dataset for traceability and future reprocessing if needed.

### Activities

- CSV file ingestion
- Schema inference
- Temporary View creation
- Bronze Delta table creation

---

## Silver Layer

The Silver layer focuses on preparing the data for analytics by validating data types, standardizing the schema, and implementing business-friendly attributes.

### Activities

- Explicit data type conversion
- Column standardization
- Data validation
- Business logic implementation
- Added **Delivery_Status**
- Added **Pricing_Category**
- Added **Silver_Load_Timestamp**

---

## Gold Layer

The Gold layer produces the final reporting table used by the Semantic Model and Power BI dashboard.

Instead of redesigning the data into multiple dimension tables, the project preserves the existing denormalized structure by creating a single Gold Fact table optimized for analytics.

### Activities

- Stored Procedure implementation
- Incremental loading using MERGE (UPSERT / SCD Type 1)
- Added **DW_Load_Timestamp**
- Row-Level Security (RLS) implementation
- Final reporting table creation

---

## Transformation Summary

| Layer | Primary Purpose |
|---------|----------------|
| Bronze | Preserve raw source data |
| Silver | Validate, standardize, and enrich the data |
| Gold | Create the final business-ready reporting table |

The transformation process emphasizes reliability, maintainability, and practical engineering practices while keeping the solution simple and aligned with the characteristics of the source dataset.
