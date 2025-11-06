-- ADD YOUR SQL QUERY HERE
SELECT
it.investor_id,
s.sector_name,
ROUND((it.no_of_shares * 100.0 / total.total_shares), 1) as percentage
FROM investor_transactions it
JOIN sectors s ON it.sector_id = s.sector_id
JOIN (
SELECT investor_id, SUM(no_of_shares) as total_shares
FROM investor_transactions
GROUP BY investor_id
) total ON it.investor_id = total.investor_id
ORDER BY it.investor_id, percentage DESC
