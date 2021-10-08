select * from hosvital.kardex1 
where movfch >= '2020-07-14 00:00:00'  and  movfch <= '2020-07-15 23:59:59' and  msreso='0043MQ72' and bodega='01' ;

select m.msreso,m.msnomg,'ident medicamento','saldo_anteriro' ,sum(case when k.moves='E' then movcnt end) as entran, sum(case when k.moves='S' then movcnt end) as salen, sum(k.movsld) as saldo_final,
(sum(k.movsld) - sum(case when k.moves='S' then movcnt end) ) solicitar
from hosvital.kardex1 k
inner join hosvital.maesum1 m on (m.msreso=k.msreso)
where k.movfch >= '2020-07-10 00:00:00'  and  k.movfch <= '2020-07-16 23:59:59' and k.bodega='01' and k.msreso in ('F008M03A')
group by  m.msreso,m.msnomg ;

-- Query Final
select * from hosvital.maesum1;

select m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,
(
ifnull(sum(k.movsld),0)  +  ifnull(sum(case when k.moves='S' then movcnt end),0) - ifnull(sum(case when k.moves='E' then movcnt end),0)
)
 as saldo_anterior ,
sum(case when k.moves='E' then movcnt end) as entran, sum(case when k.moves='S' then movcnt end) as salen, sum(k.movsld) as saldo_final,
(sum(k.movsld) - sum(case when k.moves='S' then movcnt end) ) solicitar
from hosvital.kardex1 k
inner join hosvital.maesum1 m on (m.msreso=k.msreso)
where k.movfch >= '2020-07-15 00:00:00'  and  k.movfch <= '2020-07-15 23:59:59' and k.bodega='01'  -- and k.msreso in ('F008M03A')
group by  m.msreso,m.msnomg,m.mstipo ;

-- Query corregido

select distinct m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,
(select y.movsld from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch  = (select min(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59'))  as  saldo_anterior ,
(select sum(case when r.moves='E' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59')
 as entran, 
(select sum(case when r.moves='S' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') as salen, 
 (select (ifnull(r.movsld,0)   - ifnull( case when r.moves='S' then r.movcnt end,0)  + ifnull(case when r.moves='E' then r.movcnt end ,0)  )           from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch     = (select max(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch < '2020-07-15 23:59:59' ))  as saldo_final,
(
 (select (ifnull(r.movsld,0)   - ifnull( case when r.moves='S' then r.movcnt end,0)  + ifnull(case when r.moves='E' then r.movcnt end ,0)  )           from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch     = (select max(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch < '2020-07-15 23:59:59' ))
-
(select sum(case when r.moves='S' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') 
) as solicitar from hosvital.kardex1 k inner join hosvital.maesum1 m on (m.msreso=k.msreso) where k.bodega= '01' and k.movfch >= '2020-07-15 00:00:00' and k.movfch <= '2020-07-15 23:59:59'   ;

--  Query Acotado

select distinct m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,
(select y.movsld from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch  = (select min(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59'))  as  saldo_anterior ,
(select sum(case when r.moves='E' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59')
 as entran, 
(select sum(case when r.moves='S' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') as salen, 
 (select (ifnull(r.movsld,0)   - ifnull( case when r.moves='S' then r.movcnt end,0)  + ifnull(case when r.moves='E' then r.movcnt end ,0)  )           from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch     = (select max(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch < '2020-07-15 23:59:59' ))  as saldo_final,
(
 (select (ifnull(r.movsld,0)   - ifnull( case when r.moves='S' then r.movcnt end,0)  + ifnull(case when r.moves='E' then r.movcnt end ,0)  )           from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch     = (select max(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch < '2020-07-15 23:59:59' ))
-
(select sum(case when r.moves='S' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') 
) as solicitar from hosvital.kardex1 k inner join hosvital.maesum1 m on (m.msreso=k.msreso) where k.bodega= '01' and k.movfch >= '2020-07-15 00:00:00' and k.movfch <= '2020-07-15 23:59:59'   ;

-- Query con ultimas adiciones COLUMNA DEVOLUCIOn

select distinct m.msreso,m.msnomg,case when m.mstipo='S' then 'Medicamento' when m.mstipo='O' then 'Suministro' end as identificacion_med,
(select y.movsld from hosvital.kardex1 y where y.bodega=k.bodega and y.msreso=k.msreso and y.movfch  = (select min(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=y.bodega and t.msreso=y.msreso and t.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59'))  as  saldo_anterior ,
(select sum(case when r.moves='E' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59')
 as entran, 
(select sum(case when r.moves='S' then r.movcnt end)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') as salen, 
(select sum(r.movcnt)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso  and r.trancod='DEVASIS' and r.movfch  between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59') as Devolucion, 


 (select (ifnull(r.movsld,0)   - ifnull( case when r.moves='S' then r.movcnt end,0)  + ifnull(case when r.moves='E' then r.movcnt end ,0)  )           from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch     = (select max(t.movfch) 
						                from hosvital.kardex1 t
						                  where t.bodega=r.bodega and t.msreso=r.msreso and t.movfch < '2020-07-15 23:59:59' ))  as saldo_final,
(
(select ifnull(sum(case when r.moves='S' then r.movcnt end),0)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso and r.movfch between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59')  
-
(select ifnull(sum(r.movcnt),0)  from hosvital.kardex1 r where r.bodega=k.bodega and r.msreso=k.msreso  and r.trancod='DEVASIS' and r.movfch  between  '2020-07-15 00:00:00' and  '2020-07-15 23:59:59')  
) as solicitar 

from hosvital.kardex1 k inner join hosvital.maesum1 m on (m.msreso=k.msreso) where k.bodega= '01' and k.movfch >= '2020-07-15 00:00:00' and k.movfch <= '2020-07-15 23:59:59'   ;

