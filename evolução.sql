-- aumenta tamanho de email em funcionario
ALTER TABLE funcionario
MODIFY COLUMN email VARCHAR(40);


-- adiciona kmAtual em veiculo para controle de quilometragem
ALTER TABLE veiculo
ADD COLUMN kmAtual INT DEFAULT NULL;

-- alterar para que possa receber o valor NULL, informando que o carro ainda não foi entregue, portanto não tem valorFinal
ALTER TABLE locacao
MODIFY valorFinal DECIMAL(10,2) NULL;


-- padrão para trabalhar com valores em $
ALTER TABLE Locacao
MODIFY COLUMN valorDiaria DECIMAL(10,2) NOT NULL,
MODIFY COLUMN taxas DECIMAL(10,2) NOT NULL,
MODIFY COLUMN multa DECIMAL(10,2) NOT NULL,
MODIFY COLUMN valorFinal DECIMAL(10,2) NOT NULL;

ALTER TABLE categoria
MODIFY COLUMN valorDiariaPadrao DECIMAL(10,2) NOT NULL;

-- limpeza da tabela
TRUNCATE TABLE locacao;