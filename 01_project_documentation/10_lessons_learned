# Lessons Learned

This project reinforced several practical engineering principles that are commonly encountered when building real-world analytics solutions.

## Keep the Solution as Simple as the Data

Not every dataset requires a star schema. Since the source data was already organized as a single denormalized analytical dataset, preserving that structure resulted in a simpler solution without sacrificing reporting capabilities.

## Choose the Right Tool for the Right Task

Spark SQL worked well for ingesting the raw CSV file into the Bronze layer, while T-SQL provided a clean and organized approach for implementing business rules, incremental loading, and data transformations within the Warehouse.

## Design for Future Growth

Although the project uses a single source file, the ingestion and loading process was designed with future expansion in mind. Using incremental loading and pipeline orchestration provides a foundation that can support additional data as the solution grows.

## Business Rules Add Value

Small business-friendly enhancements, such as creating **Delivery_Status** and **Pricing_Category**, make reports easier to understand and reduce the need for repetitive calculations in the reporting layer.

## Build for Reliability

Implementing incremental loading with a Stored Procedure and MERGE statement helps keep the reporting table continuously available while reducing unnecessary processing. This approach reflects how enterprise data warehouse solutions are commonly maintained.

## Security Should Be Considered Early

Even in a personal development environment, implementing Row-Level Security provided valuable experience with role-based data access and highlighted the importance of designing security alongside the data model rather than as an afterthought.

