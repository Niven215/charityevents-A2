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

CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    org_id INT NOT NULL,
    category_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    short_description VARCHAR(255),
    full_description TEXT,
    event_date DATE NOT NULL,
    event_time TIME,
    location VARCHAR(150) NOT NULL,
    image_url VARCHAR(255),
    ticket_price DECIMAL(8,2) DEFAULT 0.00,
    is_free BOOLEAN DEFAULT FALSE,
    fundraising_goal DECIMAL(10,2) DEFAULT 0.00,
    current_progress DECIMAL(10,2) DEFAULT 0.00,
    is_suspended BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (org_id) REFERENCES organisations(org_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO organisations (name, mission_statement, contact_email, contact_phone, logo_url) VALUES
('Bright Futures Foundation', 'Empowering underprivileged children through education and community support.', 'contact@brightfutures.org', '02 5550 1234', 'https://placehold.co/120x120?text=BFF');

INSERT INTO categories (name) VALUES
('Gala Dinner'),
('Fun Run'),
('Silent Auction'),
('Concert'),
('Walkathon');
