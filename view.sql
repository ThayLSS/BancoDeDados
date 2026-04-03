-- VIEW
-- 1
-- Faturamento mensal de cada filial, baseado em locações concluídas

create view vw_faturamento_mensal as
select 
    f.idfilial,
    f.nome as filial,
    date_format(l.datadevolucao, '%Y-%m') as mes,
    sum(l.valorfinal) as total
from locacao l
join filial f 
    on coalesce(l.idfilial_devolucao, l.idfilial_retirada) = f.idfilial
where l.datadevolucao is not null
group by f.idfilial, date_format(l.datadevolucao, '%Y-%m');

update locacao
set 
    datadevolucao = '2025-11-15 10:00:00',
    kmdevolucao = kmretirado + 200,
    multa = 0,
    valorfinal = (150 * 5) + 20
where idlocacao = 1;

-- 2
-- Mostra o status da frota inteira (em uso / disponível) por categoria.

create view vw_utilizacao_frota as
select 
    c.idcategoria,
    c.nome as categoria,
    count(v.idveiculo) as totalVeiculos,
    
    -- veículos atualmente em uso (sem devolução)
    sum(
        case 
            when exists (
                select 1 
                from locacao l2 
                where l2.veiculo_idveiculo = v.idveiculo
                and l2.datadevolucao is null
            ) then 1 else 0 
        end
    ) as emUso,
    sum(
        case 
            when not exists (
                select 1 
                from locacao l2 
                where l2.veiculo_idveiculo = v.idveiculo
                and l2.datadevolucao is null
            ) then 1 else 0 
        end
    ) as disponiveis

from categoria c
left join veiculo v 
    on v.categoria_idcategoria = c.idcategoria
group by c.idcategoria;

-- VIZUALIZAÇÃO DAS VIEWS
-- 1

select * from vw_faturamento_mensal 
where mes = '2025-11';

-- 2

select * from vw_utilizacao_frota;

