DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE types;


CREATE TABLE types (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  type_id INT8 REFERENCES types(id),
  cost INT4
);
