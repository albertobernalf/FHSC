select c.ordenro as orden,e.entanro as entrada_almacen,c.ordefch as fech_compra, c.prvcod as proveedor, p.prvcon as proveeedor , case when c.ordeest = 'A' then 'Anulada'when c.ordeest='E' then 'Entrada Almacén' when c.ordeest='F' then 'Facturada' when c.ordeest='G' then 'Generada' when c.ordeest='O' then 'Pendiente' when c.ordeest='P' then 'Recibido Parcialmente' when c.ordeest='R' then 'Recibido Items Cancelados' end as estado_oc, c.ordeobs as observacion,c2.msreso as cod_med,m1.msnomg as medicamento,c2.ordecnt as cantidad_oc,c2.ordevlru as unitario_oc,c2.ordettal as total_oc ,
e1.msreso as entrada_med,e1.entacnt as entrada_cant,e1.entavlru as entrada_unitario, e1.entattal as entrada_total
from hosvital.compcab c
 inner join hosvital.compcab2 c2 on (c2.doccod=c.doccod and c2.ordenro=c.ordenro) 
inner join hosvital.proveedor1 p on (p.prvcod=c.prvcod) 
inner join hosvital.maesum1 m1 on (m1.msreso=c2.msreso)
left join hosvital.entralm e on (E.DOCCOD='IEA' AND e.ordenum=c.ordenro )
left join hosvital.entralm1 e1 on (e1.DOCCOD=e.doccod  AND e1.entanro=e.entanro and e1.entacsc = c2.ordecsc )
 where c.ordefch>='2020-01-01 00:00:00' and c.ordefch<='2020-06-30 23:59:59' and e.entanro=43017	
 order by c.ordefch,e.entanro;

SELECT * FROM HOSVITAL.ENTRALM where entanro=43017;
SELECT * FROM HOSVITAL.ENTRALM1 where entanro=43017;

select * from hosvital.compcab2 where doccod='IOC' AND 

select * from hosvital.compcab2; --  where doccod=';
select * from hosvital.compcab2 where doccod='IOC' AND ORDENRO = 24488  AND ORDECSC IN (11,131);