-- FUNCTION
-- 1
-- pesquisa usada para calcular multa de atraso

DELIMITER $$
CREATE FUNCTION calcular_multa_atraso(
    diasAtraso INT, 
    valorDiaria DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  IF diasAtraso IS NULL OR diasAtraso <= 0 THEN
    RETURN 0.00;
  END IF;
  
  RETURN diasAtraso * (valorDiaria * 0.5);
END$$
DELIMITER ;

-- PROCEDURE
-- 1
-- Se devolveu depois do previsto aplica multa (50 por dia), mas se devolveu no prazo não aplica multa

DELIMITER $$

CREATE PROCEDURE sp_multa_simples (
    IN p_idLocacao INT,
    IN p_dtDevolucao DATETIME
)
BEGIN
    UPDATE locacao l
    JOIN reserva r 
        ON r.idReserva = l.reserva_idreserva
    SET 
        l.dataDevolucao = p_dtDevolucao,
        l.multa = CASE
                    WHEN p_dtDevolucao > r.dataFimPrev 
                    THEN (DATEDIFF(p_dtDevolucao, r.dataFimPrev) * 50)
                    ELSE 0
                  END
    WHERE l.idLocacao = p_idLocacao;
END $$

DELIMITER ;

-- VALIDAÇÕES 

-- FUNCTION
SELECT calcular_multa_atraso(3, 120.00) AS multa;

-- PROCEDURE
CALL sp_multa_simples(1, '2025-11-20 10:00:00');
SELECT idLocacao, dataDevolucao, multa
FROM locacao
WHERE idLocacao = 1;
