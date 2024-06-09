# ---------------------------------------------------------------------- #
# Step 1: Create the database.                                           #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS dealership;
CREATE DATABASE dealership;
USE dealership;

# ---------------------------------------------------------------------- #
# Step 2: Create the tables.                                             #
# ---------------------------------------------------------------------- #

-- Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

-- Table 2: vehicles
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

-- Table 3: inventory (track which dealership has the vehicle)
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: sales_contracts
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    customer_name VARCHAR(50),
    customer_phone VARCHAR(12),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 5 (OPTIONAL): lease_contracts
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