INSERT INTO batteries
    (id, serial_number, model, capacity_mah, batch, status)
VALUES
    (1, 'HDP1-000001', 'BAT-3350', 3350, 'L2026-01', 'TESTED'),
    (2, 'HDP1-000002', 'BAT-3350', 3350, 'L2026-01', 'TESTED'),
    (3, 'HDP1-000003', 'BAT-3350', 3350, 'L2026-01', 'TESTED'),
    (4, 'HDP1-000004', 'BAT-3350', 3350, 'L2026-02', 'TESTED'),
    (5, 'HDP1-000005', 'BAT-3350', 3350, 'L2026-02', 'TESTED'),
    (6, 'HDP1-000006', 'BAT-2600', 2600, 'L2026-02', 'TESTED'),
    (7, 'HDP1-000007', 'BAT-2600', 2600, 'L2026-03', 'TESTED'),
    (8, 'HDP1-000008', 'BAT-2600', 2600, 'L2026-03', 'TESTED'),
    (9, 'HDP1-000009', 'BAT-3350', 3350, 'L2026-03', 'TESTED'),
    (10, 'HDP1-000010', 'BAT-3350', 3350, 'L2026-03', 'TESTED');


INSERT INTO tests
    (id, battery_id, test_type, operator_name)
VALUES
    (1, 1, 'IMPEDANCE', 'Operador A'),
    (2, 2, 'IMPEDANCE', 'Operador A'),
    (3, 3, 'IMPEDANCE', 'Operador B'),
    (4, 4, 'IMPEDANCE', 'Operador B'),
    (5, 5, 'IMPEDANCE', 'Operador A'),
    (6, 6, 'IMPEDANCE', 'Operador C'),
    (7, 7, 'IMPEDANCE', 'Operador C'),
    (8, 8, 'IMPEDANCE', 'Operador A'),
    (9, 9, 'IMPEDANCE', 'Operador B'),
    (10, 10, 'IMPEDANCE', 'Operador B');


INSERT INTO test_results
    (id, test_id, impedance_ohm, voltage, capacity_mah, result, rejection_reason)
VALUES
    (1, 1, 180.00, 8.20, 3310, 'APPROVED', NULL),
    (2, 2, 210.00, 8.18, 3280, 'APPROVED', NULL),
    (3, 3, 275.00, 8.15, 3200, 'REJECTED', 'Impedância acima do limite'),
    (4, 4, 190.00, 8.21, 3340, 'APPROVED', NULL),
    (5, 5, 310.00, 8.12, 3150, 'REJECTED', 'Impedância acima do limite'),
    (6, 6, 160.00, 8.19, 2580, 'APPROVED', NULL),
    (7, 7, 0.00, 8.10, 2500, 'REJECTED', 'Impedância inválida'),
    (8, 8, 225.00, 8.17, 2540, 'APPROVED', NULL),
    (9, 9, 195.00, 8.22, 3320, 'APPROVED', NULL),
    (10, 10, 265.00, 8.14, 3180, 'REJECTED', 'Impedância acima do limite');
