-- INSERTS

INSERT INTO filial (nome, cidade, uf, idfilial) VALUES
('Central','São Paulo','SP', 1),
('Zona Sul','São Paulo','SP', 2),
('Campinas','Campinas','SP', 3);

INSERT INTO categoria (nome, descricao, valorDiariaPadrao, idcategoria) VALUES
('Economico','Compacto e econômico',120.00, 1),
('Compacto','Pequeno e prático',150.00, 2),
('SUV','SUV médio',280.00, 3),
('Luxo','Veículo de luxo',600.00, 4),
('Van','Transporte de pessoas',350.00, 5);

INSERT INTO cliente (nome, cpf, email, telefone, dataCadastro, idcliente) VALUES
('Ana Silva','12345678910','ana@gmail.com','11911110001','2025-01-10', 1),
('Bruno Costa','10234567894','bruno@gmail.com','11922220002','2025-02-12', 2),
('Carla Souza','25316487236','carla@gmail.com','11933330003','2025-03-05', 3),
('Diego Lima','26683154963','diego@gmail.com','11944440004','2025-04-20', 4),
('Eva Rocha','22135587436','eva@gmail.com','11955550005','2025-05-11', 5),
('Fabio Gomes','11659732468','fabio@gmail.com','11966660006','2025-06-06', 6),
('Gabriela Paz','23998654210','gabriela@gmail.com','11977770007','2025-07-07', 7),
('Hugo Martins','66398523471','hugo@gmail.com','11988880008','2025-08-08', 8),
('Igor Mendes','56229764310','igor@gmail.com','11999990001','2025-09-01', 9),
('Juliana Prado','67329845122','juliana@gmail.com','11999990002','2025-09-02', 10),
('Kevin Duarte','78430956233','kevin@gmail.com','11999990003','2025-09-03', 11),
('Larissa Alves','89541067344','larissa@gmail.com','11999990004','2025-09-04', 12);

INSERT INTO funcionario (nome, cpf, email, idfuncionario, filial_idfilial) 
VALUES
('Laura Ferreira','36321945821','lauralocadora@gmail.com',1, 1),
('Marcos Pinto','36953264812','marcoslocadora@gmail.com',2, 2),
('Patricia Oliveira','42130058623','patricialocadora@gmail.com',3, 3);

 
INSERT INTO veiculo (placa, renavam, marca, modelo, ano, categoria_idCategoria, filial_idFilial, kmatual, idveiculo) 
VALUES
('ABC1A23','48291736512','Fiat','Mobi',2019,1,1,35000, 1),
('DEF2B34','23597615230','Volks','Gol',2018,1,1,42000, 2),
('GHI3C45','85569731204','Chev','Onix',2020,2,2,25000, 3),
('JKL4D56','22316580697','Honda','HR-V',2021,3,3,30000, 4),
('MNO5E67','22331165971','Toyota','Corolla',2022,4,1,18000, 5),
('PQR6F78','33998832640','Renault','Kwid',2017,1,2,52000, 6),
('STU7G89','00231658203','Ford','EcoSport',2019,3,3,47000, 7),
('VWX8H90','03259966331','BMW','320i',2020,4,1,22000, 8),
('YZA9I01','22339976581','Mercedes','C180',2018,4,2,60000, 9),
('BCD0J12','44663329867','Nissan','Kicks',2021,2,2,27000, 10),
('EFG1K23','22334499881','Chev','Spin',2019,5,3,80000, 11),
('HIJ2L34','11336622885','Fiat','Toro',2020,2,1,40000, 12),
('KLM3M45','03597315493','VW','T-Cross',2022,3,1,15000, 13),
('NOP4N56','03269751036','Citroen','C4',2017,2,2,72000, 14),
('QRS5O67','13971397139','Hyundai','HB20',2019,1,3,39000, 15),
('TUV6P78','52802580258','Jeep','Renegade',2020,3,2,26000, 16),
('WXY7Q89','01597530159','Chev','Tracker',2021,1,1,21000, 17),
('ZAB8R90','13964710258','Kia','Sportage',2018,5,3,55000, 15),
('CDE9S01','3062015984','Toyota','Hilux',2022,5,3,12000, 16),
('FGH0T12','03164978025','Volks','Tiguan',2019,3,2,48000, 17);


