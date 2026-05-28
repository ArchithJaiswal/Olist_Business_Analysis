-- ============================================================
-- PROJECT  : Olist E-Commerce Business Performance Analysis
-- AUTHOR   : Archith
-- TOOL     : MySQL
-- DATASET  : Brazilian E-Commerce Public Dataset by Olist
--            Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
-- ============================================================

-- BUSINESS OBJECTIVE:
-- Analyze 100K+ real e-commerce transactions to uncover
-- revenue trends, customer behaviour, seller performance,
-- and logistics efficiency across Brazilian states.

-- TABLES USED:
-- orders, order_items, order_payments, customers,
-- products, sellers, category_translation

-- ============================================================
-- ANALYSES & BUSINESS PROBLEMS
-- ============================================================

-- 1. MONTHLY REVENUE TREND
--    Business Problem: Is the business growing or declining?
--    Where are the seasonal peaks we should plan for?

-- 2. TOP REVENUE CATEGORIES
--    Business Problem: Which product categories should we
--    prioritize for marketing and inventory investment?

-- 3. TOP STATES BY ORDERS & REVENUE
--    Business Problem: Which regions drive the most value?
--    Where should we expand or reduce operations?

-- 4. BEST & WORST PERFORMING SELLERS
--    Business Problem: Which sellers are driving revenue
--    and which are underperforming on the platform?

-- 5. PAYMENT METHOD ANALYSIS
--    Business Problem: How are customers paying and does
--    payment behavior vary by order value?

-- 6. CUSTOMER SPEND SEGMENTATION
--    Business Problem: Are we over-relying on a small group
--    of high-value customers for most of our revenue?

-- 7. RFM SEGMENTATION
--    Business Problem: Who are our most valuable customers
--    and who is at risk of churning?

-- 8. AVERAGE DELIVERY TIME BY STATE
--    Business Problem: Which states have logistics problems?
--    Are we meeting our promised delivery dates?

-- 9. SELLER CONCENTRATION RISK
--    Business Problem: Is our revenue dangerously dependent
--    on a few top sellers or is it healthily distributed?

-- ============================================================

-- Monthly Revenue Trend

select date_format(o.order_purchase_timestamp,'%y-%m') as month,
	   count(distinct(oi.order_id)) as total_orders,
       sum(oi.price + oi.freight_value) as revenue
from   order_items oi 
join    orders o on o.order_id = oi.order_id
where   o.order_status = 'delivered'
group by month 
order by month;

-- Top RevenueCategories

SELECT 
    ct.product_category_name_english AS category,
    COUNT(DISTINCT o.order_id) AS total_orders,
     ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN category_translation ct ON p.product_category_name = ct.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10; 

-- Top states by order and revenue

SELECT 
    c.customer_state AS state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
    ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 Best Sellers
SELECT 
    oi.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
    ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT oi.order_id), 2) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN sellers s ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id, s.seller_state
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 Worst Sellers
SELECT 
    oi.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
    ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT oi.order_id), 2) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN sellers s ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id, s.seller_state
HAVING total_orders >= 10
ORDER BY total_revenue ASC
LIMIT 10;

select payment_type,
       count(*) as total_transactions,
	   round(sum(payment_value),2) as total_payment,
       round(avg(payment_value),2) as average_payment,
       round(avg(payment_installments),2) as average_installments
from order_payments
group by payment_type
order by payment_type;

-- Customer Segmentation analysis

select spend_category,
       count(*) as total_customers,
       round(sum(total_spent),2) as revenue_generated,
       round(avg(total_spent),2) as average_revenue_generated
           from
       (select c.customer_id,
	   count(distinct(oi.order_id)) as total_orders,
       round(sum(oi.price + oi.freight_value),2) as total_spent,
       ntile(100) over(order by sum(oi.price + oi.freight_value) desc) as spending_percentile,
        case
           when ntile(100) over(order by sum(oi.price + oi.freight_value) desc) <= 30 then "top 30%"
           when ntile(100) over(order by sum(oi.price + oi.freight_value) desc) <= 70 then "mid 40%"
           else "bottom 30%" end as spend_category 
from order_items oi 
join orders o on o.order_id = oi.order_id
join customers c on c.customer_id = o.customer_id
group by c.customer_id) as t1
group by spend_category
order by Revenue_generated desc;

-- RFM Segmentation

with base_rfm as (select c.customer_unique_id as customer_id,
       Datediff('2018-08-31',max(o.order_purchase_timestamp)) as Recency,
       Count(distinct(o.order_id)) as Frequency,
       ROUND(SUM(oi.price + oi.freight_value),2) as Monetary
from order_items oi 
join orders o on o.order_id = oi.order_id
join customers c on c.customer_id = o.customer_id
where o.order_status = 'delivered'
group by c.customer_unique_id),

rfm_scores as ( select *,
                         ntile(5) over(order by Recency asc) as r_score,
                         ntile(5) over(order by frequency desc) as f_score,
                         ntile(5) over(order by monetary desc) as m_score
from base_rfm)

select case when r_score >= 4 and m_score >= 4 then "High Value"
			when r_score < 3 and m_score > 3 then "At Risk"
            when r_score <= 4 and m_score >= 3 then "Recent Customer"
            when r_score < 3 and m_score < 3 then "Low Value"
            else "Lost" end as RFM_Segment,
            count(*) as total_customers,
            round(avg(recency),2) as avg_recent_days,
            round(avg(frequency),2) as avg_visits,
            round(avg(monetary),2) as avg_spend
from rfm_scores
group by rfm_segment
order by avg_spend;

-- Average Delivery Time by State

select c.customer_state as state,
	   count(distinct(o.order_id)) as total_orders,
       round(avg(datediff(o.order_delivered_customer_date,o.order_purchase_timestamp)),2) as Avg_delivery_days,
      round(avg(datediff(o.order_estimated_delivery_date,o.order_purchase_timestamp)),2) as avg_days_early_delivery,
		sum(case 
            when o.order_delivered_customer_date < o.order_estimated_delivery_date then 1 else 0 end) as late_deliveries
from orders o 
join customers c on c.customer_id = o.customer_id
where o.order_status = 'delivered'
group by c.customer_state
order by total_orders desc;

-- Seller Concentration

with seller_revenue as (
					 select s.seller_id,
                     count(distinct(oi.order_id)) as total_orders,
                     round(sum(oi.price + oi.freight_value)) as total_revenue
					from sellers s
join order_items oi on oi.seller_id = s.seller_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'delivered'
group by s.seller_id
),

seller_rank as (select *,
				       rank() over(order by total_revenue desc) as revenue_rank
					from seller_revenue)
        
select case when revenue_rank <= 10 then "top 10 seller"
			when revenue_rank <= 50 then "top 11-50 seller"
            WHEN REVENUE_RANK <= 100 then "top 51-100 seller"
            else "Remaining Sellers"
            end as seller_group,
            count(*) as total_sellers,
            sum(total_revenue) as total_revenue,
             ROUND(SUM(total_revenue) / (select SUM(total_revenue)from seller_revenue) * 100, 2) AS revenue_share_pct
             from seller_rank
             group by seller_group
             order by total_revenue desc;
					



            
            
	
