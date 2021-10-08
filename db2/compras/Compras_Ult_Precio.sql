select * from hosvital.maesum1;

select * from hosvital.grupos1;

select  m.msgrpcod as grupo,g.grpdsc as descripcion_grupo,  m.mssgrpcd as subgrupo, subg.sgrpdsc as descripcion_subgrupo, m.msreso ascod_medicamento, m.msnomg as medicamento,m.MovVlU1 as ult_precio_compra
from hosvital.maesum1 m, hosvital.grupos g, hosvital.grupos1 subg
where m.msgrpcod=g.grpcod  and g.grpcod=subg.grpcod and subg.sgrpcod=m.mssgrpcd and  m.msestado='S'
order by  g.grpdsc, subg.sgrpdsc
