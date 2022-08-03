CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code TEXT PRIMARY KEY,
    model TEXT NOT NULL,
    cost NUMERIC(10,2) NOT NULL --may as well just always use (10,2) for money, convention
);

-- can we sum the sale_prices in order? Yes, but don't bother
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    -- total NUMERIC(8,2) NOT NULL, --Don't do this here. Keep one source of truth
    sold_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL REFERENCES customers
);

CREATE TABLE bikes_orders (
    id SERIAL PRIMARY KEY,
    sale_price NUMERIC(10,2) NOT NULL --don't default -- change to (10,2) for convention.
    note TEXT DEFAULT '',--making this an empty string makes it a falsy python value
    bike_code TEXT NOT NULL REFERENCES bikes,
    order_id INT NOT NULL REFERENCES orders
);

