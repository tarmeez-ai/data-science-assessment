WITH total_shares AS (
  SELECT investor_id, SUM(no_of_shares) AS total_shares
  FROM investor_transactions
  GROUP BY investor_id
),
sector_shares AS (
  SELECT investor_id, sector_id, SUM(no_of_shares) AS sector_shares
  FROM investor_transactions
  GROUP BY investor_id, sector_id
)
SELECT
  ss.investor_id,
  s.sector_name,
  ROUND(100.0 * ss.sector_shares / ts.total_shares, 2) AS percentage
FROM sector_shares ss
JOIN total_shares ts ON ts.investor_id = ss.investor_id
JOIN sectors s ON s.sector_id = ss.sector_id
ORDER BY ss.investor_id, percentage DESC;
