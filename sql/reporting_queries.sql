-- Example 1: Reporting query with joins and aggregation

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE
    o.order_date >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
    total_spent DESC;


-- Example 2: Window function for ranking

SELECT
    customer_id,
    customer_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id, c.customer_name
) t;


-- Example 3: Query optimization pattern (index-friendly filter)

SELECT
    *
FROM orders
WHERE
    order_date >= '2024-01-01'
    AND order_date < '2025-01-01';
