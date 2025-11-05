SELECT
  it.investor.id,
  s.sector_name,
  ROUND(
      (it.no_of_shares * 100.0 / SUM(it.no_of_shares) OVER (PARTITION BY it.investor.id)),
      2
  ) AS share_percentage
FROM investor_transactions it
JOIN sector s 
  ON it.sector_id = s.sector_id
ORDER BY
  it.investor_id,
  share_percentage DESC;
