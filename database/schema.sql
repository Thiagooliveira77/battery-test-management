CREATE TABLE batteries (
    id INTEGER PRIMARY KEY,
    serial_number VARCHAR(50) NOT NULL UNIQUE,
    model VARCHAR(20) NOT NULL,
    capacity_mah INTEGER NOT NULL,
    batch VARCHAR(30),
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tests (
    id INTEGER PRIMARY KEY,
    battery_id INTEGER NOT NULL,
    test_type VARCHAR(30) NOT NULL,
    test_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    operator_name VARCHAR(100),
    FOREIGN KEY (battery_id) REFERENCES batteries(id)
);

CREATE TABLE test_results (
    id INTEGER PRIMARY KEY,
    test_id INTEGER NOT NULL,
    impedance_ohm DECIMAL(10,2),
    voltage DECIMAL(10,3),
    capacity_mah INTEGER,
    result VARCHAR(20) NOT NULL,
    rejection_reason VARCHAR(255),
    FOREIGN KEY (test_id) REFERENCES tests(id)
);
