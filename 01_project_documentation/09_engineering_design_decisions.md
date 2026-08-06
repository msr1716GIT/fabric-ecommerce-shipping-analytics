# Design Decisions

This project was designed with a practical engineering approach rather than implementing additional components simply to demonstrate features. Each design decision was made based on the structure of the dataset, the project requirements, and common enterprise development practices.

## Why a Single Denormalized Gold Fact Table?

The source dataset is already organized as a single denormalized analytical dataset containing all the information required for reporting and analysis. After loading the data into the Bronze layer and reviewing its structure, it became clear that creating separate dimension tables would add unnecessary complexity without providing additional business value.

Instead, the existing structure was preserved and transformed into a single denormalized Gold Fact table optimized for analytics and reporting.

---

## Why Spark SQL Only for Data Ingestion?

Although this project contains a single CSV file, the ingestion process was designed with real-world scenarios in mind. Source files often change over time, and Spark SQL provides a flexible way to ingest raw files while automatically inferring appropriate data types during ingestion.

During implementation, it was also found that directly creating the destination table from the CSV using `CREATE OR REPLACE TABLE` was not a reliable approach for this dataset. Instead, a temporary view was created first, and the final Bronze table was generated from that view. This approach proved to be more stable and easier to maintain.

---

## Why T-SQL for Data Transformations?

All business transformations were implemented using T-SQL in the Microsoft Fabric Data Warehouse.

Although the same transformations could have been developed using Spark SQL notebooks, T-SQL is my primary development language and provides a structured way to organize transformation logic, stored procedures, and business rules. It also aligns well with traditional enterprise data warehouse development practices and makes ongoing maintenance easier.

---

## Why MERGE Instead of TRUNCATE and INSERT?

For a static CSV file, a simple TRUNCATE and INSERT process would have been sufficient.

However, this project was designed with an enterprise mindset where new data is expected to arrive continuously. Using a MERGE statement allows the Gold table to remain available while processing new data.

This approach provides two important benefits:

- The Gold table is never emptied during processing, ensuring that downstream reports always have access to valid data.
- Only new records are inserted and existing records are updated, reducing unnecessary processing while supporting incremental loading through an UPSERT (SCD Type 1) pattern.

---

## Why Direct Lake?

The Gold table resides in OneLake and is accessed through Microsoft Fabric's native storage architecture.

Using Direct Lake allows Power BI to query the data directly without requiring traditional data import or DirectQuery, providing high-performance analytics while keeping the reporting solution simple.

---

## Why an Explicit Semantic Model?

Although the project uses a single reporting table, an explicit Semantic Model was created to support reusable DAX measures, centralized business calculations, and consistent reporting.

This also follows the standard Microsoft Fabric reporting workflow by separating the reporting layer from the underlying data model.

---

## Why Implement Row-Level Security (RLS)?

Row-Level Security (RLS) was implemented on the `Warehouse_Block` column to demonstrate role-based data access.

While Microsoft Fabric currently does not support full user impersonation within personal workspaces, testing confirmed that RLS correctly filtered data based on the authenticated Microsoft Entra ID returned by the `CURRENT_USER()` function.

This implementation demonstrates how role-based security can be incorporated into a Fabric reporting solution, even within the limitations of a personal development environment.
