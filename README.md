# 📊 Retail Sales & Inventory Analysis

## 📌 Project Overview

End-to-end retail sales and inventory analysis using Python, SQL, and Tableau to evaluate sales performance, profitability, supplier performance, and inventory risk.

This project focuses on transforming raw retail sales and inventory data into analytical outputs and interactive dashboards that support business decision-making across revenue performance, margin analysis, supplier contribution, and inventory risk management.

---

## 🎯 Business Objectives

The analysis answers key business questions such as:

* Which products, categories, stores, and suppliers drive the highest sales and gross profit?
* Which product groups have stronger or weaker gross margins?
* Which products are fast-moving, slow-moving, at risk of stockout, or at risk of overstock?
* How can inventory and replenishment decisions support better commercial performance?

---

## 🛠️ Tools & Technologies

* Python
* Pandas
* NumPy
* SQL
* MySQL
* Tableau
* Jupyter Notebook

---

## 📂 Repository Structure

```text
retail-sales-inventory-analysis
│
├── data
│   └── retail_analysis_dataset.csv
│
├── images
│   ├── business_performance.png
│   └── inventory_risk_analysis.png
│
├── notebooks
│   └── retail_&_inventory.ipynb
│
├── presentations
│   └── retail_sales_inventory_analysis_presentation.pdf
│
├── sql
│   └── retail_inventory_analysis.sql
│
├── tableau
│   └── retail_analysis_dashboard.twb
│
├── README.md
├── LICENSE
└── requirements.txt
```

---

## 📁 Data Files Note

The original raw sales and inventory datasets, along with the intermediate cleaned sales and cleaned inventory files, are not included in this repository because they exceed GitHub’s browser upload file-size limit.

This repository includes the final analysis-ready dataset:

`data/retail_analysis_dataset.csv`

The full data preparation process is documented in the Python notebook, which shows how the raw sales and inventory files were cleaned, transformed, joined, and exported for SQL analysis and Tableau dashboarding.

---

## 🔄 Project Workflow

### 1. Data Preparation (Python)

* Cleaned and standardized retail sales and inventory datasets
* Created calculated metrics and business KPIs
* Joined datasets into a final analysis-ready dataset
* Exported final dataset for SQL and Tableau analysis

### 2. SQL Analysis

Performed SQL analysis to evaluate:

* Revenue performance
* Gross profit and gross margin
* Product category performance
* Store performance
* Supplier contribution
* Inventory movement and inventory risk

### 3. Tableau Dashboarding

Built interactive Tableau dashboards to visualize:

* KPI summaries
* Product and category performance
* Supplier and store performance
* Inventory risk indicators
* Fast-moving and slow-moving products
* Stockout and overstock risk analysis

---

## 📊 Dashboard Preview

### Business Performance Dashboard

![Business Performance Dashboard](images/business_performance.png)

### Inventory Risk Analysis Dashboard

![Inventory Risk Analysis Dashboard](images/inventory_risk_analysis.png)

---

## 📈 Key KPIs

| Metric                    | Value          |
| ------------------------- | -------------- |
| Total Net Sales           | $10,482,110.25 |
| Total Gross Profit        | $4,634,359.15  |
| Gross Margin              | 44.21%         |
| Current Inventory at Cost | $1,096,577.97  |
| Total Quantity Sold       | 116,995        |
| Total Returns             | $733,571.01    |
| Total Transactions        | 131,120        |

---

## 💡 Key Business Insights

* Strong overall profitability with a gross margin of 44.21%
* Several product categories contribute significantly to total sales and gross profit
* Supplier concentration exists among top-performing vendors
* Slow-moving and overstock products create inventory carrying risk
* Stockout-risk products highlight replenishment opportunities
* Returns should be monitored to identify operational and product-quality issues

---

## ✅ Business Recommendations

* Prioritize replenishment for high-demand stockout-risk products
* Reduce exposure to overstock and slow-moving inventory
* Monitor supplier dependency and supplier performance trends
* Review low-margin products before scaling promotions
* Continue KPI monitoring to support inventory and sales optimization

---

## 📄 Presentation

Project presentation PDF:

`presentations/retail_sales_inventory_analysis_presentation.pdf`

---

## ⚙️ Installation & Requirements

Install project dependencies using:

```bash
pip install -r requirements.txt
```

---

## 🧠 Skills Demonstrated

* Data Cleaning & Transformation
* Exploratory Data Analysis (EDA)
* SQL Business Analysis
* KPI Development
* Tableau Dashboard Design
* Inventory Risk Analysis
* Business Insight Communication
* Data Visualization & Storytelling


## 📜 License

This project is licensed under the MIT License.

