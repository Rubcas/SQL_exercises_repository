---Create Table Command
CREATE TABLE cars(
    id SERIAL PRIMARY KEY,
    year INT,
    make TEXT NOT NULL,
    model TEXT NOT NULL
);

---Insert Table Command. Note the data values must match the values of the table its going into.
INSERT INTO cars(year, make, model)
VALUES (2020, 'Toyota', 'Prius');

---Alter Table Command. New requirement to record the number of wheels per car. Non Nullable INT, can be 0 but not blank.
ALTER TABLE cars
ADD wheel_count INT NOT NULL DEFAULT 4


---Update Table Command. New requirement to change the make from ford to The Ford Motor Company
UPDATE cars
SET make = 'The Ford Motor Company'
WHERE make = 'Ford';

---DELETE & DROP Table command. New requirement delete all columns where the ear is null.
DELETE FROM cars
WHERE year IS NULL;

----Cascade: Delete records. This deletes the record and subsequent foreign keys on the other table. Maintains Foreign Key Integrity.
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    amount_spent NUMERIC NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(id)
        ON DELETE CASCADE;
);

----Set Null: set foreign key to NULL (key must be nullable). Retains records but with no association the other database records
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    amount_spent NUMERIC NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(id)
        ON DELETE SET NULL;
);

----Set Default: Set foreign key to default value. Retains records but forces them to maintain a reference.
    id SERIAL PRIMARY KEY,
    amount_spent NUMERIC NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(id)
        ON DELETE SET DEFAULT;
);

--TRUNCATE will remove all records, but not the table itself
TRUNCATE TABLE cars;

---DROP TABLE will delet all rows and columns
DROP TABLE cars;


