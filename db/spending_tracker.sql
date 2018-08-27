DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budgets;


CREATE TABLE budgets (
  id SERIAL8 PRIMARY KEY,
  amount NUMERIC(10,2) NOT NULL
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  date_time VARCHAR(255),
  amount NUMERIC(10,2) NOT NULL,
  description VARCHAR(255) NOT NULL,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);
