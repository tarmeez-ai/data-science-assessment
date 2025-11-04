WITH investor_totals AS (
    SELECT
        investor_id,
        SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
)
SELECT
    it.investor_id,
    s.sector_name,
    ROUND(it.no_of_shares * 100.0 / itot.total_shares, 2) AS percentage
FROM investor_transactions AS it
JOIN investor_totals AS itot
    ON it.investor_id = itot.investor_id
JOIN sectors AS s
    ON it.sector_id = s.sector_id
ORDER BY
    it.investor_id,
    percentage DESC;
