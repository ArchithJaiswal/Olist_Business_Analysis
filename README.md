Olist E-Commerce Business Performance Analysis

Author: Archith
Tools: MySQL · Power BI · Power Query · DAX
Dataset: Brazilian E-Commerce Public Dataset by Olist (Kaggle)


📌 Project Overview

This project is an end-to-end business intelligence case study built on Olist's real-world Brazilian e-commerce dataset (100K+ orders). The goal was to simulate a real analyst workflow — starting with raw relational data in MySQL, writing business-driven SQL queries to extract insights, and then building those insights into an enterprise-grade, multi-page Power BI dashboard suitable for stakeholder reporting and MNC-level recruiter review.

The analysis covers revenue performance, customer behavior, seller and supply chain efficiency, product/category trends, and logistics — concluding with a dedicated recommendations page that translates findings into actionable business decisions.


🗃️ Dataset & Schema

Seven core tables were loaded into a local MySQL instance (olist_db) via LOAD DATA INFILE:


orders
order_items
order_payments
customers
products
sellers
category_translation



Note: order_reviews was excluded due to parsing errors during import; geolocation was loaded directly into Power BI.




🧮 Phase 1 — SQL Analysis (MySQL)

Nine business-driven queries were written to answer real operational questions, using window functions, CTEs, and subqueries:

#AnalysisBusiness Problem1Monthly Revenue TrendIs the business growing or declining? Where are the seasonal peaks?2)Top Revenue CategoriesWhich categories should be prioritized for marketing/inventory investment?3)Top States by Orders & RevenueWhich regions drive the most value? 4)Where to expand or reduce operations?4Best & Worst Performing SellersWhich sellers drive revenue, and which underperform?5)Payment Method AnalysisHow do customers pay, and does behavior vary by order value?6)Customer Spend SegmentationIs revenue over-reliant on a small group of high-value customers?7)RFM SegmentationWho are the most valuable customers, and who is at risk of churning?8)Average Delivery Time by StateWhich states have logistics issues? Are promised delivery dates being met?9)Seller Concentration RiskIs revenue dangerously dependent on a few top sellers?


📊 Phase 2 — Power BI Dashboard

A 7-page interactive report was built on top of a star schema (with order_items as the central fact table), connected via custom navigation buttons across all pages.

1. Executive Overview

High-level KPIs (Total Revenue ₹15.84M, Total Orders 99K, Total Customers 96K, Avg Order Value ₹160.58) with monthly revenue trend and a geographic revenue-by-state map. Includes State and Year slicers.

2. Sales and Revenue

Breaks down Total, Product, and Freight Revenue; category-wise revenue contribution and YoY growth %; payment mode distribution; and revenue growth comparison by state (current vs. previous year).

3. Customer Intelligence

Tracks Average Revenue per Customer, Repeat vs. One-Time Customer split, customer growth trend over time, revenue by customer state, and top cities by customer count.

4. Seller & Supply Chain Performance

Surfaces Total Sellers, Revenue per Seller, and Top Seller Revenue % alongside top 20 sellers by revenue, seller revenue distribution buckets, and regional seller performance metrics.

5. Product & Category Insights

Highlights Total Products, Total Categories, and Top Category Revenue Share, with revenue/orders by category and average product price by category. Includes a Top 10 vs. Bottom 10 category comparison (ABC-style analysis), built using calculated columns after identifying that native ABC analysis doesn't support measure-based logic in Power BI.

6. Category Drill-Through

A dedicated drill-through page enabling deep-dive analysis into any individual product category selected from the Category page.

7. Logistics and Delivery

Covers Avg Delivery Days vs. Estimated Days, On-Time Delivery %, monthly late-order % heatmap by state, and on-time vs. late delivery comparison by state — surfacing regional logistics bottlenecks.

8. Recommendations

Synthesizes findings from all prior pages into a concise set of data-backed business recommendations covering category investment priorities, seller risk mitigation, and logistics improvement areas — designed to mirror how a real analyst would present conclusions to stakeholders.


⚙️ Key Technical Highlights


Star schema modeling with order_items as the central fact table
DAX measures written using VAR/RETURN patterns for readability and performance
KPI cards with conditional formatting and Unicode arrow indicators for growth/decline
Custom Calendar table with proper date hierarchy and sort-by-column configuration
Power Query ETL: unpivoting, merging, and cleaning transformations
Resolved real-world Power BI constraints, including:

Visual border requirement for rounded card corners
Auto date/time hierarchy conflicts
ABC Analysis quick-insight limitation (resolved using calculated columns instead of measures)



Cross-page navigation buttons and drill-through functionality for a seamless reporting experience



📈 Key Business Insights


Total revenue of ₹15.84M across 99K orders and 96K customers
health_beauty is the top-performing category, contributing 9.10% of total revenue
93.23% on-time delivery rate, with 8 of 27 states maintaining under 5% late deliveries
Top sellers account for 12.80% of total seller revenue, indicating moderate concentration risk
Repeat customers make up only 2.91% of the customer base but are a key lever for revenue growth



🚀 Tools & Setup


Database: MySQL (local instance, olist_db)
BI Tool: Power BI Desktop
Data Source: CSV files from the Kaggle Olist dataset, loaded via LOAD DATA INFILE (MySQL) and Power Query (Power BI)


To reproduce locally:


Download the dataset from Kaggle.
Load CSVs into MySQL using the schema above.
Run the SQL scripts (/sql) to generate business insights.
Open the .pbix file in Power BI Desktop and refresh the data source connections.
