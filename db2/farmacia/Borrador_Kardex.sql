-- Query sin arreglos

select m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,(select min(y.movsld) from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch=(select min(t.movfch) from hosvital.kardex1 t where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as saldo_anterior ,
(select ifnull(sum(case when r.moves='E' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as entran,
 (select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as salen,
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Devolucion, 
(select MIN(ifnull(r.movsld,0)- ifnull(case when r.moves='S' then r.movcnt end,0)+ ifnull(case when r.moves='E' then r.movcnt end ,0)) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch=(select max(t.movfch) from hosvital.kardex1 t where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch<'2020-12-31 00:00:00')) as saldo_final,
((select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') - (select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch  between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as solicitar
 from hosvital.maesum1 m inner join hosvital.kardex k on (k.msreso=m.msreso) where k.bodega= '01'  and k.msreso= '0001A02A'
order by m.msreso;

--Query con arreglos

select m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,(select min(y.movsld) from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch=(select min(t.movfch) from hosvital.kardex1 t where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as saldo_anterior ,
(select ifnull(sum(case when r.moves='E' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as entran,
 (select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod NOT IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as salen,
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Devolucion, 
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO') and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Traslado, 

(select MIN(ifnull(r.movsld,0)- ifnull(case when r.moves='S' then r.movcnt end,0)+ ifnull(case when r.moves='E' then r.movcnt end ,0)) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso  and r.trancod NOT IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO') and r.movfch=(select max(t.movfch) from hosvital.kardex1 t where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch<'2020-12-31 00:00:00')) as saldo_final,
((select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') - (select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch  between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as solicitar
 from hosvital.maesum1 m inner join hosvital.kardex k on (k.msreso=m.msreso) where k.bodega= '01' 
order by m.msreso;

select * from hosvital.traninv where trandsc like ('%TRAS%');
/*
DEVTRAS 	
SALTRAS 	
ENTTRAS 	
TRASLADO	

*/

--Query con arreglos ii

select m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,(select min(y.movsld) from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch=(select min(t.movfch) from hosvital.kardex1 t where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as saldo_anterior ,
(select ifnull(sum(case when r.moves='E' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 23:59:59') as entran,
 (select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod NOT IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as salen,
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Devolucion, 
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and   r.moves='E' and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Traslado_entrada,
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and   r.moves='S' and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') as Traslado_salida,


(select MIN(ifnull(r.movsld,0)- ifnull(case when r.moves='S' then r.movcnt end,0)+ ifnull(case when r.moves='E' then r.movcnt end ,0)) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso  and r.movfch=(select max(t.movfch) from hosvital.kardex1 t where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch<='2020-12-31 23:59:59')) as saldo_final,
((select ifnull(sum(case when r.moves='S' then r.movcnt end),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between '2020-12-01 00:00:00' and '2020-12-31 00:00:00') - (select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod='DEVASIS' and r.movfch  between '2020-12-01 00:00:00' and '2020-12-31 00:00:00')) as solicitar
 from hosvital.maesum1 m inner join hosvital.kardex k on (k.msreso=m.msreso) where k.bodega= '01'  and k.msreso= '0001A02A'
order by m.msreso;


(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and   r.moves='E' and r.movfch between ? and ?) as Traslado_entrada,
(select ifnull(sum(r.movcnt),0) from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.trancod IN ('DEVTRAS','SALTRAS','ENTTRAS','TRASLADO')  and   r.moves='S' and r.movfch between ? and ?) as Traslado_salida,
