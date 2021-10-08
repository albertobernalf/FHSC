select distinct mstipo, count(*)  from hosvital.maesum1 group by mstipo;

select m1.msreso codigo,m1.mscodi mscodi ,m1.msprac msprac,m1.cnccd cnccd, m1.msform msform ,case when m1.mstipo='O' then 'Otros' when m1.mstipo='S' then 'Sumionistros' when m1.mstipo='L' then 'Liquidos' end as tipo ,m1.msnomg,m1.msgrpcod,m1.mssgrpcd, g.grpdsc grupo, g1.sgrpdsc subgrupo, case when msctrllot='S' then 'Si'   when msctrllot='N' then 'No' else '' end Manejo_Lotes , case when msposx =1 then 'NO POS' when msposx =0 then 'POS' end as POS, case when msindenf ='S' then  'Si'    when msindenf ='N' then  'No'   end as solicita_enfermeria
from hosvital.maesum1 m1
inner join hosvital.grupos g on (g.grpcod=m1.msgrpcod)
inner join hosvital.grupos1 g1 on (g1.grpcod=m1.msgrpcod and g1.sgrpcod = m1.mssgrpcd)
left join hosvital.maesumn m2 on (m2.mscodi=m1.mscodi and m2.msprac=m1.msprac and m2.cnccd=m1.cnccd and m2.msform=m1.msform)
where msestado ='S'
order by msreso;

select * from hosvital.grupos;
select * from hosvital.grupos1;

select * from hosvital.maesumn;
