---File demonstrates SQL scripting to execture SQL code


---One to many relationship
CREATE TABLE categories(
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);

---Foreign Key of category_id column added to products table
CREATE TABLE products(
    id SERIAL,
    name TEXT NOT NULL,
    discontinued BOOLEAN NOT NULL,
    category_id INT,
    PRIMARY KEY (id)
);

--- Foreign key implementation 
ALTER TABLE products
ADD CONSTRAINT fk_categories_products
FOREIGN KEY (category_id)
REFERENCES categories;