-- El ultimo y nuevo Quey como el perfecto

select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamedo='O' then cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor else '2019-12-01 00:00:00' end fecha_ocupacion,
case when
(select   -- case when cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor is null then '2019-12-31 23:59:59' else 
  case when cast(mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor > '2019-12-31 23:59:59' then '2019-12-31 23:59:59' else cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor end
   from hosvital.maepab11 mae2
   where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc  and mae2.hiscnsing = mae.hiscnsing and mae2.hiscamedo='L' 
		and mae2.hiscamctv = (select min(x.hiscamctv) from hosvital.maepab11 x  where x.mptdoc=mae2.mptdoc and x.mpcedu=mae2.mpcedu and x.mpcodp=mae2.mpcodp and x.mpnumc=mae2.mpnumc and x.hiscnsing = mae2.hiscnsing and  x.hiscamedo='L'  and x.hiscamctv >= mae.hiscamctv ) 
) is null  then '2019-12-31 23:59:59' else
(select    -- case when cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor is null then '2019-12-31 23:59:59' else 
  case when CAST(cast(mae2.hiscamfec as varchar(10)) ||' '||mae2.hiscamhor as timestamp) > TIMESTAMP('2019-12-31 23:59:59') then '2019-12-31 23:59:59' else cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor end  
   from hosvital.maepab11 mae2
   where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc  and mae2.hiscnsing = mae.hiscnsing and mae2.hiscamedo='L' 
		and mae2.hiscamctv = (select min(x.hiscamctv) from hosvital.maepab11 x  where x.mptdoc=mae2.mptdoc and x.mpcedu=mae2.mpcedu and x.mpcodp=mae2.mpcodp and x.mpnumc=mae2.mpnumc and x.hiscnsing = mae2.hiscnsing and  x.hiscamedo='L' and x.hiscamctv >= mae.hiscamctv  ) 
) end as Fecha_liberacion,
case when i.ingfecadm>= '2019-12-01 00:00:00'  and i.ingfecadm<= '2019-12-31 23:59:59' then 0 else 1 end as ingreso_real,
case when i.ingfecegr>= '2019-12-01 00:00:00'  and i.ingfecegr<= '2019-12-31 23:59:59' then 0 else 1 end as egreso_real
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc  and mae.mpcodp=m.mpcodp)
where    (( mae.hiscamfec  >= '2019-12-01'  and mae.hiscamfec <= '2019-12-31' and mae.hiscamedo ='O')  OR
		( mae.hiscamfec  >= '2019-12-01'  and mae.hiscamfec <= '2019-12-31' and mae.hiscamedo ='L' and (mae.mptdoc,mae.mpcedu,mae.mpnumc,mae.hiscnsing ) in (select x.mptdoc,x.mpcedu,x.mpnumc,x.hiscnsing  from hosvital.maepab11 x where x.hiscamfec < '2019-12-01' and x.hiscamedo='O'))
		)
order by 1;

-- 24160491
-- 5770765
select * from hosvital.maepab11 where mpcedu = '24160491' order by hiscamfec;
/*
case  when cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor is null  then '2019-12-31 23:59:59'  when mae.hiscamedo='L' then  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor  when mae.hiscamedo='O' then 
             case when cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor is null  then '2019-12-31 23:59:59' else cast( mae2.hiscamfec as varchar(12))|| ' '||mae2.hiscamhor  end end
*/

/*SCI03	2019-11-12 11:37:46	2019-11-12 20:55:20	
SCI02	2019-11-22 08:42:35	2019-11-22 13:10:51
	
420-C	2019-12-01 00:00:00	2019-11-15 20:32:21	
420-C	2019-11-12 20:55:20	2019-11-15 20:32:21	
412-A	2019-11-15 20:32:21	2019-11-22 08:42:35	
420-C	2019-12-01 00:00:00	2019-12-31 23:59:59	
412-A	2019-11-22 13:10:51	2019-12-31 23:59:59	
	
	


*/

-- 5770765 no tien fecha de lib
-- 20277770  muchosm registros -- msomenos
-- 2657245  tiene dos registros de ocupacion  -- ok
-- 93348510 muchos problemas  -- ok
--12969545  OJOMESTEB EMPLEADO AFINARLO HAY COSA QUE MEJORAR
-- 3148402 eror negativo
