# Project Summary

This project demonstrates the complete development of an end-to-end data engineering and analytics solution using Microsoft Fabric, beginning with raw data ingestion and ending with interactive business reporting in Power BI.

The solution follows a streamlined Medallion Architecture that transforms raw shipping data into reliable, business-ready information through the Bronze, Silver, and Gold layers. Rather than redesigning the source dataset into a traditional star schema, the project preserves its existing denormalized structure and builds a single Gold Fact table optimized for analytics and reporting.

The implementation includes data ingestion using Spark SQL, data transformation using T-SQL, incremental loading through a Stored Procedure and MERGE (UPSERT / SCD Type 1) pattern, pipeline orchestration, an explicit Power BI Semantic Model, reusable DAX measures, Row-Level Security (RLS), and an Executive Fulfillment & Operations Dashboard.

Throughout the project, the primary focus was not only on building a working solution, but also on following practical engineering practices that reflect how modern enterprise data solutions are designed, developed, and maintained.

Although the dataset is relatively simple, it provides an excellent opportunity to demonstrate the complete analytics workflow within Microsoft Fabric while establishing a solid foundation for more advanced projects involving larger datasets, multiple source systems, dimensional modeling, and more complex business scenarios.

