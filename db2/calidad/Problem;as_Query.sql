select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,case when mae.hiscamfec < ? then ?||' 00:00:00' else cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,(select case when mae2.hiscamfec>? then '2019-11-30'||' 23:59:59' else cast (mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end from hosvital.maepab11 mae2 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv and mae2.hiscamctv=(select min(x.hiscamctv) from hosvital.maepab11 x where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv>mae.hiscamctv)) as Fecha_liberacion,cast(round((select case when mae2.hiscamfec>? then case when mae.hiscamfec<? then (days ('2019-11-30'||' 23:59:59')/1.00-days(?||' 00:00:00')/1.00)/1.00 + ( hour('2019-11-30'||' 23:59:59')*60 + minute('2019-11-30'||' 23:59:59') - hour(?||' 00:00:00')*60 - minute(?||' 00:00:00') )/60.00/24.00 else  (days('2019-11-30'||' 23:59:59')/1.00 - days(date(cast( mae.hiscamfec as varchar(10))|| ' '|| mae.hiscamhor))/1.00)/1.00 + (hour('2019-11-30'||' 23:59:59')*60 + minute('2019-11-30'||' 23:59:59') - hour(cast( mae.hiscamfec as varchar(10))|| ' '|| mae.hiscamhor)*60-minute(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor) )/60.00/24.00 end else case when mae.hiscamfec < ? then (days( '2019-11-01' ||' 00:00:00') / 1.00 - days( date ( cast (mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor))/1.00)/1.00 + (hour (?||' 00:00:00')*60 + minute(?||' 00:00:00') - hour(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor)*60 - minute(cast (mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor) )/60.00/24.00 else (days(date(cast( mae2.hiscamfec as varchar(10))|| ' '|| mae2.hiscamhor))/1.00-days(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)/1.00)/1.00+(hour(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor)*60+minute(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor) - hour(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)*60-minute(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor) )/60.00/24.00 end end from hosvital.maepab11 mae2 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv>mae.hiscamctv and mae2.hiscamctv=(select min (x.hiscamctv) from hosvital.maepab11 x where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv>mae.hiscamctv)),3) as numeric(10,3))/1.00 as duracion,case when i.ingfecadm>= ?||' 00:00:00' and i.ingfecadm<= '2019-11-30'||' 23:59:59' then 0 else 1 end as ingreso_real, case when i.ingfecegr>= ?||' 00:00:00' and i.ingfecegr<= '2019-11-30'||' 23:59:59' then 0 else 1 end as egreso_real from hosvital.ingresos i inner join hosvital.maepab m on (m.mpcodp=i.mpcodp and m.mpclapro=2 ) inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu) inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc ) 
where (i.ingfecadm<= '2019-11-30'||' 23:59:59' ) and i.mpcodp = m.mpcodp and mae.hiscamedo ='O' and mae.hiscamfec >= ? and mae.hiscamfec<=? and (i.mptdoc,i.mpcedu,i.ingcsc) in (select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >=?) order by 1;

/* PACIENTES CON PROBLEMAS  VIENEN DEL MES ANTERIOR Y SALEN EN EL MES */

-- Para Noviembre

/* CEDULAS:  9514073
Paciente 93348510 muchos problema 
pACIENTE  68144

*/



-- El mismo query pero al dercho

select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamfec <  '2019-11-01' then  '2019-11-01 00:00:00' else  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
(select case when  mae2.hiscamfec>'2019-11-30'  then '2019-11-30 23:59:59'  else cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
							           from hosvital.maepab11 x
							          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )

) as Fecha_liberacion,
(
select case when  mae2.hiscamfec>'2019-11-30'  then
 -- '2019-11-30 23:59:59'  
case when mae.hiscamfec <  '2019-11-01' then
--  '2019-11-01 00:00:00' 
 (days('2019-11-30 23:59:59')/1.00 -   days('2019-11-01 00:00:00')/1.00)/1.00  + (   hour('2019-11-30 23:59:59')*60 + minute('2019-11-30 23:59:59') - hour('2019-11-01 00:00:00')*60 - minute('2019-11-01 00:00:00') )/60.00/24.00
else  
--cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
 (days('2019-11-30 23:59:59')/1.00 -   days(date(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor))/1.00)/1.00  + (   hour('2019-11-30 23:59:59')*60 + minute('2019-11-30 23:59:59') - hour(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor)*60 - minute(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor) )/60.00/24.00
-- (days('2019-11-30 23:59:59')/1.00 -   days('2019-11-01 09:56:43')/1.00)/1.00 +(   hour('2019-11-30 23:59:59')*60 + minute('2019-11-30 23:59:59') - hour('2019-11-01 09:56:43')*60 - minute('2019-11-01 09:56:43') )/60.00/24.00
end
else 
--cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor
case when mae.hiscamfec <  '2019-11-01' then
--  '2019-11-01 00:00:00' 
 (days('2019-11-01 00:00:00')/1.00 -   days(date(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor))/1.00)/1.00  + (   hour('2019-11-01 00:00:00')*60 + minute('2019-11-01 00:00:00') - hour(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor) )/60.00/24.00

else
 (days(date(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor))/1.00 -   days(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)/1.00)/1.00 + (   hour(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor)*60 + minute(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor) - hour(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)*60 - minute(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor) )/60.00/24.00

end
 end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
											           from hosvital.maepab11 x
										          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )


)  duracion,
case when i.ingfecadm>= '2019-11-01 00:00:00'  and i.ingfecadm<= '2019-11-30 23:59:59' then 0 else 1 end as ingreso_real,
case when i.ingfecegr>= '2019-11-01 00:00:00'  and i.ingfecegr<= '2019-11-30 23:59:59' then 0 else 1 end as egreso_real

from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc  and mae.mpcodp=m.mpcodp)
where  i.mpcedu= '2657245'  and (i.ingfecadm<= '2019-11-30 23:59:59' )   -- and i.mpcodp = m.mpcodp 
 and mae.hiscamedo ='O'   -- and  mae.hiscamfec  >= '2019-11-01'
 and mae.hiscamfec <= '2019-11-30' and (i.mptdoc,i.mpcedu,i.ingcsc) in
(select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >='2019-11-01' )
order by 1;

-- 5770765 no tien fecha de lib
-- 20277770  muchosm registros
-- 2657245  tiene dos registros de ocupacion

select * from hosvital.maepab11 where mpcedu = '2657245' order by hiscamfec;


