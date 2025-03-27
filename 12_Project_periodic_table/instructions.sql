# Renames
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

# Remove Invalid Entry
DELETE FROM properties WHERE atomic_number=1000;
DELETE FROM elements WHERE atomic_number=1000;

# Constraints
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD CONSTRAINT elements_uc UNIQUE(symbol,name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
# Foreign keys
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
# types table creation and reference
CREATE TABLE types();
ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY;
ALTER TABLE types ADD COLUMN type VARCHAR(30) NOT NULL;
INSERT INTO types(type) VALUES('nonmetal'),('metal'),('metaloid');
ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);

# Update type_id
UPDATE properties SET type_id=1 WHERE type='nonmetal';
UPDATE properties SET type_id=2 WHERE type='metal';
UPDATE properties SET type_id=3 WHERE type='metalloid';
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
# Uppercase symbols
UPDATE elements SET symbol= CONCAT(UPPER(LEFT(symbol,1)),LOWER(SUBSTRING(symbol,2,LENGTH(symbol))));
# Trim trailing zeroes
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = TRIM(TRAILING '0' FROM atomic_mass::text)::DECIMAL;
# Insert Elements 9 + 10
INSERT INTO elements(atomic_number,symbol,name) VALUES(9,'F','Fluorine'),(10,'Ne','Neon');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
VALUES (9,'nonmetal',18.998,-220,-188.1,1),
(10,'nonmetal',20.18,-248.6,-246.1,1);
