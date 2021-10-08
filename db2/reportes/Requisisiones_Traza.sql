select * from hosvital.requisici; -- Encabezado
select * from hosvital.admusr;
select * from hosvital.requisi1;  --  Detalle
select * from hosvital.compcab;
select * from hosvital.compcab2;  --Aqui esta la Requisicion
select * from hosvital.entralm;  -- encabezado,creo aui trae la oc en referencia
select * from hosvital.entralm1; -- Detalle
select * from hosvital.cencost where cncdsc like ('%SIST%');

select  r1.REQNRO,r1.REQFCH,r1.RECCNCDDES,r1.REQOBS,r1.REQEST,r2.REQITEM,r2.MSRESO,r2.REQNOMPRO,r2.REQCANAPR,r2.REQORDCOM,  -- entrada de almacen 22004
          c1.ordenro as orden_compra,c1.ordefch,c1.prvcod,c1.ordeobs, c2.ordecsc, c2.msreso,c2.ordecnt,c2.ordevlru,c2.ordettal,c2.ordetoti, c2.ordeestd,c2.ordreqitm
from hosvital.requisici r1, hosvital.requisi1 r2, hosvital.compcab c1 , hosvital.compcab2 c2
where reqfch >= '2019-04-22'and reqnompro like ('%LENOVO%') AND R1.REQNRO= R2.REQNRO and
            c1.ordenro = r2.REQORDCOM and c1.ordenro=c2.ordenro
order by r1.reqnro;

select  r1.REQNRO as req,r1.REQFCH as fecha_req,r1.RECCNCDDES,r1.REQOBS,r1.REQEST,r2.REQITEM,r2.MSRESO,r2.REQNOMPRO,r2.REQCANAPR,r2.REQORDCOM, 
          c1.ordenro as orden_compra,c1.ordefch as fecha_ocompra, (days(c1.ordefch) - days(r1.reqfch)) as dias_hasta_compra, c2.ordecsc, c2.msreso,c2.ordecnt,c2.ordevlru,c2.ordettal,c2.ordetoti, c2.ordeestd,c2.ordreqitm,
        e1.entanro as entrada_alm,e1.entafch as fecha_entrada_almacen,e1.entafact as factura,(days(e1.entafch) - days(c1.ordefch)) as dias_hasta_entradaalmacen,e1.entaest as estado_entrada,
        e2.entacsc,e2.msreso,e2.entacnt,e2.entavlru,e2.entattal
 from hosvital.requisici r1 
inner join hosvital.requisi1 r2 on ( R2.REQNRO= R1.REQNRO) 
inner join hosvital.compcab c1  on (c1.ordenro = r2.REQORDCOM)
 inner join hosvital.compcab2 c2 on (c2.ordenro=c1.ordenro and c2.ordreqitm=r2.reqitem) 
left join hosvital.entralm e1 on (e1.ordenum = c1.ordenro)
 left join hosvital.entralm1 e2 on (e1.entanro = e2.entanro ) --  and e2.entacsc =  c2.ordreqitm) 
where r1.reqfch >= '2019-04-01'  and r1.reqfch <= '2019-08-22'  and r1.reqnro=56583 --  AND R2.REQNOMPRO LIKE('%RINGER%')
order by r1.reqnro;




--El query


select  r1.REQNRO as req,r1.REQFCH as fecha_req,r1.RECCNCDDES,r1.REQOBS,r1.REQEST,r2.REQITEM,r2.MSRESO,r2.REQNOMPRO,r2.REQCANAPR,r2.REQORDCOM, 
          c1.ordenro as orden_compra,c1.ordefch as fecha_ocompra, (days(c1.ordefch) - days(r1.reqfch)) as dias_hasta_compra, c2.ordecsc, c2.msreso,c2.ordecnt,c2.ordevlru,c2.ordettal,c2.ordetoti, c2.ordeestd,c2.ordreqitm,
        e1.entanro as entrada_alm,e1.entafch as fecha_entrada_almacen,e1.entafact as factura,(days(e1.entafch) - days(c1.ordefch)) as dias_hasta_entradaalmacen,e1.entaest as estado_entrada,
        e2.entacsc,e2.msreso,e2.entacnt,e2.entavlru,e2.entattal 
