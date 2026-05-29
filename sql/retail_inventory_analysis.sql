-- ============================================================
-- RETAIL SALES AND INVENTORY ANALYSIS
-- ============================================================


-- ============================================================
-- 1. Project Objective
-- ============================================================
-- The objective of this project is to analyse retail sales and
-- inventory performance using SQL.
--
-- The analysis focuses on understanding revenue, profitability,
-- product performance, store performance, supplier contribution,
-- inventory value, fast-moving products, slow-moving products,
-- stockout risk, and overstock risk.
--
-- The final SQL outputs will be used to support Tableau dashboard
-- visualisations and business recommendations.
-- ============================================================

-- ============================================================
-- 2. Business Questions
-- ============================================================
-- 1. What is the overall sales, profit, returns, sales volume,
--    transaction, and inventory value performance of the business?
--
-- 2. Which product categories generate the highest net sales and
--    gross profit?
--
-- 3. Which product categories generate strong sales but have weaker
--    gross margin performance?
--
-- 4. Which products are the top performers by net sales?
--
-- 5. Which products are the top performers by gross profit?
--
-- 6. Which products show weak profitability and may require pricing,
--    cost, or promotion review?
--
-- 7. Which stores contribute the most to net sales, gross profit,
--    units sold, and transactions?
--
-- 8. Which suppliers contribute the most to net sales, gross profit,
--    product count, and inventory value?
--
-- 9. Which product categories hold the highest inventory value?
--
-- 10. Which fast-moving products should be prioritised for stock
--     availability?
--
-- 11. Which slow-moving products may be tying up inventory capital?
--
-- 12. Which products are at risk of stockout and may need
--     replenishment focus?
--
-- 13. Which products are overstocked and may require inventory
--     reduction action?
--
-- 14. What inventory risks should the business focus on first based
--     on fast-moving, slow-moving, stockout-risk, and overstock-risk
--     product counts?
-- ============================================================

-- ============================================================
-- 3. SQL Analysis
-- ============================================================
-- The following SQL queries answer the business questions listed above.
-- Each query focuses on a specific business area and prepares results
-- that can be used for Tableau visualisation and final recommendations.
-- ============================================================

-- ============================================================
-- 3.1 Data Preview and Record Count
-- ============================================================
-- Purpose:
-- Preview the analysis table and confirm the total number of
-- records before starting business analysis.
-- ============================================================

SELECT *
FROM Retail.retail_analysis_dataset
LIMIT 10;

-- Check total records in the analysis table.

SELECT
    COUNT(*) AS total_records
FROM Retail.retail_analysis_dataset;

-- ============================================================
-- 3.2 Business KPI Overview
-- ============================================================
-- Business Question:
-- What is the overall sales, profit, returns, and inventory value
-- performance of the business?
--
-- Purpose:
-- Summarise the main business KPIs for sales, returns, cost,
-- profit, quantity sold, transactions, and inventory value.
-- ============================================================

SELECT
    ROUND(SUM(total_gross_sales), 2) AS total_gross_sales,
    ROUND(SUM(total_returns), 2) AS total_returns,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_cogs), 2) AS total_cogs,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost,
    ROUND(SUM(current_inventory_value_at_retail), 2) AS inventory_value_at_retail,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset;

-- ============================================================
-- 3.3 Product Category Sales and Profit Performance
-- ============================================================
-- Business Question:
-- Which product categories generate the highest revenue and profit?
--
-- Purpose:
-- Analyse sales, profit, quantity sold, transactions, and margin
-- by product category.
-- ============================================================

SELECT
    product_category,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset
GROUP BY product_category
ORDER BY total_net_sales DESC;

-- ============================================================
-- 3.4 High Sales but Low Margin Categories
-- ============================================================
-- Business Question:
-- Which product categories have strong sales but weak profit margins?
--
-- Purpose:
-- Identify categories that generate revenue but have lower
-- profitability, which may need pricing, cost, or promotion review.
-- ============================================================

SELECT
    product_category,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions
FROM Retail.retail_analysis_dataset
GROUP BY product_category
HAVING total_net_sales > 0
ORDER BY total_net_sales DESC, gross_margin_percentage ASC;

-- ============================================================
-- 3.5 Top 20 Products by Net Sales
-- ============================================================
-- Business Question:
-- Which products generate the highest net sales?
--
-- Purpose:
-- Identify the top 20 products generating the highest revenue.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory
ORDER BY total_net_sales DESC
LIMIT 20;

