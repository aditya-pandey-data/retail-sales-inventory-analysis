# Retail Sales & Inventory Analysis

A Data & Business Analyst portfolio project analyzing retail sales, profitability, supplier performance, store performance, and inventory risk. The project uses Python for data preparation, SQL for business analysis and validation, and Tableau for executive dashboarding.

## Project Summary

Retail businesses need to understand not only which products generate revenue, but also which products create margin pressure, stockout risk, and overstock exposure. This project connects sales performance with inventory position to identify where the business can protect revenue, improve margin, and control working capital.

The analysis answers questions such as:

- Which categories, products, stores, and suppliers drive sales and gross profit?
- Which product groups have stronger or weaker gross margins?
- Which products are fast-moving, slow-moving, at risk of stockout, or at risk of overstock?
- How can inventory and replenishment decisions support better commercial performance?

## Dashboard Preview

### Business Performance Dashboard

![Business Performance Dashboard](images/business%20Performance.png)

### Inventory Risk Analysis Dashboard

![Inventory Risk Analysis Dashboard](images/inventory%20Risk%20Analysis.png)

## Key KPIs

| Metric | Value |
|---|---:|
| Total Net Sales | $10,482,110.25 |
| Total Gross Profit | $4,634,359.15 |
| Gross Margin | 44.21% |
| Current Inventory at Cost | $1,096,577.97 |
| Total Quantity Sold | 116,995 |
| Total Returns | $733,571.01 |
| Total Transactions | 131,120 |
| Final Analysis Rows | 50,447 |
| Fast-Moving Products | 13,997 |
| Slow-Moving Products | 21,658 |
| Stockout Risk Products | 10,323 |
| Overstock Risk Products | 21,585 |

## Tools Used

- **Python**: data cleaning, transformation, feature creation, and final dataset export
- **Pandas / NumPy**: data preparation and calculation workflow
- **SQL**: KPI validation, business analysis, supplier/store/category/product analysis
- **Tableau**: dashboard development and visual business reporting
- **CSV**: raw, cleaned, and final analytical datasets

## Repository Structure

```text
retail-sales-inventory-analysis/
│
├── data/
│   ├── raw_retail_sales_ml_apl.csv
│   ├── raw_retail_inventory_ml_apl.csv
│   ├── cleaned_sales.csv
│   ├── cleaned_inventory.csv
│   └── retail_analysis_dataset.csv
│
├── images/
│   ├── business Performance.png
│   └── inventory Risk Analysis.png
│
├── notebooks/
│   └── retail_&_inventory.ipynb
│
├── presentations/
│   └── retail_sales_inventory_analysis_presentation.pdf
│
├── sql/
│   └── retail_inventory_analysis.sql
│
├── tableau/
│   └── retail_analysis_dashboard.twb
│
├── LICENSE
├── README.md
└── requirements.txt
```

## Project Workflow

1. **Raw data preparation**
   - Loaded retail sales and inventory CSV files.
   - Reviewed structure, missing values, duplicate records, and column consistency.

2. **Python cleaning and transformation**
   - Standardized column names.
   - Cleaned sales and inventory datasets.
   - Joined sales and inventory data into a final analytical dataset.
   - Created calculated fields for sales, profit, margin, quantity, inventory value, and inventory risk flags.

3. **SQL analysis and validation**
   - Validated executive KPIs.
   - Analyzed category, product, store, and supplier performance.
   - Identified low-profitability products and inventory risk groups.
   - Structured outputs for Tableau dashboard planning.

4. **Tableau dashboarding**
   - Built two dashboard views:
     - **Business Performance Dashboard**: executive KPIs, category performance, product performance, store performance, and supplier performance.
     - **Inventory Risk Analysis Dashboard**: inventory value, product movement, stockout risk, overstock risk, and inventory risk summary.

5. **Business insight communication**
   - Summarized results into a professional presentation PDF.
   - Translated analysis outputs into business actions for revenue protection, margin improvement, replenishment, and inventory control.

