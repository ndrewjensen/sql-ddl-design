CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code TEXT PRIMARY KEY,
    model TEXT NOT NULL,
    cost NUMERIC(8,2) NOT NULL
);

-- can we sum the sale_prices in order?
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    total NUMERIC(8,2) NOT NULL,
    date_sold TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL REFERENCES customers
);

CREATE TABLE sold_bike (
    id SERIAL PRIMARY KEY,
    sale_price NUMERIC(8,2) NOT NULL DEFAULT REFERENCES bikes.cost, -- bikes.cost?
    note TEXT DEFAULT "None",
    bike_code TEXT NOT NULL REFERENCES bikes,
    order_id INT NOT NULL REFERENCES orders
);

