select m.msgrpcod as grupo,g.grpdsc as descripcion_grupo,m.mssgrpcd as subgrupo, subg.sgrpdsc as descripcion_subgrupo, m.msreso as cod_medicamento,m.msnomg as medicamento,m.MovVlU1 as ult_precio_compra 
from hosvital.maesum1 m,hosvital.grupos g, hosvital.grupos1 subg 
where m.msgrpcod=g.grpcod and g.grpcod=subg.grpcod and subg.sgrpcod=m.mssgrpcd and m.msestado='S'
 order by g.grpdsc,subg.sgrpdsc;

-- ctrcstprm


select * from hosvital.ctrcstprm
where ccpmsreso= '0052MQ74';

select * from hosvital.ctrcstprm y
where y.ccpmsreso= '0052MQ74' and 
y.ccpfchmov =(select max(x.ccpfchmov) from hosvital.ctrcstprm x where y.ccpmsreso= x.ccpmsreso);

select m.msgrpcod as grupo,g.grpdsc as descripcion_grupo,m.mssgrpcd as subgrupo, subg.sgrpdsc as descripcion_subgrupo, m.msreso as cod_medicamento,m.msnomg as medicamento,m.MovVlU1 as ult_precio_compra ,
y.ccpcstpfi as promedio
from hosvital.maesum1 m,hosvital.grupos g, hosvital.grupos1 subg , hosvital.ctrcstprm y
where y.ccpmsreso = m.msreso and m.msgrpcod=g.grpcod and g.grpcod=subg.grpcod and subg.sgrpcod=m.mssgrpcd and m.msestado='S'  and 
y.ccpfchmov =(select max(x.ccpfchmov) from hosvital.ctrcstprm x where y.ccpmsreso= x.ccpmsreso);

 order by g.grpdsc,subg.sgrpdsc;

