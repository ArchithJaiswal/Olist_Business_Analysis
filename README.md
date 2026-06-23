Olist E-Commerce Business Analytics Dashboard
📌 Project Overview

This project presents an end-to-end Business Intelligence solution built using SQL and Power BI on the Brazilian E-Commerce Public Dataset by Olist.

The objective was to analyze over 100,000 e-commerce transactions and transform raw transactional data into actionable business insights covering:

Revenue Performance
Customer Intelligence
Seller Performance
Product & Category Analysis
Supply Chain & Logistics Efficiency
Strategic Business Recommendations

The project follows a complete analytics workflow:

Data Extraction → SQL Analysis → Data Modeling → DAX Measures → Interactive Power BI Dashboard

🎯 Business Objective

Analyze Olist's marketplace performance to answer key business questions:

Is revenue growing consistently?
Which product categories generate the highest value?
Which states drive the majority of sales?
Who are the most valuable customers?
Are sellers evenly contributing to revenue?
How efficient is the delivery network?
Which operational areas require improvement?

🛠 Tools & Technologies
Tool	Purpose
SQL (MySQL)	Data Extraction & Business Analysis
Power BI	Dashboard Development
DAX	KPI Calculations
Power Query	Data Transformation
Data Modeling	Star Schema Design

📊 Dataset Information
Tables Used
orders
order_items
order_payments
customers
products
sellers
category_translation
Dataset Scale
99K+ Orders
96K+ Customers
3K+ Sellers
32K+ Products
27 Brazilian States
SQL Business Analysis

The following business analyses were performed using SQL before building the dashboard.

1. Monthly Revenue Trend
Business Problem
Is the business growing or declining?
Where are the seasonal peaks?
Analysis

Monthly revenue was aggregated to identify revenue growth patterns and seasonality.

Outcome

Provided insights for forecasting demand and inventory planning.

2. Top Revenue Categories
Business Problem

Which product categories should receive more marketing investment?

Analysis

Revenue contribution was calculated across all product categories.

Outcome

Identified high-performing categories driving marketplace revenue.

3. Top States by Orders & Revenue
Business Problem

Which regions generate the most business value?

Analysis

Revenue and order volume were analyzed by customer state.

Outcome

Highlighted key expansion opportunities and high-value markets.

4. Best & Worst Performing Sellers
Business Problem

Which sellers drive the majority of marketplace revenue?

Analysis

Seller-level revenue rankings and contribution analysis.

Outcome

Identified top-performing sellers and underperforming segments.

5. Payment Method Analysis
Business Problem

How do customers prefer to pay?

Analysis

Payment method distribution and revenue contribution analysis.

Outcome

Helped understand customer purchasing behavior.

6. Customer Spend Segmentation
Business Problem

Are revenues concentrated among a small group of customers?

Analysis

Customers segmented based on spending patterns.

Outcome

Identified high-value customer groups.

7. RFM Customer Segmentation
Business Problem

Who are the most valuable customers and who is at risk of churn?

Analysis

Customers segmented using:

Recency
Frequency
Monetary Value
Outcome

Provided customer retention and loyalty insights.

8. Average Delivery Time by State
Business Problem

Which regions experience logistics inefficiencies?

Analysis

Delivery duration measured across states.

Outcome

Identified areas with fulfillment challenges.

9. Seller Concentration Risk
Business Problem

Is revenue overly dependent on a small group of sellers?

Analysis

Revenue concentration measured across seller base.

Outcome

Evaluated marketplace dependency risk.

📈 Power BI Dashboard

Page 1: Executive Overview
Purpose

Provide a high-level view of overall business performance.

KPIs
Total Revenue: 15.84M
Total Orders: 99K
Total Customers: 96K
Average Order Value: 160.58
Visualizations
Monthly Revenue Trend
Revenue by State Map
Revenue & Orders Summary
Dynamic State and Year Filters
Key Insight

The marketplace demonstrates strong revenue growth with a concentrated contribution from major Brazilian states.

Page 2: Sales & Revenue Analysis
Purpose

