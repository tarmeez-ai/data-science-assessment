SELECT 
    it.investor_id,
    s.sector_name,
    ROUND(
        (CAST(it.no_of_shares AS FLOAT) / 
        (SELECT SUM(no_of_shares) 
         FROM investor_transactions 
         WHERE investor_id = it.investor_id) * 100), 
        2
    ) AS percentage
FROM investor_transactions it
JOIN sectors s 
    ON it.sector_id = s.sector_id
ORDER BY 
    it.investor_id, 
    percentage DESC;