from hosvital.requisici r1 
inner join hosvital.requisi1 r2 on ( R2.REQNRO= R1.REQNRO)
 left join hosvital.compcab c1  on (c1.ordenro = r2.REQORDCOM)
 left join hosvital.compcab2 c2 on (c2.ordenro=c1.ordenro)
 left join hosvital.entralm e1 on (e1.ordenum = c1.ordenro) 
left join hosvital.entralm1 e2 on (e1.entanro = e2.entanro)
 where r1.reqfch >= '2019-04-01'    and  r1.RECNccod IN ('10806'    	,
'S0863'    	,
'I1863'    	,
'F0452'    	,
'S0821'    ,	
'F0823'    ,	
'D0113'    ,	
'A0113'    )	

order by r1.reqnro;


select * from hosvital.requisici where reqnro = 54880;
select * from hosvital.requisi1 where reqnro = 54892 and reqnompro like ('%RINGER%');  --ITEM2
select * from hosvital.compcab2 where ordenro  IN (21877) AND MSRESO ='0147B05X';
select * from hosvital.entralm1 where entanro=40134 ; --AND MSRESO = '0147B05X';
SELECT * FROM HOSVITAL.ENTRALM WHERE entanro in (40065,40066,40067);

select * from hosvital.compcab2 where ordenro  IN (22719);
----------------------------
---------------------------------


select  r1.REQNRO as req,r1.REQFCH as fecha_req,r1.RECCNCDDES,cen.cncdsc,r1.REQOBS,r1.REQEST,r2.REQITEM,r2.MSRESO,r2.REQNOMPRO,r2.REQCANAPR,r2.REQORDCOM, 
          c1.ordenro as orden_compra,c1.ordefch as fecha_ocompra, (days(c1.ordefch) - days(r1.reqfch)) as dias_hasta_compra, c2.ordecsc, c2.msreso,c2.ordecnt,c2.ordevlru,c2.ordettal,c2.ordetoti, c2.ordeestd,c2.ordreqitm,
        e1.entanro as entrada_alm,e1.entafch as fecha_entrada_almacen,e1.entafact as factura,(days(e1.entafch) - days(c1.ordefch)) as dias_hasta_entradaalmacen,e1.entaest as estado_entrada,
        e2.entacsc,e2.msreso,e2.entacnt,e2.entavlru,e2.entattal 
from hosvital.requisici r1 
inner join hosvital.requisi1 r2 on ( R2.REQNRO= R1.REQNRO)
 left join hosvital.compcab c1  on (c1.ordenro = r2.REQORDCOM)
 left join hosvital.compcab2 c2 on (c2.ordenro=c1.ordenro  and c2.ordreqitm=r2.reqitem)
 left join hosvital.entralm e1 on (e1.ordenum = c1.ordenro) 
left join hosvital.entralm1 e2 on (e1.entanro = e2.entanro)
inner join hosvital.cencost cen on (cen.cnccod=r1.RECCNCDDES)
 where r1.reqfch >= '2019-04-01'    and  r1.reqnro=56583
order by r1.reqnro;

select * from hosvital.requisici where reqnro= 56583	;
select * from hosvital.requisi1 where reqnro= 56583	;
select * from  hosvital.cencost;
select * from hosvital.compcab where ordenro  IN (22719) ;
select * from hosvital.admusr where ausrid='72261298';
select * from hosvital.entralm  where ordenum=22719;

select distinct ordeest  from hosvital.compcab;
/*
A	
E	
F	
G	
O	
P	
R	
S	
Y	
/
*/
-- con usuario
------------------



