SELECT
i.investor_id,
s.sector_name,
ROUND ( 
  100.0*i.no_of_shares /
   sum (i.no_of_shares) over (PARTITION  by 2 )
   As percentage 
   from investor_transactions As i
   join setor as s 
   on i.sector_id = s.sector_id 
   order by 
   i.investor_id,
   percentage desc ;
