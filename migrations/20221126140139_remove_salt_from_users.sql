-- Remove Salt column
-- We are now storing password hashes in PHC format.
ALTER TABLE users DROP COLUMN salt;