select  r1.REQNRO as req,r1.REQFCH as fecha_req,r1.RECCNCDDES as cod_centroi,cen.cncdsc as centro_costo,r1.REQOBS,r1.REQEST as est_req,r2.REQITEM,r2.MSRESO,r2.REQNOMPRO,r2.REQCANAPR,r2.REQORDCOM, 
          c1.ordenro as orden_compra,c1.ordefch as fecha_ocompra, adm.ausrdsc as usuario_compra,case when c1.ordeest='G' then 'Generada' end as estado_oc,(days(c1.ordefch) - days(r1.reqfch)) as dias_hasta_compra, c2.ordecsc, c2.msreso,c2.ordecnt,c2.ordevlru,c2.ordettal,c2.ordetoti, c2.ordeestd,c2.ordreqitm,
        e1.entanro as entrada_alm,e1.entafch as fecha_entrada_almacen,e1.entafact as factura,(days(e1.entafch) - days(c1.ordefch)) as dias_hasta_entradaalmacen,e1.entaest as estado_entrada,
        e2.entacsc,e2.msreso,e2.entacnt,e2.entavlru,e2.entattal 
from hosvital.requisici r1 
inner join hosvital.requisi1 r2 on ( R2.REQNRO= R1.REQNRO)
 left join hosvital.compcab c1  on (c1.ordenro = r2.REQORDCOM)
 left join hosvital.compcab2 c2 on (c2.ordenro=c1.ordenro  and c2.ordreqitm=r2.reqitem)
 left join hosvital.entralm e1 on (e1.ordenum = c1.ordenro) 
left join hosvital.entralm1 e2 on (e1.entanro = e2.entanro)
left join hosvital.admusr adm on (adm.ausrid=c1.ordeusuc)
inner join hosvital.cencost cen on (cen.cnccod=r1.RECCNCDDES)
 where r1.reqfch >= '2019-04-01'    and  r1.reqnro=56583
order by r1.reqnro;

-- Requisiciones sin orden de compa, en estadoi opendiente

select * from hosvital.requisici;

/*
E Entregado
 N Negado
 O Orden de compra 
P Pendiente
 S Solicitud de Cotización
 T Temporal 
X Anulada 
C Cotizado 
*/

-- Query Requisiciones Sin Orden de Compra

select  r1.REQNRO as req,r1.REQFCH as fecha_req,cen.cncdsc as centro_costo,r1.REQOBS as Observaciones ,case when r2.ReqUltEst  = 'E' then 'Entregado' when r2.ReqUltEst = 'N' then 'Negada' when r2.ReqUltEst = 'O' then 'Orden de Compra'
 when r2.ReqUltEst = 'P' then 'Pendiente' when r2.ReqUltEst = 'S' then 'Solicitud de Cotizacion'   when r2.ReqUltEst = 'T' then 'Temporal'   when r2.ReqUltEst = 'X' then 'Anulada'    when r2.ReqUltEst = 'C' then 'Cotizado'   end as est_req_item,                 r2.REQITEM as item,r2.MSRESO as codigo,r2.REQNOMPRO as producto,r2.REQCANAPR as cantidad ,r2.REQORDCOM as Orden_Compra,case when r1.reqest='A' then 'Aprobada' when r1.reqest='N' then 'Negada' when r1.reqest='P' then 'Pendiente' when r1.reqest='S' then 'Solicitada' when r1.reqest='X' then 'Anulada' end as estado_requisicion
from hosvital.requisici r1 
inner join hosvital.requisi1 r2 on ( R2.REQNRO= R1.REQNRO)
inner join hosvital.cencost cen on (cen.cnccod=r1.RECCNCDDES)
 where r1.reqfch >= '2001-01-01'  and  r2.REQORDCOM = 0  and r1.reqtip='C'
order by r1.reqnro;


select distinct reqtip from hosvital.requisici;

-- este esta en hiosvital*repórt

