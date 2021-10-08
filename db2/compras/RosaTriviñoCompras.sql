-- 1. ,

/*
Solicito de su colaboración para contar con la siguiente consulta:

Código de Insumo y/o Medicamento --
Descripción de Insumo y/o Medicamento --
Fecha último precio de Compra --
Precio de última Compra --
Proveedor última Compra , nombre ultimo proveedo --
-- Tarifa Promedio por cada ítem.  Para está tarifa promedio no se puede contar los ceros ya que esto baja el precio de compra y generaría error en la asignación de tarifas.,, precio de venta
Agrupador: Medicamentos Pos – No Pos, Médico Quirúrgico Pos – No Pos, material osteosíntesis, reactivos, radiofármacos, entre otros.--
 

Dado el número de requerimientos que nos llegan y los tiempos de respuesta del área se requiere que está la podamos generar desde el área y 
cuyos filtros sean por código 
y 
nombre, 
la opción todos.  
Está consulta se requiere para construcción de presupuesto y construcción de paquetes.

 

Quedamos atentos a sus comentarios, gracias

 

*/

select * from hosvital.maesum1 where msreso='0004NP01';

select * from hosvital.grupos;
select * from hosvital.grupos1;
select  *  from hosvital.maesumn;
select * from  hosvital.CtrCstPrm where ccpmsreso='0004NP01'	order by ccpfchmov;
select * from hosvital.movinv3 where doccod='IEA' AND DOCNRO=5190;

select m1.msreso codigo, mn.mscodi,mn.msprac,mn.cnccd,mn.msform,m1.msnomg descripcion,g.grpdsc grupo,g1.sgrpdsc subgrupo, ctr.ccpfchmov ult_fecha_compra, ter.trcrazsoc as proveedor,
case when mn.msposx='1' then 'No Pos'  when mn.msposx='0' then 'Pos'  end tipo, m1.movvlu1 ultimopreciocompra,  ctr.CCPCstPFi costopromedio
from hosvital.maesum1 m1
left join hosvital.maesumn mn on (mn.mscodi=m1.mscodi and mn.msprac=m1.msprac and mn.cnccd=m1.cnccd and mn.msform=m1.msform)
inner join hosvital.grupos g on (g.grpcod=m1.msgrpcod)
inner join hosvital.grupos1 g1  on (g1.grpcod=m1.msgrpcod     and g1.sgrpcod= m1.mssgrpcd )
left join hosvital.CtrCstPrm ctr on (ctr.ccpmsreso = m1.msreso)
left join hosvital.movinv3 m3 on (m3.doccod=ctr.ccpdoccod   and m3.docnro=ctr.ccpnrodoc)
left join hosvital.terceros ter on (ter.trccod=m3.movtercod)
where  m1.msestado ='S' and m1.msgrpcod in ('01','02') and ctr.ccpfchmov = (select  max (ctr1.ccpfchmov) from hosvital.CtrCstPrm ctr1 where ctr1.ccpmsreso = ctr.ccpmsreso  )
order by m1.msreso;


-- Query marisol

-- msreso,codigo cum, descruipcion,cod_anato,  estado, cod,porta, nombre porta, valor, fecha vigencia


select * from hosvital.portarsu; -- pscodi, psdesc
select * from hosvital.portars1; --
select * from hosvital.portars2; -- psvigin, psvalu1



select m1.msreso codigo, m1.MsCodCUM codigoCum,mn.mscodi,mn.msprac,mn.cnccd,mn.msform,m1.msnomg descripcion, m1.msestado as estado, pu.pscodi cod_portafolio,pu.psdesc desc_portafolio, p2.psvalu1, p2.psvigin
from hosvital.maesum1 m1
left join hosvital.maesumn mn on (mn.mscodi=m1.mscodi and mn.msprac=m1.msprac and mn.cnccd=m1.cnccd and mn.msform=m1.msform)
inner join hosvital.portarsu pu on (pu.psest='S')
inner join hosvital.portars2 p2 on (p2.pscodi= pu.pscodi and p2.msreso=m1	.msreso)
where m1.msestado ='S' and p2.psvigin= (select max(p22.psvigin) from hosvital.portars2 p22 where p22.msreso=m1.msreso)
order by m1.msreso, p2.pscodi;

--  Veamos ordenes de trabajo

select * from hosvital.ordtrab where ordtrbfch >= '2021-07-01 00:00:00';  -- ordtrbcc
select * from hosvital.ordtrab1;  -- ordtrbnro, maesercod,ordtrbcnt, ordtrvlru, ordtrtots,
select * from hosvital.cencost;

select year(o.ordtrbfch) ano, month(o.ordtrbfch) mes,o.ordtrbnro as orden,o.ordtrbdsc descripcion,o.ordtrbfch fecha, o.ordtrbobs observaciones,o.ordtrbcc,c.cncdsc centro_costo
from hosvital.ordtrab o
inner join hosvital.cencost c on (c.cnccod=o.ordtrbcc)
where o.ordtrbfch>= '2021-07-01 00:00:00' and o.ordtrbfch<= '2021-07-31 00:00:00' ;