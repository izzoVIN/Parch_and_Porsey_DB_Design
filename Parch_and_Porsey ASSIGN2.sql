

SELECT * FROM accounts
WHERE name LIKE 'C%';

SELECT * FROM accounts
WHERE name LIKE '%one%';

SELECT * FROM accounts
WHERE name LIKE '%s';

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');


SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

SELECT standard_qty, poster_qty, gloss_qty
FROM orders
WHERE standard_qty > 1000
  AND poster_qty = 0
  AND gloss_qty = 0;
  
  SELECT name
FROM accounts
WHERE 
    NOT (UPPER(name) LIKE 'C%') -- Does not start with 'C' (case-insensitive)
    AND (UPPER(name) LIKE '%S') -- Ends with 'S' (case-insensitive);
	
	
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;


SELECT channel, occurred_at
FROM web_events
WHERE channel IN ('organic', 'adwords') 
  AND EXTRACT(YEAR FROM occurred_at) = 2016
ORDER BY occurred_at DESC;


SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;


SELECT standard_qty, gloss_qty, poster_qty
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);
  

SELECT id, account_id, standard_amt_usd / standard_qty AS unit_price
FROM orders
LIMIT 10;


SELECT
    id,
    account_id,
    ((standard_amt_usd + gloss_amt_usd) / NULLIF((standard_amt_usd + gloss_amt_usd), 0)) * 100 AS poster_paper_percentage
FROM
    orders;
	
SELECT gloss_amt_usd
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT id, total_amt_usd
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



	
	
	
	
	
	
	
	
	