-- ============================================================
-- 3.6 Top 20 Products by Gross Profit
-- ============================================================
-- Business Question:
-- Which products generate the highest gross profit?
--
-- Purpose:
-- Identify the top 20 products contributing the most profit.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory
ORDER BY total_gross_profit DESC
LIMIT 20;

-- ============================================================
-- 3.7 Products with Low Profitability
-- ============================================================
-- Business Question:
-- Which products have weak profitability?
--
-- Purpose:
-- Identify products with positive sales but low gross margin.
-- These products may require pricing, cost, or promotion review.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions
FROM Retail.retail_analysis_dataset
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory
HAVING total_net_sales > 0
ORDER BY gross_margin_percentage ASC, total_net_sales DESC
LIMIT 20;

-- ============================================================
-- 3.8 Store Performance Analysis
-- ============================================================
-- Business Question:
-- Which stores contribute the most to sales, profit, and transactions?
--
-- Purpose:
-- Compare store-level performance using revenue, profit, units sold,
-- transaction count, and gross margin.
-- ============================================================

SELECT
    store,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset
GROUP BY store
ORDER BY total_net_sales DESC;

-- ============================================================
-- 3.9 Supplier Performance Analysis
-- ============================================================
-- Business Question:
-- Which suppliers contribute the most to sales, profit, and inventory value?
--
-- Purpose:
-- Analyze supplier-level performance using net sales, gross profit,
-- units sold, transactions, inventory value, and gross margin.
-- ============================================================

SELECT
    supplier,
    COUNT(DISTINCT product_no) AS total_products,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost,
    ROUND(SUM(current_inventory_value_at_retail), 2) AS inventory_value_at_retail,
    ROUND(SUM(total_gross_profit) / SUM(total_net_sales) * 100, 2) AS gross_margin_percentage
FROM Retail.retail_analysis_dataset
GROUP BY supplier
ORDER BY total_net_sales DESC;

-- ============================================================
-- 3.10 Inventory Value by Product Category
-- ============================================================
-- Business Question:
-- Which product categories hold the highest inventory value?
--
-- Purpose:
-- Analyse inventory value by product category to identify where
-- the highest amount of stock value is currently held.
-- ============================================================

SELECT
    product_category,
    COUNT(DISTINCT product_no) AS total_products,
    ROUND(SUM(current_qty_on_hand), 0) AS total_qty_on_hand,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost,
    ROUND(SUM(current_inventory_value_at_retail), 2) AS inventory_value_at_retail,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit
FROM Retail.retail_analysis_dataset
GROUP BY product_category
ORDER BY inventory_value_at_cost DESC;

-- ============================================================
-- 3.11 Fast-Moving Products
-- ============================================================
-- Business Question:
-- Which products are fast-moving and should be prioritised for
-- stock availability?
--
-- Purpose:
-- Identify products marked as fast-moving based on sales movement,
-- quantity sold, transactions, and current stock position.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_qty_on_hand), 0) AS current_qty_on_hand,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost
FROM Retail.retail_analysis_dataset
WHERE fast_moving_flag = 1
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier
ORDER BY total_units_sold DESC, total_net_sales DESC
LIMIT 20;

-- ============================================================
-- 3.12 Slow-Moving Products
-- ============================================================
-- Business Question:
-- Which products are slow-moving and may be tying up inventory capital?
--
-- Purpose:
-- Identify products marked as slow-moving based on low sales
-- movement and current stock position.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_qty_on_hand), 0) AS current_qty_on_hand,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost
FROM Retail.retail_analysis_dataset
WHERE slow_moving_flag = 1
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier
ORDER BY inventory_value_at_cost DESC, current_qty_on_hand DESC
LIMIT 20;

-- ============================================================
-- 3.13 Stockout Risk Products
-- ============================================================
-- Business Question:
-- Which products are at risk of stockout?
--
-- Purpose:
-- Identify products marked with stockout risk based on product
-- movement and current inventory position.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_qty_on_hand), 0) AS current_qty_on_hand,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost
FROM Retail.retail_analysis_dataset
WHERE stockout_risk_flag = 1
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier
ORDER BY total_units_sold DESC, total_net_sales DESC
LIMIT 20;

-- ============================================================
-- 3.14 Overstock Risk Products
-- ============================================================
-- Business Question:
-- Which products are overstocked?
--
-- Purpose:
-- Identify products marked with overstock risk based on stock
-- position, inventory value, and sales movement.
-- ============================================================

