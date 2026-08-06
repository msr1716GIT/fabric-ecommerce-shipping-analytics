# Project Overview

This project demonstrates an end-to-end data engineering and analytics solution built in Microsoft Fabric using the E-Commerce Shipping dataset from Kaggle. The project follows the Medallion Architecture to transform raw shipping data into reliable, business-ready information for reporting, analysis, and decision-making.

The dataset focuses on a single business process—shipping and delivery performance—and is already structured as an analytical dataset. Rather than redesigning the data model into multiple dimension and fact tables, the solution uses a single denormalized Gold table to preserve simplicity, improve query performance, and support efficient analytics through Direct Lake.

The implementation begins by ingesting the source CSV file into the Bronze layer, where the raw data is preserved. The data is then standardized, validated, and transformed through the Silver and Gold layers using business rules that improve data quality and prepare the dataset for analytics. An explicit Power BI Semantic Model is built on top of the Gold table, followed by an interactive Power BI dashboard that presents key operational metrics and business insights.

The project workflow provides practical experience building an end-to-end analytics solution using Microsoft Fabric, including OneLake, Lakehouse, Data Warehouse, Spark SQL, T-SQL, Data Pipelines, Semantic Models, DAX, and Power BI.

---

## Quick Specifications

| Item | Description |
|------|-------------|
| **Domain** | E-Commerce Logistics & Shipping Performance |
| **Dataset** | E-Commerce Shipping Data (Kaggle) |
| **Architecture** | Medallion Architecture (Bronze → Silver → Gold) |
| **Data Model** | Single-Table Denormalized Gold Data Mart |
| **Storage** | OneLake Lakehouse (Delta Tables) |
| **Transformation** | Spark SQL (Bronze Ingestion), T-SQL (Silver & Gold) |
| **Pipeline Orchestration** | Microsoft Fabric Data Pipelines |
| **Semantic Layer** | Power BI Semantic Model (Direct Lake) |
| **Visualization** | Power BI Executive Fulfillment & Operations Dashboard |
