Select inv.investor_id, sec.sector_name,     
round((inv.no_of_shares * 100.0 / sum(inv.no_of_shares) over (partition by inv.investor_id)),2) as share_percentage
From investor_transactions inv
join sectors sec on inv.sector_id = sec.sector_id
GROUP BY sec.sector_name;