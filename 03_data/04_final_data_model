# Final Data Model

The final reporting layer consists of a single denormalized Gold Fact table named **Fact_Shipping_Performance**.

Unlike a traditional dimensional model that separates facts and dimensions into multiple tables, this project preserves the existing denormalized structure of the source dataset. After evaluating the data during the Bronze and Silver stages, it was determined that all business attributes required for reporting already existed within a single dataset. Creating additional dimension tables would have introduced unnecessary complexity without improving reporting capabilities.

The resulting Gold Fact table provides a simple, efficient, and business-ready data model optimized for Direct Lake reporting in Microsoft Fabric.

---

## Final Reporting Table

| Table | Purpose |
|--------|---------|
| **Fact_Shipping_Performance** | Final business-ready reporting table used by the Semantic Model and Power BI dashboard. |

---

## Data Model Characteristics

- Single denormalized Gold Fact table
- Optimized for Direct Lake reporting
- Supports interactive Power BI dashboards
- Includes business-friendly derived attributes
- Supports incremental loading using MERGE (UPSERT / SCD Type 1)
- Includes Row-Level Security (RLS)
- Maintains load audit information through **DW_Load_Timestamp**

---

## Business Attributes

The following business-friendly attributes were introduced during the engineering process to improve reporting and simplify downstream analytics.

| Column | Purpose |
|--------|---------|
| **Delivery_Status** | Converts the original delivery indicator into business-friendly values (**On-Time** and **Delayed**). |
| **Pricing_Category** | Classifies orders into **Standard Pricing** and **Aggressive Discount** based on the discount offered. |
| **DW_Load_Timestamp** | Records when each row was loaded into the Gold reporting table for operational auditing. |

---

## Reporting Layer

The **Fact_Shipping_Performance** table serves as the single source for the Power BI Semantic Model operating in **Direct Lake** mode.

The Semantic Model provides reusable DAX measures and acts as the foundation for the Executive Fulfillment & Operations Dashboard.

---

## Final Outcome

The final data model demonstrates that effective analytics solutions do not always require complex dimensional modeling. By preserving the existing denormalized structure and applying appropriate engineering practices, the project delivers a clean, maintainable, and high-performance reporting solution while remaining aligned with the characteristics of the source data.

