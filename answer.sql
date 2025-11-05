SELECT
  investort.investor_id,
  sec.sector_name,
  ROUND(
  (investort.no_of_shares * 100.0 / SUM(investort.no_of_shares) OVER (PARTITION BY investort.investor_id)),2 )
  AS share_percentage FROM Investor_transactions investort JOIN sectors sec ON investort.sector_id = sec.sector_id 
  ORDER BY investort.investor_id, share_percentage DESC;
