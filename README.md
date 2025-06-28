
# 🍕 Pizza Sales Analysis (SQL + Window Functions)

This project contains SQL queries for analyzing pizza sales data using PostgreSQL. It is ideal for beginner-to-intermediate Data Analysts looking to practice business questions and window functions using real-world data.

## 📁 Dataset Tables Used

- `orders` – Contains order date and time
- `order_details` – Contains quantities of each pizza per order
- `pizzas` – Contains pizza sizes and price (if available)
- `pizza_types` – Contains pizza names and categories

## 🔍 Business Questions Covered

1. Total number of orders
2. Total number of pizzas sold
3. Top 5 most ordered pizzas
4. Most popular pizza sizes
5. Most popular pizza categories
6. Orders per day
7. Orders per hour
8. Orders by time slot (morning, afternoon, evening, night)
9. Day with the highest number of orders
10. Top 5 pizza types by quantity sold

## 🧠 Window Function Examples

11. Ranking orders by time (daily)
12. Running total of pizzas sold (by pizza_id)
13. Ranking pizzas by total quantity sold
14. Showing daily order counts alongside overall order total
15. Comparing quantity of pizzas using `LEAD()` and `LAG()`

## 💻 How to Use

1. Open `pgAdmin` or any SQL interface connected to your PostgreSQL database.
2. Import the dataset tables (`orders`, `order_details`, `pizzas`, `pizza_types`).
3. Run the queries from [`pizza_sales_analysis.sql`](pizza_sales_analysis.sql).

## 📌 Note

- Some queries may return empty results if the `pizza_id` values in `order_details` do not match the ones in `pizzas`.
- You can modify the joins or clean the data to ensure consistency.

## 🚀 Skills Practiced

- SQL Joins
- Grouping and Aggregation
- Window Functions: `RANK`, `SUM OVER`, `LAG`, `LEAD`
- Business analytics  problems


---

> Created by [Bandari Ritesh](https://www.linkedin.com/in/bandari-ritesh) –  Data Analyst
