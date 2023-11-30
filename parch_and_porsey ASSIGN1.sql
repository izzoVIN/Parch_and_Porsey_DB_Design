

CREATE TABLE region (
	id Serial PRIMARY KEY,
	name Varchar NOT NULL
);

CREATE TABLE sales_reps (
	id Serial PRIMARY KEY,
	name Varchar NOT NULL,
	region_id int, 
	FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE accounts (
	id Serial PRIMARY KEY,
	name varchar NOT NULL UNIQUE,
	website varchar NOT NULL,
	lat DECIMAL (9,6),
	long DECIMAL (9,6),
	primary_poc varchar,
	sales_rep_id int,
	FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(id)
);

CREATE TABLE web_events(
	id Serial PRIMARY KEY,
	occurred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	account_id int,
	FOREIGN KEY (account_id) REFERENCES accounts(id),
	channel varchar NOT NULL
);

CREATE TABLE orders(
	id Serial PRIMARY KEY,
	account_id int,
	FOREIGN KEY (account_id) REFERENCES accounts(id),
	standard_qty int,
	poster_qty int,
	total int,
	standard_amt_usd int,
    gloss_amt_usd int,
    poster_amt_usd int,
    total_amt_usd int
);

DROP TABLE orders;

ALTER TABLE orders
ADD CONSTRAINT check_positive_values
CHECK (
    standard_qty >= 0 AND
    poster_qty >= 0 AND
    total >= 0 AND
    standard_amt_usd >= 0 AND
    gloss_amt_usd >= 0 AND
    poster_amt_usd >= 0 AND
    total_amt_usd >= 0
);








