1. Angenommen eine Datenbank hat zwei Tabellen für Bestellungen (orders) und Bestellungsdetails (order_details), wie
in den unteren CTEs dargestellt. Schreibe eine SQL-Abfrage, um folgende Frage zu beantworten.:
- Wie viele Bestellungen gibt es pro Kunde pro Monat?


WITH orders AS (
  SELECT 1 AS order_id, 2 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 2 AS order_id, 2 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 3 AS order_id, 3 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 4 AS order_id, 3 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 5 AS order_id, 2 AS customer_id, '2021-02-02' AS order_date
  UNION ALL
  SELECT 6 AS order_id, 2 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 7 AS order_id, 3 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 8 AS order_id, 3 AS customer_id, '2021-02-02' AS order_date
),

order_details AS (
  SELECT 1 AS order_id, 1 AS product_id, 5 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 1 AS order_id, 2 AS product_id, 2 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 2 AS order_id, 2 AS product_id, 1 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 2 AS product_id, 4 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 6 AS product_id, 3 AS quantity, 7.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 2 AS product_id, 3 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 8 AS product_id, 1 AS quantity, 3.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 1 AS product_id, 3 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 1 AS product_id, 2 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 10 AS product_id, 1 AS quantity, 12.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 11 AS product_id, 7 AS quantity, 22.49 AS price
  UNION ALL
  SELECT 6 AS order_id, 21 AS product_id, 22 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 6 AS order_id, 16 AS product_id, 7 AS quantity, 15.99 AS price
  UNION ALL
  SELECT 7 AS order_id, 11 AS product_id, 3 AS quantity, 22.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 13 AS product_id, 11 AS quantity, 0.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 62 AS product_id, 55 AS quantity, 0.09 AS price
  UNION ALL
  SELECT 8 AS order_id, 56 AS product_id, 2 AS quantity, 25.49 AS price
  UNION ALL
  SELECT 8 AS order_id, 23 AS product_id, 3 AS quantity, 5.55 AS price
)

--- Deine Antwort:
SELECT 
  customer_id, 
  --MONTH(order_date) AS month, 
  DATE_TRUNC('month', order_date) AS order_month,
  COUNT(*) AS num_orders
FROM 
  orders 
GROUP BY 
  1, 
  2
ORDER BY 
  customer_id, 
  order_month



2. Angenommen eine Datenbank hat zwei Tabellen für Bestellungen (orders) und Bestellungsdetails (order_details), wie
in den unteren CTEs dargestellt. Schreibe eine SQL-Abfrage, um folgende Frage zu beantworten.:
- Wie gross ist der Druchschnitliche Bestellwert in Euro pro Monat?
- What is the average order value in euros per month?

WITH orders AS (
  SELECT 1 AS order_id, 2 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 2 AS order_id, 2 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 3 AS order_id, 3 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 4 AS order_id, 3 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 5 AS order_id, 2 AS customer_id, '2021-02-02' AS order_date
  UNION ALL
  SELECT 6 AS order_id, 2 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 7 AS order_id, 3 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 8 AS order_id, 3 AS customer_id, '2021-02-02' AS order_date
),

order_details AS (
  SELECT 1 AS order_id, 1 AS product_id, 5 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 1 AS order_id, 2 AS product_id, 2 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 2 AS order_id, 2 AS product_id, 1 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 2 AS product_id, 4 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 6 AS product_id, 3 AS quantity, 7.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 2 AS product_id, 3 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 8 AS product_id, 1 AS quantity, 3.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 1 AS product_id, 3 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 1 AS product_id, 2 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 10 AS product_id, 1 AS quantity, 12.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 11 AS product_id, 7 AS quantity, 22.49 AS price
  SELECT 6 AS order_id, 21 AS product_id, 22 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 6 AS order_id, 16 AS product_id, 7 AS quantity, 15.99 AS price
  UNION ALL
  SELECT 7 AS order_id, 11 AS product_id, 3 AS quantity, 22.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 13 AS product_id, 11 AS quantity, 0.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 62 AS product_id, 55 AS quantity, 0.09 AS price
  UNION ALL
  SELECT 8 AS order_id, 56 AS product_id, 2 AS quantity, 25.49 AS price
  UNION ALL
  SELECT 8 AS order_id, 23 AS product_id, 3 AS quantity, 5.55 AS price
)

--- Deine Antwort:

