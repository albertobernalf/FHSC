select compcab.ordenro as orden_compra,compcab.ordefch as fecha, compcab.prvcod as cod_proveedor, case when ordeest='A' then 'Anulada' when ordeest='E' then 'Entrada Almacen'  when ordeest='F' then 'Facturada'  when ordeest='G' then 'Generada' when ordeest='O' then 'Pendiente' when ordeest='P' then 'Recibido Parcialmenrte' when ordeest='R' then 'Recibido Items Cancelados' End, case when ordtip='C' then 'Corriente' when ordtip='R' then 'Remision' when ordtip='G' then 'Consignacion' end as tipo_orden,c2.ordreqnro as requisicion,c2.msreso,m1.msnomg,c2.ordecnt as cantidad,c2.ordevlru as unitario,c2.ordettal as total from hosvital.compcab compcab inner join hosvital.compcab2 c2 on (c2.doccod=compcab.doccod and c2.ordenro=compcab.ordenro) inner join hosvital.maesum1 m1 on (m1.msreso=c2.msreso) 
where ordefch>='2020-01-01 00:00:00' and ordefch<='2020-12-31 00:00:00' order by ordefch;


-- Orden de Compra

select c.ordenro as orden,c.ordefch as fech_compra, c.prvcod as proveedor, p.prvcon as proveeedor , case when c.ordeest = 'A' then 'Anulada'when c.ordeest='E' then 'Entrada Almacén' when c.ordeest='F' then 'Facturada' when c.ordeest='G' then 'Generada' when c.ordeest='O' then 'Pendiente' when c.ordeest='P' then 'Recibido Parcialmente' when c.ordeest='R' then 'Recibido Items Cancelados' end as estado_oc, c.ordeobs as observacion,c2.msreso,m1.msnomg,c2.ordecnt,c2.ordevlru,c2.ordettal from hosvital.compcab c inner join hosvital.compcab2 c2 on (c2.doccod = c.doccod and c2.ordenro=c.ordenro AND ORDCENCOS='F0452') inner join hosvital.proveedor1 p on (p.prvcod=c.prvcod) inner join hosvital.maesum1 m1 on (m1.msreso=c2.msreso) where c.ordefch>='2020-01-01 00:00:00' and C.ordefch<='2020-12-31 00:00:00' order by c.ordefch;

select * from hosvital.ordtrab;
select * from hosvital.ordtrab where ordtrbnro  =65511;
select * from hosvital.ordtrab1 where ordtrcenc='F0452';
select * from hosvital.ordtrab1 where ordtrbnro  =29519;
select * from hosvital.proveedor;
select * from hosvital.proveedor1;
select * from hosvital.proveedor1 where prvcod = '830118571';
select * from hosvital.terceros where trccod = '830118571';
select * from hosvital.maeserv; ---SRV01          	



select o.ordtrbnro as orden_trab,o.ordtrbfch fecha,o.prvcod as cod_prov,t.trcrazsoc as proveedor,o.ordtrbdsc descripcion,o1.maesercod, mae.maeserdes SERVICIO, case when o.ordtrbest='O' THEN 'Pendiente' 
when o.ordtrbest='A' THEN 'Anulada' when o.ordtrbest='F' THEN 'Facturada'  ELSE  NULL END ESTADO_ORD_TRABAJO
from hosvital.ordtrab o
inner join hosvital.ordtrab1 o1 on (o1.empcod=o.empcod and o1.mcdpto=o.mcdpto and o1.doccod=o.doccod and o1.ordtrbnro = o.ordtrbnro)
inner join hosvital.terceros t on (t.trccod=o.prvcod)
inner join hosvital.maeserv mae on (mae.maesercod=o1.maesercod)
where o.ordtrbfch >= '2020-01-01 00:00:00' and o.ordtrbfch <= '2020-12-31 23:59:00' and o1.ordtrcenc='F0452';