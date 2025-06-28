
-- Basic Business Questions on Pizza Sales

-- 1. Total Orders
SELECT COUNT(*) FROM orders;

-- 2. Total Pizzas Sold
SELECT SUM(quantity) FROM order_details;

-- 3. Top 5 Most Ordered Pizzas (Raw IDs)
SELECT pizza_id, SUM(quantity)
FROM order_details
GROUP BY pizza_id
ORDER BY SUM(quantity) DESC
LIMIT 5;

-- 4. Most Popular Pizza Sizes
SELECT pizzas.size, SUM(order_details.quantity)
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY SUM(order_details.quantity) DESC;

-- 5. Most Popular Pizza Categories
SELECT pizza_types.category, SUM(order_details.quantity)
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY SUM(order_details.quantity) DESC;

-- 6. Daily Orders
SELECT date, COUNT(order_id)
FROM orders
GROUP BY date
ORDER BY date;

-- 7. Hourly Orders
SELECT EXTRACT(HOUR FROM time) AS hour, COUNT(*)
FROM orders
GROUP BY hour
ORDER BY hour;

-- 8. Orders by Time Slot
SELECT 
  CASE 
    WHEN time BETWEEN '10:00:00' AND '13:59:59' THEN 'Morning'
    WHEN time BETWEEN '14:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN time BETWEEN '18:00:00' AND '21:59:59' THEN 'Evening'
    ELSE 'Night'
  END AS time_slot,
  COUNT(*) 
FROM orders
GROUP BY time_slot
ORDER BY COUNT(*) DESC;

-- 9. Busiest Day
SELECT date, COUNT(*) AS order_count
FROM orders
GROUP BY date
ORDER BY order_count DESC
LIMIT 1;

-- 10. Top 5 Pizza Types (may return empty if join fails)
SELECT pizza_types.name, SUM(order_details.quantity)
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY SUM(order_details.quantity) DESC
LIMIT 5;

-- Window Function Examples

-- 11. Rank Orders by Time (per day)
SELECT order_id, date, time,
       RANK() OVER (PARTITION BY date ORDER BY time) AS time_rank
FROM orders
ORDER BY date, time;

-- 12. Running Total of Pizza Sales per ID
SELECT pizza_id, quantity,
       SUM(quantity) OVER (PARTITION BY pizza_id ORDER BY order_details_id) AS running_total
FROM order_details;

-- 13. Rank Pizzas by Total Quantity
SELECT pizza_id, SUM(quantity) AS total_qty,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS sales_rank
FROM order_details
GROUP BY pizza_id;

-- 14. Daily Orders and Overall Total
SELECT date,
       COUNT(order_id) AS daily_orders,
       SUM(COUNT(order_id)) OVER () AS overall_orders
FROM orders
GROUP BY date
ORDER BY date;

-- 15. Lag/Lead in Pizza Sales
SELECT order_details_id, order_id, pizza_id, quantity,
       LAG(quantity) OVER (PARTITION BY pizza_id ORDER BY order_details_id) AS prev_qty,
       LEAD(quantity) OVER (PARTITION BY pizza_id ORDER BY order_details_id) AS next_qty
FROM order_details;