INSERT INTO reserva (idreserva, cliente_idCliente, veiculo_idVeiculo, idFilial_Retirada, idFilial_Devolucao, dataInicioPrev, dataFimPrev) 
VALUES
(1, 1, 1, 1, 1, '2025-11-10', '2025-11-12'),
(2, 2, 2, 1, 2, '2025-10-20', '2025-10-22'),
(3, 3, 3, 2, 2, '2025-11-05', '2025-11-07'),
(4, 4, 4, 3, 3, '2025-11-15', '2025-11-16'),
(5, 5, 5, 1, 2, '2025-12-01', '2025-12-04'),
(6, 6, 6, 2, 1, '2025-09-01', '2025-09-03'),
(7, 7, 7, 3, 1, '2025-10-01', '2025-10-05'),
(8, 8, 8, 1, 3, '2025-11-01', '2025-11-02'),
(9, 9, 9, 2, 2, '2025-08-10', '2025-08-12'),
(10, 10 ,10, 2, 1, '2025-11-08', '2025-11-10'),
(11,11, 11, 3, 3, '2025-11-11', '2025-11-13'),
(12, 12, 12, 1, 1, '2025-11-02', '2025-11-04');


INSERT INTO locacao (idlocacao, dataretirada, kmretirado, datadevolucao, kmdevolucao, valordiaria, taxas, multa, 
valorfinal, reserva_idreserva, cliente_idcliente, veiculo_idveiculo, idfilial_retirada, idfilial_devolucao)
VALUES
(1, '2025-01-05 09:00:00', 15000, '2025-01-07 18:00:00', 15120, 120.00, 10.00, 0.00, 250.00, 1, 1, 1, 1, 1),
(2, '2025-01-10 10:00:00', 23000, '2025-01-14 12:00:00', 23180, 140.00, 15.00, 20.00, 435.00, 2, 2, 2, 1, 2),
(3, '2025-02-02 08:30:00', 52000, '2025-02-04 09:00:00', 52110, 110.00, 10.00, 0.00, 230.00, 3, 3, 3, 2, 2),
(4, '2025-02-18 15:00:00', 34200, '2025-02-20 17:30:00', 34330, 160.00, 20.00, 0.00, 340.00, 4, 4, 4, 3, 3),
(5, '2025-03-05 09:00:00', 9000, '2025-03-08 13:00:00', 9120, 130.00, 12.00, 10.00, 382.00, 5, 5, 5, 1, 2),
(6, '2025-03-20 11:00:00', 41000, '2025-03-22 16:45:00', 41150, 150.00, 10.00, 0.00, 310.00, 6, 6, 6, 2, 1),
(7, '2025-04-02 07:00:00', 67000, '2025-04-07 19:00:00', 67200, 170.00, 20.00, 40.00, 570.00, 7, 7, 7, 3, 1),
(8, '2025-04-15 13:00:00', 12000, '2025-04-17 18:00:00', 12110, 100.00, 8.00, 0.00, 208.00, 8, 8, 8, 1, 3),
(9, '2025-05-10 09:30:00', 78000, '2025-05-12 10:00:00', 78120, 190.00, 25.00, 0.00, 405.00, 9, 9, 9, 2, 2),
(10, '2025-06-01 08:00:00', 30500, '2025-06-04 09:00:00', 30640, 115.00, 12.00, 5.00, 347.00, 10, 10, 10, 3, 1);


-- atualizar email do cliente 
update cliente
set email = 'bruno.costa23@email.com'
where idCliente = 2;

-- reserva foi cancelada
delete from locacao
where reserva_idreserva = 6;


-- adicionar uma taxa 
update locacao
set taxas = taxas + 30.00, valorFinal = valorFinal + 30.00
where idLocacao = 1;