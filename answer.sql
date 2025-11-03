SELECT
  it.investor_id,
  s.sector_name,
  ROUND(
    100.0 * SUM(it.no_of_shares) /
    (SELECT SUM(no_of_shares)
     FROM investor_transactions t
     WHERE t.investor_id = it.investor_id)
  , 2) AS percentage
FROM investor_transactions it
JOIN sectors s ON s.sector_id = it.sector_id
GROUP BY it.investor_id, s.sector_name
ORDER BY it.investor_id, s.sector_name;
