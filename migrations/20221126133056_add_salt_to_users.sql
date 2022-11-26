-- Add Salt column to Users
ALTER TABLE users ADD COLUMN salt TEXT NOT NULL;