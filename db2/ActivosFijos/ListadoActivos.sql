select * from hosvital.actfij where actsed <>'001' ;
select * from hosvital.actfij where acfcod= 'FEC000432';
select * from hosvital.actfijcla;
select * from hosvital.actfijtra1;
select * from hosvital.actfijasg;
select * from hosvital.actmej;
select * from hosvital.actdep;
select * from hosvital.actfij1;

select * from hosvital.grupo;
select * from hosvital.subgrp;

select ac.claactid, ac.acfcod,  ac.acfdsc, ac.acfchact, ac.grucod,gr.grudsc, ac.subgrpcod, sub.subgrpdsc,ac.marcod, ac.acffchco, ac.acfvlrco as valor_comercial, ac.acfviut as vida_util, ac.actgar, ac.actctohis, ac.actdepnor, ac.actfchaju,  ac.actfchdep,  ac.actfijest,  ac.actfijpro
from hosvital.actfij ac , hosvital.grupo gr, hosvital.subgrp sub
where ac.grucod = gr.grucod and  ac.grucod = sub.grucod and ac.subgrpcod=sub.subgrpcod and ac.acfcod= 'FEC000432'
order by ac.acfdsc;

select  ac.acfcod,  ac.acfdsc, ac.grucod,gr.grudsc, ac.subgrpcod, sub.subgrpdsc,ac.marcod, mar.mardsc, ac.acffchco as fecha_compra,ac.fchentalm as fecha_entrada_almacen,ac.actfcrea as fecha_creacion,
 ac.acfvlrco as valor_comercial,cen.cncdsc as centro_costo,ac.funced as funcionario, adm.ausrdsc as nombre_usuario, ac.acfasgcd as responsable
from hosvital.actfij ac , hosvital.grupo gr, hosvital.subgrp sub, hosvital.marcas mar, hosvital.cencost cen, hosvital.admusr adm
where ac.actsed='001'and ac.grucod = gr.grucod and  ac.grucod = sub.grucod and ac.subgrpcod=sub.subgrpcod  -- and ac.acfcod= 'FEC000432' 
	and mar.marcod=ac.marcod and cen.cnccod=ac.actcto and ac.acffchco >= '2019-01-01' and  adm.ausrid = ac.funced
order by ac.acfdsc;

select * from hosvital.marcas where marcod='1003';
select *  from hosvital.admusr where ausrid= '80137931';

select * from hosvital.cencost ;

-- Query Final

select  ac.acfcod,  ac.acfdsc, gr.grudsc, mar.mardsc, ac.acffchco as fecha_compra,ac.fchentalm as fecha_entrada_almacen,ac.actfcrea as fecha_creacion,
 ac.acfvlrco as valor_compra,  ac.ACTDEPNOR AS DEPRECIACION_ACUMULADA, ac.ACTSDODEP AS SALDO_DEP,         cen.cncdsc as centro_costo,ac.funced as funcionario, adm.ausrdsc as nombre_usuario, ac.ACTFIJEST AS ESTADO 
from hosvital.actfij ac
inner join hosvital.grupo gr on (gr.grucod=ac.grucod)
inner join hosvital.marcas mar on (mar.marcod= ac.marcod)
inner join hosvital.cencost cen on (cen.cnccod =ac.actcto)
left join  hosvital.admusr adm on (adm.ausrid=ac.funced)
where ac.actsed='001' and ac.acffchco >= '2019-01-01'  and ac.acffchco <= '2019-07-01' 
order by ac.acfdsc;


select * from hosvital.grupo;
select * from hosvital.subgrp;


-- Acotado

select  ac.acfcod,  ac.acfdsc, gr.grudsc, mar.mardsc, ac.acffchco as fecha_compra,ac.fchentalm as fecha_entrada_almacen,ac.actfcrea as fecha_creacion, ac.acfvlrco as valor_compra,  ac.ACTDEPNOR AS DEPRECIACION_ACUMULADA, ac.ACTSDODEP AS SALDO_DEP,  cen.cncdsc as centro_costo,ac.funced as funcionario, adm.ausrdsc as nombre_usuario, ac.ACTFIJEST AS ESTADO from hosvital.actfij ac inner join hosvital.grupo gr on (gr.grucod=ac.grucod)
inner join hosvital.marcas mar on (mar.marcod= ac.marcod) inner join hosvital.cencost cen on (cen.cnccod =ac.actcto) left join  hosvital.admusr adm on (adm.ausrid=ac.funced) where ac.actsed='001' and ac.acffchco >= ? order by ac.acfdsc;

