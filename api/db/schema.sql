DROP DATABASE IF EXISTS charityevents_db;
CREATE DATABASE charityevents_db;
USE charityevents_db;

CREATE TABLE organisations (
    org_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    mission_statement TEXT,
    contact_email VARCHAR(150),
    contact_phone VARCHAR(30),
    logo_url VARCHAR(255)
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE
);
