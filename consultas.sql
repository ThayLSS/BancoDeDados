-- 1) lista de locações com cliente, veículo e filial de retirada
-- Finalidade: relatório que mostra locações com cliente, veículo e filial de retirada.
select 
    l.idlocacao,
    c.nome as cliente,
    v.placa,
    v.marca,
    v.modelo,
    f.nome as filial_retirada,
    l.dataretirada,
    l.datadevolucao,
    l.valorfinal
from locacao l
inner join cliente c 
    on l.cliente_idcliente = c.idcliente
inner join veiculo v 
    on l.veiculo_idveiculo = v.idveiculo
inner join filial f 
    on l.idfilial_retirada = f.idfilial;

-- 2) veículos e sua última locação 
-- identificar veículos sem histórico de locação nos ultimos dias
select 
    v.idveiculo, 
    v.placa, 
    v.marca, 
    v.modelo, 
    max(l.dataretirada) as ultima_locacao
from veiculo v
left join locacao l 
    on v.idveiculo = l.veiculo_idveiculo
group by v.idveiculo, v.placa, v.marca, v.modelo
order by ultima_locacao desc;

-- 3) filiais e veículos 
-- auditoria de filiais sem veículos
select 
    f.idfilial, 
    f.nome as filial, 
    v.idveiculo, 
    v.placa
from veiculo v
right join filial f 
    on v.filial_idfilial = f.idfilial
order by f.idfilial;


-- 4) SUM faturamento por mês/filial
-- relatório financeiro mensal 
select 
    f.nome as filial, 
    date_format(l.datadevolucao, '%Y-%m') as mes, 
    sum(l.valorfinal) as total_faturamento
from locacao l
join filial f 
    on l.idfilial_devolucao = f.idfilial
where l.datadevolucao is not null
group by f.nome, date_format(l.datadevolucao, '%Y-%m')
order by mes, filial;


-- 5) MAX/MIN por categoria 
--  indicar frota por categoria
select 
    c.nome as categoria,
    max(l.valordiaria) as maior_valor_diaria,
    min(v.kmatual) as menor_km_atual
from categoria c
join veiculo v 
    on v.categoria_idcategoria = c.idcategoria
left join locacao l 
    on l.veiculo_idveiculo = v.idveiculo
group by c.idcategoria, c.nome;


-- 6) GROUP BY: quantidade de locações por categoria de veículo
--  visualizar utilização por categoria
select 
    c.nome as categoria, 
    count(l.idlocacao) as qtd_locacoes
from categoria c
left join veiculo v 
    on v.categoria_idcategoria = c.idcategoria
left join locacao l 
    on l.veiculo_idveiculo = v.idveiculo
group by c.idcategoria, c.nome
order by qtd_locacoes desc;


-- 7) CASE: classificação de atraso 
--  identificar locações em atraso
select 
    l.idlocacao, 
    c.nome as cliente, 
    l.dataretirada, 
    l.datadevolucao,
    case
        when l.datadevolucao is null and r.dataFimPrev < now() then 'em aberto'
        when l.datadevolucao is not null and l.datadevolucao > r.dataFimPrev then 'Com atraso'
        else 'No prazo'
    end as status_atraso
from locacao l
left join reserva r 
    on l.reserva_idreserva = r.idreserva
join cliente c 
    on l.cliente_idcliente = c.idcliente;