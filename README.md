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

### 3. Tableau Dashboard Design

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
This dashboard provides an overview of overall business performance, including key sales, profit, and inventory KPIs. It highlights revenue and gross profit trends, product and category performance, supplier contribution, and store-level performance to identify the primary drivers of business growth and profitability.

![Business Performance Dashboard](images/business_performance.png)

### Inventory Risk Analysis Dashboard
This dashboard focuses on inventory health and risk management. It identifies fast-moving and slow-moving products, stockout-risk items, and overstocked inventory to support replenishment planning, improve inventory turnover, and reduce carrying costs.

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
| Fast-Moving Products      | 13,997         |
| Slow-Moving Products      | 21,658         |
| Stockout-Risk Products    | 10,323         |
| Overstock-Risk Products   | 21,585         |


---

## 💡 Key Business Insights

* The business generated **$10.48M in net sales** and **$4.63M in gross profit**, resulting in a strong **44.21% gross margin**.
* Product and category performance analysis identified key revenue and profit contributors, highlighting opportunities to focus commercial efforts on high-performing segments.
* Returns totaled **$733.57K**, representing approximately **7% of net sales**, indicating an area for further investigation into product quality, customer behavior, and operational processes.
* Current inventory at cost stands at **$1.10M**, emphasizing the importance of balancing inventory availability with carrying costs.
* Inventory risk analysis revealed a mix of **stockout-risk products**, which may lead to lost sales opportunities, and **slow-moving or overstocked products**, which increase inventory holding costs and reduce working capital efficiency.
* Supplier performance analysis highlighted the need to monitor supplier contribution and dependency to support supply chain resilience and purchasing decisions.

---

## ✅ Business Recommendations

* Prioritize replenishment planning for high-demand products identified as stockout risks to minimize lost sales opportunities.
* Review slow-moving and overstocked inventory to reduce carrying costs and improve inventory turnover.
* Investigate products with high return values to identify potential quality, pricing, or fulfillment issues.
* Monitor supplier performance and concentration to reduce dependency risk and strengthen procurement strategies.
* Evaluate low-margin products before expanding promotional activity to protect overall profitability.
* Establish ongoing KPI monitoring for sales, profitability, returns, and inventory health to support data-driven decision-making.


---

## Presentation

[View the project presentation (PDF)](presentations/retail_sales_inventory_analysis_presentation.pdf)

---

## ⚙️ Installation & Requirements

Install project dependencies using:

```bash
pip install -r requirements.txt
```

---
## ▶️ How to Run This Project

1. Clone the repository:

   ```bash
   git clone https://github.com/aditya-pandey-data/retail-sales-inventory-analysis.git
   cd retail-sales-inventory-analysis
   ```

2. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Open and run the Jupyter Notebook:

   ```bash
   jupyter notebook notebooks/retail_&_inventory.ipynb
   ```

4. Run the SQL analysis script located in:

   ```text
   sql/retail_inventory_analysis.sql
   ```

5. Open the Tableau workbook located in:

   ```text
   tableau/retail_analysis_dashboard.twb
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

