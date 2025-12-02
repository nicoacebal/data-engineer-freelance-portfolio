/*
Example: Improving slow query performance

Problem:
The original query was filtering on a function,
which prevented index usage.

Bad version:
*/

SELECT *
FROM orders
WHERE DATE(order_date) = '2025-01-01';

/*
Optimized version:
*/

SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-01-02';

/*
This allows:
- index usage
- faster execution
- better scalability
*/
