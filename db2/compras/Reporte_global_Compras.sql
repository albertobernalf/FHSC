select *  from hosvital.compcab;
select * from hosvital.compcab1;
select * from hosvital.compcab2;
select * from hosvital.proveedor1;


select c.ordenro as orden,c.ordefch as fech_compra, c.prvcod as proveedor, p.prvcon as proveeedor ,
 case when c.ordeest = 'N' then   ' ' 
	when c.ordeest = 'N' then   ' '
when c.ordeest = 'A' then   'Anulada'
when c.ordeest = 'E' then   'Entrada Almacén'
when c.ordeest = 'F' then   'Facturada'
when c.ordeest = 'G' then   'Generada'
when c.ordeest = 'O' then   'Pendiente'
when c.ordeest = 'P' then   'Recibido Parcialmente'
when c.ordeest = 'R' then   'Recibido Items Cancelados '
end as estado_oc, c.ordeobs as observacion,  c2.msreso, m1.msnomg,    c2.ordecnt,c2.ordevlru,c2.ordettal
from hosvital.compcab c
inner join hosvital.compcab2 c2 on (c2.doccod=c.doccod and c2.ordenro=c.ordenro)
inner join hosvital.proveedor1 p on (p.prvcod=c.prvcod)
inner join hosvital.maesum1 m1 on (m1.msreso=c2.msreso)
where  c.ordefch>= '2019-09-01 00:00:00' and  c.ordefch<= '2019-09-30 00:00:00' 
order by c.ordefch ;