select * from hosvital.forliq;
select * from hosvital.forliq1;
select * from hosvital.forliq2;

select * from hosvital.honrios;

select f.forliqcod,f.forliqdsc,f1.hnrcod,h.hnrdsc, case when f1.forliqcar = 'V' then 'Valor fijo'   when f1.forliqcar = 'U' then 'Uvr'       when f1.forliqcar = 'F' then 'Factor'   when f1.forliqcar = 'R' then 'Rango'  end ,f1.forliqcar,f1.forliqvlhn
from hosvital.forliq f 
inner join hosvital.forliq1 f1 on (f1.forliqcod=f.forliqcod)
inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)
order by f1.forliqcod,f1.hnrcod;

-- Query

select f.forliqcod as codigo,f.forliqdsc as forma_liquidacion,f1.hnrcod as cod_honor,h.hnrdsc as descripcion, case when f1.forliqcar = 'V' then 'Valor fijo' when f1.forliqcar='U' then 'Uvr' when f1.forliqcar='F' then 'Factor' when f1.forliqcar='R' then 'Rango' end as Caracteristica,f1.forliqvlhn as valor, f1.forcodqx as cod_qx from hosvital.forliq f inner join hosvital.forliq1 f1 on (f1.forliqcod=f.forliqcod) inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod) order by f1.forliqcod,f1.hnrcod;


