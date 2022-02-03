CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	billing_info VARCHAR(150)
);

CREATE TABLE concession(
	food_id SERIAL PRIMARY KEY,
	food_name VARCHAR(100),
	food_price NUMERIC(6,2)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(50),
	movie_length INTEGER NOT NULL
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	ticket_cost NUMERIC(4,2),
	movie_show_date DATE,
	movie_show_time INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	movie_title VARCHAR(150),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY(movie_title) REFERENCES movie(movie_title)
);

CREATE TABLE order_transaction(
	order_id SERIAL PRIMARY KEY,
	order_date DATE,
	order_total NUMERIC(6,2),
	food_id INTEGER NOT NULL,
	ticket_id INTEGER NOT NULL,
	billing_info VARCHAR(150),
	FOREIGN KEY(food_id) REFERENCES concession(food_id),
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	FOREIGN KEY(billing_info) REFERENCES customer(billing_info)
);