SELECT
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier,
    ROUND(SUM(total_net_sales), 2) AS total_net_sales,
    ROUND(SUM(total_gross_profit), 2) AS total_gross_profit,
    ROUND(SUM(total_qty_sold), 0) AS total_units_sold,
    SUM(total_transactions) AS total_transactions,
    ROUND(SUM(current_qty_on_hand), 0) AS current_qty_on_hand,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS inventory_value_at_cost
FROM Retail.retail_analysis_dataset
WHERE overstock_risk_flag = 1
GROUP BY
    product_no,
    product_description,
    product_category,
    product_subcategory,
    supplier
ORDER BY inventory_value_at_cost DESC, current_qty_on_hand DESC
LIMIT 20;

-- ============================================================
-- 3.15 Inventory Risk Summary
-- ============================================================
-- Business Question:
-- What inventory risks should the business focus on first?
--
-- Purpose:
-- Summarise stock movement and inventory risk flags to understand
-- how many products fall into fast-moving, slow-moving, stockout
-- risk, and overstock risk groups.
-- ============================================================

SELECT
    COUNT(DISTINCT product_no) AS total_products,
    COUNT(DISTINCT CASE WHEN fast_moving_flag = 1 THEN product_no END) AS fast_moving_products,
    COUNT(DISTINCT CASE WHEN slow_moving_flag = 1 THEN product_no END) AS slow_moving_products,
    COUNT(DISTINCT CASE WHEN stockout_risk_flag = 1 THEN product_no END) AS stockout_risk_products,
    COUNT(DISTINCT CASE WHEN overstock_risk_flag = 1 THEN product_no END) AS overstock_risk_products,
    ROUND(SUM(current_inventory_value_at_cost), 2) AS total_inventory_value_at_cost,
    ROUND(SUM(CASE WHEN stockout_risk_flag = 1 THEN current_inventory_value_at_cost ELSE 0 END), 2) AS stockout_risk_inventory_value,
    ROUND(SUM(CASE WHEN overstock_risk_flag = 1 THEN current_inventory_value_at_cost ELSE 0 END), 2) AS overstock_risk_inventory_value
FROM Retail.retail_analysis_dataset;

-- ============================================================
-- 4. Key Insights
-- ============================================================

-- 1. Overall Performance
-- The business generated total net sales of 10,482,110.25 and
-- total gross profit of 4,634,359.15.
-- Total gross sales were 11,215,681.26, while returns were
-- 733,571.01.
-- The overall gross margin was 44.21%.

-- 2. Sales Volume and Transactions
-- The dataset recorded 116,995 units sold across 131,120
-- transactions.
-- This shows strong transaction activity across the retail stores.

-- 3. Inventory Value
-- Current inventory value at cost was 1,096,577.97, while inventory
-- value at retail was 2,191,202.12.
-- This shows that a large amount of capital is currently held in
-- inventory.

-- 4. Category Performance
-- Scholar Footwear Retro Legend generated the highest net sales
-- at 1,920,958.56.
-- Scholar Footwear Trailblazer generated 1,909,759.99 in net sales
-- and had the highest gross profit among categories at 927,715.37.

-- 5. High Sales but Lower Margin Category
-- Femme Footwear Trailblazer generated strong net sales of
-- 1,238,790.65, but its gross margin was 35.25%.
-- This margin was lower than the overall business gross margin
-- of 44.21%.

-- 6. Top Product by Net Sales and Profit
-- PROD-140871 was the top product by net sales with 104,027.50.
-- It also generated the highest gross profit among the top products
-- with 57,439.66 and had a gross margin of 55.22%.

-- 7. Product Profitability Issue
-- Some products had negative gross margin.
-- PROD-159909 had the weakest profitability, with net sales of
-- 324.90, gross profit of -275.10, and gross margin of -84.67%.
-- Several low-profit products were from Junior Apparel categories.

-- 8. Store Performance
-- STR-1006 was the top-performing store with 485,561.44 in net sales,
-- 225,775.14 in gross profit, 5,619 units sold, and 6,165 transactions.
-- This store contributed the highest sales and profit among all stores.

-- 9. Supplier Performance
-- Vendor 0166 generated the highest net sales at 3,290,375.40 and
-- supplied 716 products.
-- Vendor 0134 generated the highest gross profit at 1,412,364.67.
-- Vendor 0246 had the strongest gross margin among the top suppliers
-- at 54.98%.

-- 10. Inventory Value by Category
-- Scholar Footwear Modern Legend held the highest inventory value
-- at cost, with 175,542.66.
-- Scholar Footwear Trailblazer followed closely with inventory value
-- at cost of 172,097.13.

