/*
Año
Mes
Asegurador
Valor Total

*/

select year(m.facfch) ano, month(m.facfch) mes,mae.mennit cod_aseg,mae.menomb aseguradora, sum(m.mavals) valor_total
from hosvital.maeate m
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.facfch>= '2019-01-01' and m.facfch<= '2021-06-30' and m.maestf not in ('1','10') -- and mae.mennit='THOMAS2'
group by year(m.facfch), month(m.facfch),mae.mennit,mae.menomb 
order by year(m.facfch), month(m.facfch),mae.menomb;

select sum(matotf), sum(mavals) from hosvital.maeate where year(facfch)=2021 and month(facfch)=6 and maestf not in ('1','10');
