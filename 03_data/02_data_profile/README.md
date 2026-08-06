# Data Profile

The source dataset was profiled after ingestion into the Silver layer to verify its structure, completeness, and overall readiness for analytics.

## Dataset Summary

| Metric | Result |
|---------|--------|
| Total Records | 10,999 |
| Duplicate Order IDs | 0 |
| Missing Values | None |
| Dataset Structure | Single denormalized analytical dataset |
| Data Readiness | Suitable for analytics with minimal transformation |

---

## Schema Validation

The dataset contains a combination of integer, decimal, varchar, and datetime columns that support operational reporting and analytics.

Key observations include:

- Numeric values were stored using appropriate integer and decimal data types.
- Business attributes were stored using varchar columns with suitable lengths.
- Derived business attributes (**Delivery_Status** and **Pricing_Category**) were created during the Silver transformation process and do not contain null values.
- A **Silver_Load_Timestamp** column was added to support operational auditing.

---

## Data Quality Assessment

The profiling process confirmed that the dataset required minimal data cleansing.

| Validation | Result |
|------------|--------|
| Duplicate Order IDs | None |
| Missing Values | None |
| Invalid Data Types | None identified |
| Schema Consistency | Passed |

Because the source dataset was already well structured, the primary transformation effort focused on standardizing data types, implementing business logic, and preparing the data for reporting rather than correcting data quality issues.

---

## Numeric Profile

| Metric | Value |
|---------|------:|
| Minimum Product Cost | 96.00 |
| Maximum Product Cost | 310.00 |
| Average Product Cost | 210.20 |
| Minimum Discount | 1.00 |
| Maximum Discount | 65.00 |
| Average Discount | 13.37 |
| Minimum Weight (grams) | 1,001 |
| Maximum Weight (grams) | 7,846 |
| Average Weight (grams) | 3,634 |

---

## Category Distribution

Warehouse Block distribution showed that **Warehouse F** processed the largest number of shipments, while the remaining warehouse blocks maintained a relatively balanced workload.

Customer ratings were also well distributed across all five rating levels, indicating that the dataset represents a broad range of customer experiences without significant skew toward any single rating.

---

## Profiling Outcome

Overall, the profiling results confirmed that the dataset was complete, internally consistent, and well suited for implementing an end-to-end Microsoft Fabric analytics solution. Rather than spending significant effort on data cleansing, the project focused on engineering a reliable reporting pipeline using Medallion Architecture, business rule implementation, incremental loading, and Power BI reporting.

