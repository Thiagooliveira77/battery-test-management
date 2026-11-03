-- =====================================================
-- 1. Taxa de aprovação e reprovação
-- =====================================================

SELECT
    result,
    COUNT(*) AS total,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentual
FROM test_results
GROUP BY result;


-- =====================================================
-- 2. Quantidade de testes por modelo
-- =====================================================

SELECT
    b.model,
    COUNT(t.id) AS total_testes
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
GROUP BY b.model
ORDER BY total_testes DESC;


-- =====================================================
-- 3. Principais motivos de reprovação
-- =====================================================

SELECT
    rejection_reason,
    COUNT(*) AS total_reprovacoes
FROM test_results
WHERE result = 'REJECTED'
GROUP BY rejection_reason
ORDER BY total_reprovacoes DESC;


-- =====================================================
-- 4. Média de impedância por modelo
-- =====================================================

SELECT
    b.model,
    ROUND(AVG(tr.impedance_ohm), 2) AS media_impedancia
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
JOIN test_results tr
    ON tr.test_id = t.id
GROUP BY b.model
ORDER BY media_impedancia DESC;


-- =====================================================
-- 5. Desempenho por lote
-- =====================================================

SELECT
    b.batch,
    COUNT(*) AS total_testes,
    SUM(CASE WHEN tr.result = 'APPROVED' THEN 1 ELSE 0 END) AS aprovados,
    SUM(CASE WHEN tr.result = 'REJECTED' THEN 1 ELSE 0 END) AS reprovados,
    ROUND(
        SUM(CASE WHEN tr.result = 'APPROVED' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS taxa_aprovacao
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
JOIN test_results tr
    ON tr.test_id = t.id
GROUP BY b.batch
ORDER BY taxa_aprovacao DESC;-- =====================================================
-- 6. Principais motivos de reprovação
-- =====================================================

SELECT
    rejection_reason,
    COUNT(*) AS total_reprovacoes,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentual
FROM test_results
WHERE result = 'REJECTED'
GROUP BY rejection_reason
ORDER BY total_reprovacoes DESC;
-- =====================================================
-- 7. Taxa de aprovação por modelo de bateria
-- =====================================================

SELECT
    b.model,
    COUNT(*) AS total_testes,
    SUM(CASE WHEN tr.result = 'APPROVED' THEN 1 ELSE 0 END) AS aprovados,
    SUM(CASE WHEN tr.result = 'REJECTED' THEN 1 ELSE 0 END) AS reprovados,
    ROUND(
        SUM(CASE WHEN tr.result = 'APPROVED' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS taxa_aprovacao
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
JOIN test_results tr
    ON tr.test_id = t.id
GROUP BY b.model
ORDER BY taxa_aprovacao DESC;

-- =========================================================
-- 8. Média de impedância por modelo
-- =========================================================

SELECT
    b.model,
    COUNT(tr.id) AS total_testes,
    ROUND(AVG(tr.impedance_ohm), 2) AS media_impedancia,
    MIN(tr.impedance_ohm) AS menor_impedancia,
    MAX(tr.impedance_ohm) AS maior_impedancia
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
JOIN test_results tr
    ON tr.test_id = t.id
GROUP BY b.model
ORDER BY media_impedancia DESC;


-- =========================================================
-- 9. Quantidade de testes por operador
-- =========================================================

SELECT
    t.operator_name,
    COUNT(t.id) AS total_testes,
    SUM(CASE WHEN tr.result = 'APPROVED' THEN 1 ELSE 0 END) AS aprovados,
    SUM(CASE WHEN tr.result = 'REJECTED' THEN 1 ELSE 0 END) AS reprovados
FROM tests t
JOIN test_results tr
    ON tr.test_id = t.id
GROUP BY t.operator_name
ORDER BY total_testes DESC;


-- =========================================================
-- 10. Baterias com maior impedância
-- =========================================================

SELECT
    b.serial_number,
    b.model,
    b.capacity_mah,
    tr.impedance_ohm,
    tr.voltage,
    tr.capacity_mah AS capacidade_testada,
    tr.result,
    tr.rejection_reason
FROM batteries b
JOIN tests t
    ON t.battery_id = b.id
JOIN test_results tr
    ON tr.test_id = t.id
ORDER BY tr.impedance_ohm DESC;
