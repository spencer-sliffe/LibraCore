-- sql/03_test_queries.sql
-- 1. List overdue borrowings
SELECT
    bt.id AS transaction_id,
    u.first_name || ' ' || u.last_name AS member,
    ci.title,
    bt.borrow_date,
    lr.due_date,
    CURRENT_DATE - lr.due_date AS days_overdue
FROM loans_borrowingtransaction bt
JOIN loans_reservation lr ON lr.id = bt.reservation_id
JOIN auth_user u ON u.id = bt.member_id
JOIN catalog_item ci ON ci.id = lr.item_id
WHERE lr.due_date < CURRENT_DATE
  AND bt.return_date IS NULL;

-- 2. Number of items per genre
SELECT genre, COUNT(*) AS total
FROM catalog_item
GROUP BY genre
ORDER BY total DESC;

-- 3. Borrow count by member
SELECT
    u.id,
    u.first_name || ' ' || u.last_name AS member,
    COUNT(bt.id) AS borrow_count
FROM auth_user u
LEFT JOIN loans_borrowingtransaction bt ON bt.member_id = u.id
GROUP BY u.id
ORDER BY borrow_count DESC;

-- 4. Mark notification as read
UPDATE notifications_notification SET is_read = TRUE WHERE id = 1;

-- 5. Return an item and update availability
UPDATE loans_borrowingtransaction SET return_date = CURRENT_DATE WHERE id = 1;
UPDATE catalog_item SET availability = TRUE WHERE id = (SELECT item_id FROM loans_reservation WHERE id = 1);
