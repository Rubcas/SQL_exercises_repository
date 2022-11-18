
--- Create the following 2 tables 
CREATE TABLE divisions(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE teams(
	id SERIAL PRIMARY KEY,
	city TEXT NOT NULL,
	name TEXT NOT NULL UNIQUE,
	home_color TEXT NOT NULL,
	away_color TEXT,
	division_id INT
);


---Use the ALTER TABLE statement to enforce the foreign key constraint between these tables.
---If a division is deleted, any teams records that reference that division should set their division_id reference to NULL
ALTER TABLE teams
ADD CONSTRAINT fk_teams_divisions
FOREIGN KEY(division_id)
REFERENCES divisions (id)
ON DELETE SET NULL;

---INSERT into divisions 4 records with these name values: "Atlantic", "Metropolitan", "Pacific", and "Central". The id column should be populated automatically.
---INSERT a record for the New York Islanders who play in the Metropolitan division, wear "Royal blue" at home, and wear "White" away.
---INSERT another record for the Seattle Kraken who play in the Pacific division, wear "Deep sea blue" at home, and wear "White" away.
INSERT INTO divisions (name) VALUES
('Atlantic'), ('Metropolitan'), ('Pacific'), ('Central');

INSERT INTO teams (city, name, home_color, away_color, division_id) VALUES
('New York', 'Islanders','Royal Blue', 'White', 2),
('Seattle', 'Seattle Kraken', 'Deep sea blue', 'White', 3);

---UPDATE the "Metropolitan" division to have a name of "Cosmopolitan"
UPDATE divisions
SET name = 'Cosmopolitan'
WHERE name = 'Metropolitan';


---DELETE the newly-named Cosmopolitan division from the divisions table.
DELETE FROM divisions
WHERE name = 'Cosmopolitan';