select r1.REQNRO as req,case when r1.reqtip ='C' then 'Corriente' when r1.reqtip='G' then 'En Consignacion' when r1.reqtip='R' then 'Remision' end as tipo_req,      r1.REQFCH as fecha_req,cen.cncdsc as centro_costo,r1.REQOBS as Observaciones ,adm.ausrdsc as usuario ,       case when r2.ReqUltEst= 'E' then 'Entregado' when r2.ReqUltEst='N' then 'Negada' when r2.ReqUltEst= 'O' then 'Orden de Compra' when r2.ReqUltEst='P' then 'Pendiente' when r2.ReqUltEst='S' then 'Solicitud de Cotizacion' when r2.ReqUltEst='T' then 'Temporal' when r2.ReqUltEst='X' then 'Anulada' when r2.ReqUltEst='C' then 'Cotizado' end as est_req_item,r2.REQITEM as item,r2.MSRESO as codigo,r2.REQNOMPRO as producto,r2.REQCANAPR as cantidad ,r2.REQORDCOM as Orden_Compra,case when r1.reqest='A' then 'Aprobada' when r1.reqest='N' then 'Negada' when r1.reqest='P' then 'Pendiente' when r1.reqest='S' then 'Solicitada' when r1.reqest='X' then 'Anulada' end as estado_requisicion from hosvital.requisici r1 inner join hosvital.requisi1 r2 on (R2.REQNRO=R1.REQNRO) inner join hosvital.cencost cen on (cen.cnccod=r1.RECCNCDDES) 
inner join hosvital.admusr adm on (adm.ausrid=r1.requsucod) where r1.reqfch>=? and r2.REQORDCOM = 0 order by r1.reqnro;




--  Query Compras pendientes
-- Tabla Compcab

/* Estados

A Anulada
 E Entrada Almacén
 F Facturada 
G Generada
 O Pendiente
 P Recibido Parcialmente 
R Recibido Items Cancelados

*/
select * from hosvital.compcab where ordtip <> 'C';

select ordenro as orden_compra,ordefch as fecha, prvcod as cod_proveedor, case when ordeest='A' then 'Anulada' when ordeest='E' then 'Entrada Almacen'  when ordeest='F' then 'Facturada'  when ordeest='G' then 'Generada' 
when ordeest='O' then 'Pendiente'  when ordeest='P' then 'Recibido Parcialmenrte'  when ordeest='R' then 'Recibido Items Cancelados' End, case when ordtip='C' then 'Corriente'  when ordtip='R' then 'Remision'  when ordtip='G' then 'Consignacion' end as tipo_orden
from hosvital.compcab
where ordefch >='2019-06-01 00:00:00'
order by  ordefch;

-- La consultra mas ekl detalle

select * from hosvital.compcab2;

select compcab.ordenro as orden_compra,compcab.ordefch as fecha, compcab.prvcod as cod_proveedor, case when ordeest='A' then 'Anulada' when ordeest='E' then 'Entrada Almacen'  when ordeest='F' then 'Facturada'  when ordeest='G' then 'Generada' 
when ordeest='O' then 'Pendiente'  when ordeest='P' then 'Recibido Parcialmenrte'  when ordeest='R' then 'Recibido Items Cancelados' End, case when ordtip='C' then 'Corriente'  when ordtip='R' then 'Remision'  when ordtip='G' then 'Consignacion' end as tipo_orden,c2.ordreqnro as requisicion ,c2.msreso,m1.msnomg,c2.ordecnt as cantidad , c2.ordevlru as unitario,c2.ordettal as total
from hosvital.compcab compcab
inner join hosvital.compcab2 c2 on (c2.doccod=compcab.doccod and c2.ordenro=compcab.ordenro)
inner join hosvital.maesum1 m1 on (m1.msreso=c2.msreso)
where ordefch >='2019-06-01 00:00:00'
order by  ordefch;


select distinct reqtip from hosvital.requisici;