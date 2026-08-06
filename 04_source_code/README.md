# Source Code

This section contains the source code used to build the end-to-end Microsoft Fabric solution. The code is organized according to the implementation workflow, making it easy to follow the project from data ingestion through reporting.

| Folder | Purpose |
|---------|---------|
| **01_data_ingestion (Bronze)** | Contains the Spark SQL notebook used to ingest the source CSV file into the Bronze layer. The notebook performs schema inference, creates a temporary view, and materializes the Bronze Delta table. |
| **02_silver_sql** | Contains the T-SQL scripts used to standardize data types, validate the dataset, implement business logic, and prepare the Silver layer for downstream reporting. |
| **03_gold_sql** | Contains the T-SQL script used to create the final Gold reporting table structure before incremental loading through the MERGE stored procedure. |
| **04_stored_procedure** | Contains the stored procedure implementing incremental loading using the MERGE (UPSERT / SCD Type 1) pattern to efficiently maintain the Gold reporting table. |
| **05_row_level_security** | Contains the Row-Level Security (RLS) implementation used to filter data based on Microsoft Entra ID for report security testing. |
| **06_dax_measures** | Contains the DAX measures created for the Power BI Semantic Model to support KPI calculations and interactive reporting. |
| **07_pipeline** | Contains the Microsoft Fabric Data Pipeline used to orchestrate the end-to-end workflow from data ingestion. |

## Implementation Workflow

```
Source CSV
    │
    ▼
Data Ingestion (Bronze)
    │
    ▼
Silver Transformation
    │
    ▼
Silver Row Validation
    │
    ▼
Gold MERGE Stored Procedure
    │
    ▼
Gold Reporting Table
    │
    ▼
Semantic Model
    │
    ▼
Power BI Dashboard
```

Each folder contains only the scripts relevant to that stage of the solution, allowing the implementation to be reviewed independently while maintaining a clear engineering workflow.



