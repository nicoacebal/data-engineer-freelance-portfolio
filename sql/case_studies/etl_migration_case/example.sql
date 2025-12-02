/*
Before: function blocking index usage
*/

SELECT *
FROM records
WHERE DATE(event_time) = '2025-01-01';

/*
After: index-friendly filter
*/

SELECT *
FROM records
WHERE event_time >= '2025-01-01'
  AND event_time < '2025-01-02';

/*
Index recommendation:
CREATE INDEX idx_records_event_time ON records(event_time);
*/
