# ---------------------------------------------------------------------- #
# Step 1: Create the database.                                           #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS dealership;
CREATE DATABASE dealership;
USE dealership;

# ---------------------------------------------------------------------- #
# Step 2: Create the tables.                                             #
# ---------------------------------------------------------------------- # 

# Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

# Table 2: vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(50),
    mileage INT,
    price DECIMAL(10, 2),
    SOLD BOOLEAN DEFAULT FALSE
);

# Table 3: inventory (track which dealership has the vehicle)
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# Table 4: sales_contracts
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    customer_name VARCHAR(50),
    customer_phone VARCHAR(12),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# Table 5 (OPTIONAL): lease_contracts
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lease_start_date DATE,
    lease_end_date DATE,
    monthly_payment DECIMAL(10, 2),
    customer_name VARCHAR(50),
    customer_phone VARCHAR(12),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Step 3: Populate the tables.                                           #
# ---------------------------------------------------------------------- # 

# Sample data for dealerships
INSERT INTO dealerships (name, address, phone) VALUES 
('Best Cars', '123 Main St', '555-1234'),
('Auto World', '456 Elm St', '555-5678'),
('Car Superstore', '789 Oak St', '555-9012');

# Sample data for vehicles
INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, SOLD) VALUES 
('1HGCM82633A123456', 'Honda', 'Civic', 2020, 'Blue', 15000, 20000.00, FALSE),
('1HGCM82633A123457', 'Toyota', 'Corolla', 2019, 'Black', 20000, 18000.00, FALSE),
('1HGCM82633A123458', 'Ford', 'Mustang', 2021, 'Red', 5000, 30000.00, TRUE);

# Sample data for inventory
INSERT INTO inventory (dealership_id, VIN) VALUES 
(1, '1HGCM82633A123456'),
(2, '1HGCM82633A123457'),
(3, '1HGCM82633A123458');

# Sample data for sales_contracts
INSERT INTO sales_contracts (VIN, sale_date, sale_price, customer_name, customer_phone) VALUES 
('1HGCM82633A123458', '2024-01-15', 29500.00, 'John Doe', '555-1234');

# Sample data for (optional) lease_contracts 
INSERT INTO lease_contracts (VIN, lease_start_date, lease_end_date, monthly_payment, customer_name, customer_phone) VALUES 
('1HGCM82633A123457', '2024-02-01', '2027-02-01', 350.00, 'Jane Smith', '555-5678');