-- 11. Fast-Moving Products
-- 1,885 products were marked as fast-moving.
-- The top fast-moving product was PROD-100805, with 1,170 units sold,
-- 102,481.99 in net sales, and 49,202.94 in gross profit.

-- 12. Slow-Moving Products
-- 2,265 products were marked as slow-moving.
-- The highest inventory value among slow-moving products was held by
-- PROD-118967, with inventory value at cost of 3,546.18 and only
-- 8 units sold.

-- 13. Stockout Risk
-- 1,750 products were marked as stockout risk products.
-- PROD-100439 had 457 units sold and 0 current quantity on hand,
-- making it one of the key stockout-risk products.

-- 14. Overstock Risk
-- 2,265 products were marked as overstock risk products.
-- Overstock-risk inventory value at cost was 498,893.93, which shows
-- that a significant portion of inventory value is tied to products
-- with overstock risk.

-- 15. Inventory Risk Summary
-- Out of 2,326 total products, 1,885 were fast-moving, 2,265 were
-- slow-moving, 1,750 were at stockout risk, and 2,265 were at
-- overstock risk.
-- This shows that inventory risk is a major area of focus in this
-- retail dataset.

-- ============================================================
-- 5. Tableau Dashboard Plan
-- ============================================================
-- The SQL analysis outputs will be used to support two Tableau
-- dashboards for retail sales, profitability, and inventory risk
-- analysis.
-- The Tableau dashboards are designed for a Data & Business Analyst
-- portfolio project. They summarise the key business findings from
-- SQL and Python analysis using KPI cards, bar charts, treemaps, and
-- inventory risk views.

-- Dashboard 1: Business Performance Dashboard

-- Purpose:
-- Provide an executive-level overview of retail performance across
-- sales, profit, product categories, stores, and suppliers.

## -- Dashboard Components:

-- 1. KPI Overview
-- - Current Inventory Value
-- - Gross Margin Percentage
-- - Total Gross Profit
-- - Total Net Sales
-- - Total Quantity Sold
-- - Total Returns
-- - Total Transactions

-- 2. Product Category Performance
-- - Net Sales by Product Category
-- - Gross Profit by Product Category
-- - Gross Margin Percentage by Product Category

-- 3. Product Performance
-- - Top 20 Products by Net Sales
-- - Top 20 Products by Gross Profit
-- - Low Profitability Products

-- 4. Store and Supplier Performance
-- - Store Performance by Net Sales and Gross Profit
-- - Supplier Performance by Net Sales and Gross Profit


-- Dashboard 2: Inventory Risk Analysis Dashboard

-- Purpose:
-- Identify inventory efficiency issues, stockout risks, overstock
-- risks, and product movement patterns to support better inventory
-- and purchasing decisions.

## -- Dashboard Components:

-- 1. Inventory Risk Summary
-- - Fast-Moving Products
-- - Slow-Moving Products
-- - Stockout Risk Products
-- - Overstock Risk Products

-- 2. Inventory Value Analysis

-- - Inventory Value by Product Category

-- 3. Product Movement Analysis
-- - Fast-Moving Products
-- - Slow-Moving Products

-- 4. Inventory Risk Analysis
-- - Stockout Risk Products
-- - Overstock Risk Products

-- ============================================================
-- 6. Final Recommendations
-- ============================================================

-- 1. Prioritise replenishment for stockout-risk products with strong
--    sales movement to reduce lost revenue opportunities.

-- 2. Review overstock-risk products and slow-moving inventory to reduce
--    excess stock holding and improve inventory efficiency.

-- 3. Focus sales and merchandising efforts on high-performing categories
--    such as Scholar Footwear Retro Legend and Scholar Footwear Trailblazer,
--    which showed strong revenue and profit contribution.

-- 4. Review low-margin categories and products, especially items with
--    strong sales but weaker profitability, to improve pricing, supplier
--    cost, discounting, or promotion strategy.

-- 5. Investigate products with negative gross margin and reduce dependency
--    on items that generate sales but reduce overall profitability.

-- 6. Maintain close inventory control for fast-moving products to ensure
--    stock availability and support continued sales performance.

-- 7. Use store-level performance results to identify top-performing stores
--    and compare lower-performing stores against their sales, transaction,
--    and profit patterns.

-- 8. Monitor supplier performance using sales contribution, gross profit,
--    product count, and inventory value to support better purchasing and
--    supplier management decisions.

-- 9. Use the Tableau dashboard to track sales performance, profitability,
--    inventory value, and inventory risk in one consolidated business view.

-- ============================================================