Analyze revenue drivers and category performance.

KPIs
Total Revenue
Product Revenue
Freight Revenue
Visualizations
Revenue Over Time

Tracks yearly revenue growth.

Revenue Contribution & Growth by Category

Compares category revenue share and growth rates.

Payment Method Distribution

Analyzes customer payment preferences.

State Revenue Growth

Compares current and previous period performance across states.

Business Value

Supports strategic decisions related to:

Product investment
Marketing allocation
Regional expansion
Page 3: Customer Intelligence
Purpose

Understand customer acquisition, retention, and geographic distribution.

KPIs
Average Revenue per Customer
Total Customers
Repeat Customers
Visualizations
One-Time vs Repeat Customers

Measures customer loyalty.

Customer Trend Analysis

Tracks customer growth over time.

Revenue by Customer State

Identifies valuable customer regions.

Top 10 Cities by Customers

Highlights major customer hubs.

Business Value

Helps improve:

Customer retention
Regional targeting
Acquisition strategies
Page 4: Seller & Supply Chain Performance
Purpose

Evaluate marketplace seller performance and dependency risks.

KPIs
Total Sellers
Revenue per Seller
Top Seller Revenue %
Visualizations
Top 20 Sellers by Revenue

Identifies marketplace leaders.

Seller Revenue Distribution

Shows concentration of revenue across seller tiers.

Regional Seller Metrics

Analyzes seller activity by state.

Revenue by Seller State

Geographic seller performance analysis.

Business Value

Supports:

Seller onboarding strategy
Marketplace diversification
Revenue risk management
Page 5: Product & Category Insights
Purpose

Identify the most valuable product categories and optimize inventory strategy.

KPIs
Total Products
Total Categories
Top Category
Top Category Revenue Share %
Visualizations
ABC Analysis – Revenue Contribution

Classifies categories/products into:

A Category → Highest revenue contributors
B Category → Medium contributors
C Category → Low contributors
ABC Analysis – Order Contribution

Measures category importance based on order volume.

Revenue by Category

Highlights top revenue-generating categories.

Orders by Category

Identifies highest demand categories.

Average Product Price by Category

Analyzes pricing differences across categories.

Business Value

Enables:

Inventory optimization
Product portfolio decisions
Marketing prioritization
Page 6: Logistics & Delivery Performance
Purpose

Assess delivery efficiency and operational performance.

KPIs
Average Delivery Days
Average Estimated Delivery Days
States with <5% Late Deliveries
On-Time Delivery Rate
Visualizations
Revenue vs Freight Cost by State

Analyzes shipping profitability.

Monthly Late Order %

Tracks delivery delays over time.

On-Time vs Late Delivery Trend

Measures logistics performance.

On-Time vs Late Delivery by State

Compares fulfillment efficiency across regions.

Business Value

Supports:

Logistics optimization
Delivery performance improvement
Customer satisfaction initiatives
Key Insights Generated

✅ Revenue increased significantly between 2016 and 2018.

✅ Health & Beauty emerged as the highest revenue-generating category.

✅ Credit Card payments dominated customer transactions.

✅ Revenue is concentrated within a relatively small group of sellers.

✅ São Paulo contributed the highest customer and revenue volume.

✅ Over 93% of deliveries were completed on time.

✅ ABC Analysis revealed a small group of categories generating a disproportionate share of total revenue.

--Dashboard Features
Interactive Navigation Buttons
Dynamic Slicers
Cross-Filtering
Drill-Down Analysis
Geographic Mapping
KPI Tracking
Trend Analysis
Category Segmentation
Seller Performance Monitoring
----Skills Demonstrated
--SQL
Joins
Aggregations
CTEs
Window Functions
Business KPI Analysis
--Power BI
Data Modeling
DAX Measures
Power Query
Interactive Dashboards
Drill-through Reporting
Business Analytics
Revenue Analysis
Customer Segmentation
ABC Analysis
Seller Performance Analysis
Logistics Analytics
Executive Reporting



Author
Archith Jaiswal