WITH orders_per_month AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', order_date) AS ord_month,
    COUNT(DISTINCT order_id) AS num_orders
  FROM
    orders
  GROUP BY
    1,
    2
),
order_totals AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', o.order_date) AS ord_month,
    SUM(quantity * price) AS total_value
  FROM
    orders o
    JOIN order_details od ON o.order_id = od.order_id
  GROUP BY
    1,
    2
)
SELECT
  orders_per_month.ord_month,
  ROUND(AVG(total_value / num_orders),3) AS avg_order_value
FROM
  orders_per_month
  JOIN order_totals ON orders_per_month.customer_id = order_totals.customer_id AND orders_per_month.ord_month = order_totals.ord_month
GROUP BY
  1 
  
  

3. Angenommen eine Datenbank hat zwei Tabellen für Bestellungen (orders) und Bestellungsdetails (order_details), wie
in den unteren CTEs dargestellt. Schreibe eine SQL-Abfrage, um folgende Frage zu beantworten.:
- Wie gross ist der tägliche Umsatzanteil am Montasumsatz pro Kunde?
   * Deine Outputtabelle sollte eine Zeile je Kunde und Tag haben

Suppose a database has two tables for orders and order_details, as shown in the CTEs below.
shown in the CTEs below. Write an SQL query to answer the following question:
- What is the daily sales percentage of montas sales per customer? /What is the daily share of monthly sales per customer?
   * Your output table should have one row per customer per day.
   
WITH orders AS (
  SELECT 1 AS order_id, 2 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 2 AS order_id, 2 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 3 AS order_id, 3 AS customer_id, '2021-01-01' AS order_date
  UNION ALL
  SELECT 4 AS order_id, 3 AS customer_id, '2021-02-01' AS order_date
  UNION ALL
  SELECT 5 AS order_id, 2 AS customer_id, '2021-02-02' AS order_date
  UNION ALL
  SELECT 6 AS order_id, 2 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 7 AS order_id, 3 AS customer_id, '2021-01-02' AS order_date
  UNION ALL
  SELECT 8 AS order_id, 3 AS customer_id, '2021-02-02' AS order_date
),

order_details AS (
  SELECT 1 AS order_id, 1 AS product_id, 5 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 1 AS order_id, 2 AS product_id, 2 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 2 AS order_id, 2 AS product_id, 1 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 2 AS product_id, 4 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 3 AS order_id, 6 AS product_id, 3 AS quantity, 7.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 2 AS product_id, 3 AS quantity, 5.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 8 AS product_id, 1 AS quantity, 3.49 AS price
  UNION ALL
  SELECT 4 AS order_id, 1 AS product_id, 3 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 1 AS product_id, 2 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 10 AS product_id, 1 AS quantity, 12.99 AS price
  UNION ALL
  SELECT 5 AS order_id, 11 AS product_id, 7 AS quantity, 22.49 AS price
  SELECT 6 AS order_id, 21 AS product_id, 22 AS quantity, 2.99 AS price
  UNION ALL
  SELECT 6 AS order_id, 16 AS product_id, 7 AS quantity, 15.99 AS price
  UNION ALL
  SELECT 7 AS order_id, 11 AS product_id, 3 AS quantity, 22.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 13 AS product_id, 11 AS quantity, 0.49 AS price
  UNION ALL
  SELECT 7 AS order_id, 62 AS product_id, 55 AS quantity, 0.09 AS price
  UNION ALL
  SELECT 8 AS order_id, 56 AS product_id, 2 AS quantity, 25.49 AS price
  UNION ALL
  SELECT 8 AS order_id, 23 AS product_id, 3 AS quantity, 5.55 AS price
)


--- Deine Antwort:

WITH
monthly_sales AS (
SELECT
customer_id,
DATE_TRUNC('month', order_date) AS ord_month,
SUM(quantity * price) AS monthly_sales
FROM
orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY
customer_id, DATE_TRUNC('month', order_date)
),
daily_sales AS (
SELECT
customer_id,
order_date,
SUM(quantity * price) AS daily_sales
FROM
orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY
customer_id, order_date
)
SELECT
daily_sales.customer_id,
daily_sales.order_date,
ROUND(daily_sales.daily_sales / monthly_sales.monthly_sales,3) AS daily_sales_percentage
FROM
daily_sales
JOIN monthly_sales ON
daily_sales.customer_id = monthly_sales.customer_id AND
DATE_TRUNC('month', daily_sales.order_date) = monthly_sales.ord_month
ORDER BY
daily_sales.customer_id,
daily_sales.order_date;