## Data Preparation

The Python notebook creates three main dataset stages:

| Dataset | Description |
|---|---|
| `raw_retail_sales_ml_apl.csv` | Original retail sales input data |
| `raw_retail_inventory_ml_apl.csv` | Original inventory input data |
| `cleaned_sales.csv` | Cleaned sales dataset |
| `cleaned_inventory.csv` | Cleaned inventory dataset |
| `retail_analysis_dataset.csv` | Final joined analytical dataset used for SQL and Tableau |

The final dataset includes sales, profit, margin, product hierarchy, supplier, store, inventory value, and inventory risk fields.

## SQL Analysis Areas

The SQL script supports the following business analysis areas:

- Executive KPI validation
- Product category performance
- Product-level sales and profitability
- Low-profitability product identification
- Store performance analysis
- Supplier contribution analysis
- Inventory value analysis
- Fast-moving and slow-moving product analysis
- Stockout risk and overstock risk analysis
- Tableau dashboard planning

## Tableau Dashboards

### 1. Business Performance Dashboard

This dashboard provides an executive view of retail performance across sales, profit, margin, product categories, stores, and suppliers.

Main components:

- Current inventory value
- Gross margin percentage
- Total gross profit
- Total net sales
- Total quantity sold
- Total returns
- Total transactions
- Net sales by product category
- Gross profit by product category
- Gross margin percentage by product category
- Top 20 products by net sales
- Top 20 products by gross profit
- Low profitability products
- Store performance
- Supplier performance

### 2. Inventory Risk Analysis Dashboard

This dashboard focuses on inventory efficiency, product movement, and risk exposure.

Main components:

- Fast-moving products
- Slow-moving products
- Stockout risk products
- Overstock risk products
- Inventory value by product category
- Fast-moving product view
- Slow-moving product view
- Stockout risk treemap
- Overstock risk treemap

## Business Insights

- The business generated **$10.48M in net sales** and **$4.63M in gross profit**, with a **44.21% gross margin**.
- Current inventory at cost is **$1.10M**, showing a meaningful working-capital position that needs active inventory control.
- **Vendor 0166** and **Vendor 0134** are the largest net sales contributors, generating approximately **$3.29M** and **$3.20M** in net sales respectively.
- The analysis identified **21,658 slow-moving products** and **21,585 overstock-risk products**, highlighting opportunities for markdown, transfer, or purchasing control actions.
- The analysis identified **10,323 stockout-risk products**, which should be monitored for replenishment to reduce lost sales risk.
- Product and supplier performance should be reviewed together because high sales contribution does not always guarantee balanced margin and inventory efficiency.

## Recommended Business Actions

- Protect inventory availability for high-revenue categories, top stores, and fast-moving products.
- Prioritize replenishment for stockout-risk products with strong sales velocity.
- Review slow-moving and overstock-risk products for markdowns, transfers, or purchasing restrictions.
- Investigate low-margin products before scaling promotions or reordering.
- Use supplier rankings to support vendor negotiations and availability planning.
- Refresh dashboards regularly so sales, inventory, and supplier decisions remain aligned with current business performance.

## How to Use This Repository

1. Open the notebook in `notebooks/retail_&_inventory.ipynb` to review the data cleaning and transformation workflow.
2. Review `sql/retail_inventory_analysis.sql` for SQL-based KPI validation and business analysis queries.
3. Open `tableau/retail_analysis_dashboard.twb` in Tableau to explore the dashboard workbook.
4. View dashboard screenshots in the `images/` folder.
5. Open the project presentation in `presentations/retail_sales_inventory_analysis_presentation.pdf`.

## Requirements

Install the Python dependencies with:

```bash
pip install -r requirements.txt
```

Main Python libraries used:

- pandas
- numpy
- jupyter

## Portfolio Value

This project demonstrates a complete Data & Business Analyst workflow: raw data preparation, data cleaning, KPI development, SQL analysis, Tableau dashboarding, business insight generation, and executive-style presentation of recommendations.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
