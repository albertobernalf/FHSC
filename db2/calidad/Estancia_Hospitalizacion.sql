-- Hospitalizacion

-- ingreso real de octubre
-- egreso real deoctubre


-- pabellon, tipo_doc,doc, nombre paciente, nro_ingreso, fecha_ingreso, fecha_egreso_clinica,  dias_estancia, ingreso_real, egreso_real 

-- pabellon, # de  camas  delmes a calcular que tuvieron 



select * from hosvital.maepab;

select * from hosvital.ingresos where mpcedu= '80076726';

select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingfecadm, i.ingfecegr
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-10-01 00:00:00' and i.ingfecadm<= '2019-10-31 23:59:59' and i.mpcodp = m.mpcodp
order by cap.mpcedu;

-- 51610192       	
--20306463       	
--19148138       	
--20531095       	


select * from hosvital.maepab11 where  mpcedu in ( '4934360','24138043','39722197','17037892') order by  mpcedu, hiscnsing,hiscamfec, hiscamhor,mpnumc desc,hiscamedo ;

select * from hosvital.maepab11 where  mpcedu = '1013585067' ;  -- 1013619238     	

 order by  mpcedu, hiscnsing,hiscamfec, hiscamhor,mpnumc desc,hiscamedo ;


select * from hosvital.ingresos i, hosvital.maepab mae 
where mae.mpclapro  =  2 and i.mpcodp= mae.mpcodp and i.ingfecadm >= '2019-09-25 00:00:00' ;



select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-10-01 00:00:00' and i.ingfecadm<= '2019-10-31 23:59:59' and i.mpcodp = m.mpcodp
order by cap.mpcedu;


-- Dos querys
-- fomulapara restas

select (days('2019-10-04 15:56:43')/1.00 -   days('2019-10-01 09:56:43')/1.00)/1.00, hour('2019-10-04 15:56:43')*60 + minute('2019-10-04 15:56:43'), hour('2019-10-01 09:56:43')*60 + minute('2019-10-01 09:56:43'),
 (days('2019-10-04 15:56:43')/1.00 -   days('2019-10-01 09:56:43')/1.00)/1.00  - (           hour('2019-10-04 15:56:43')*60 + minute('2019-10-04 15:56:43') - hour('2019-10-01 09:56:43')*60 - minute('2019-10-01 09:56:43')      )/60.00/24.00
from hosvital.grupos1;



-- Primero antes y  durante el mes

--select * from hosvital.maepab11 where  mpcedu= '1000000332' order by  hiscnsing,hiscamfec, hiscamhor,mpnumc desc,hiscamedo ;


select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamfec <  '2019-10-01' then  '2019-10-01 00:00:00' else  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,

(select case when  mae2.hiscamfec>'2019-10-31'  then '2019-10-31 23:59:59'  else cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
											           from hosvital.maepab11 x
										          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )

) as Fecha_liberacion,

(
select case when  mae2.hiscamfec>'2019-10-31'  then
 -- '2019-10-31 23:59:59'  
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
else  
--cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
 (days('2019-10-31 23:59:59')/1.00 -   days(date(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor))/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor)*60 - minute(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor) )/60.00/24.00
-- (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 09:56:43')/1.00)/1.00 +(   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 09:56:43')*60 - minute('2019-10-01 09:56:43') )/60.00/24.00
end
else 
--cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-01 00:00:00')/1.00 -   days(date(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor))/1.00)/1.00  + (   hour('2019-10-01 00:00:00')*60 + minute('2019-10-01 00:00:00') - hour(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor) )/60.00/24.00

else
 (days(date(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor))/1.00 -   days(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)/1.00)/1.00 + (   hour(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor)*60 + minute(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor) - hour(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor) )/60.00/24.00

end
 end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
											           from hosvital.maepab11 x
										          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )


)  duracion

from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc )
where (i.ingfecadm<= '2019-10-31 23:59:59' )  and i.mpcodp = m.mpcodp  and mae.hiscamedo ='O'   and  mae.hiscamfec  >= '2019-10-01' and mae.hiscamfec <= '2019-10-31' and (i.mptdoc,i.mpcedu,i.ingcsc) in
(select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >='2019-10-01' )
order by 1;


--Tercero dentro del mes y hatsa despues


select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm,i.ingfecegr
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-10-01 00:00:00' and i.ingfecadm<= '2019-10-31 23:59:59' and i.mpcodp = m.mpcodp and i.mpcedu='1000000332'
order by cap.mpcedu;


select  (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00 + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
from hosvital.maepab;




--Tercero dentro del mes y hatsa despues


select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm,i.ingfecegr
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-10-01 00:00:00' and i.ingfecadm<= '2019-10-31 23:59:59' and i.mpcodp = m.mpcodp and i.mpcedu='1000000332'
order by cap.mpcedu;


select  (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00 + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
from hosvital.maepab;


--Tercero dentro del mes y hatsa despues


select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm,i.ingfecegr
from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-10-01 00:00:00' and i.ingfecadm<= '2019-10-31 23:59:59' and i.mpcodp = m.mpcodp and i.mpcedu='1000000332'
order by cap.mpcedu;


select  (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00 + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
from hosvital.maepab;


-- El mismo query pero al dercho

select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamfec <  '2019-10-01' then  '2019-10-01 00:00:00' else  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
(select case when  mae2.hiscamfec>'2019-10-31'  then '2019-10-31 23:59:59'  else cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
							           from hosvital.maepab11 x
							          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )

) as Fecha_liberacion,
(
select case when  mae2.hiscamfec>'2019-10-31'  then
 -- '2019-10-31 23:59:59'  
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
else  
--cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
 (days('2019-10-31 23:59:59')/1.00 -   days(date(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor))/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor)*60 - minute(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor) )/60.00/24.00
-- (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 09:56:43')/1.00)/1.00 +(   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 09:56:43')*60 - minute('2019-10-01 09:56:43') )/60.00/24.00
end
else 
--cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-01 00:00:00')/1.00 -   days(date(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor))/1.00)/1.00  + (   hour('2019-10-01 00:00:00')*60 + minute('2019-10-01 00:00:00') - hour(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor) )/60.00/24.00

else
 (days(date(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor))/1.00 -   days(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)/1.00)/1.00 + (   hour(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor)*60 + minute(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor) - hour(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)*60 - minute(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor) )/60.00/24.00

end
 end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
											           from hosvital.maepab11 x
										          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )


)  duracion,
case when i.ingfecadm>= '2019-10-01 00:00:00'  and i.ingfecadm<= '2019-10-31 23:59:59' then 0 else 1 end as ingreso_real,
case when i.ingfecegr>= '2019-10-01 00:00:00'  and i.ingfecegr<= '2019-10-31 23:59:59' then 0 else 1 end as egreso_real

from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc )
where (i.ingfecadm<= '2019-10-31 23:59:59' )  and i.mpcodp = m.mpcodp  and mae.hiscamedo ='O'   and  mae.hiscamfec  >= '2019-10-01' and mae.hiscamfec <= '2019-10-31' and (i.mptdoc,i.mpcedu,i.ingcsc) in
(select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >='2019-10-01' )
order by 1;

-- El query Acotado


select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamfec <  '2019-10-01' then  '2019-10-01'||' 00:00:00' else  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
(select case when  mae2.hiscamfec>'2019-10-31'  then '2019-10-31'||' 23:59:59'  else cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end
 from hosvital.maepab11 mae2  where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv) from hosvital.maepab11 x  where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv ) ) as Fecha_liberacion,
cast(round( (select case when  mae2.hiscamfec>'2019-10-31'  then case when mae.hiscamfec <  '2019-10-01' then  (days('2019-10-31'||' 23:59:59')/1.00 - days('2019-10-01'||' 00:00:00')/1.00)/1.00  + (   hour('2019-10-31'||' 23:59:59')*60 + minute('2019-10-31'||' 23:59:59') - hour('2019-10-01'||' 00:00:00')*60 - minute('2019-10-01'||' 00:00:00') )/60.00/24.00 else  (days('2019-10-31'||' 23:59:59')/1.00 -   days(date(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor))/1.00)/1.00  + (   hour('2019-10-31'||' 23:59:59')*60 + minute('2019-10-31'||' 23:59:59') - hour(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor)*60 - minute(cast( mae.hiscamfec as varchar(10))|| ' '||mae.hiscamhor) )/60.00/24.00 end else 
case when mae.hiscamfec <  '2019-10-01' then  (days('2019-10-01'||' 00:00:00')/1.00 -   days(date(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor))/1.00)/1.00  + (   hour('2019-10-01'||' 00:00:00')*60 + minute('2019-10-01'||' 00:00:00') - hour(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(10))||' '||mae2.hiscamhor) )/60.00/24.00 else 
 (days(date(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor))/1.00 -   days(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)/1.00)/1.00 + (   hour(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor)*60 + minute(cast( mae2.hiscamfec as varchar(10))|| ' '||mae2.hiscamhor) - hour(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor)*60 - minute(cast(mae.hiscamfec as varchar(10))||' '||mae.hiscamhor) )/60.00/24.00 end  end  from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv) from hosvital.maepab11 x  where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv ) ) ,3) as numeric(10,2))/1.00 duracion,
case when i.ingfecadm>= '2019-10-01'||' 00:00:00'  and i.ingfecadm<= '2019-10-31'||' 23:59:59' then 0 else 1 end as ingreso_real, case when i.ingfecegr>= '2019-10-01'||' 00:00:00'  and i.ingfecegr<= '2019-10-31'||' 23:59:59' then 0 else 1 end as egreso_real 
from hosvital.ingresos i inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 ) inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu) inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc ) where (i.ingfecadm<= '2019-10-31'||' 23:59:59' )  and i.mpcodp = m.mpcodp  and mae.hiscamedo ='O'   and  mae.hiscamfec  >= '2019-10-01' and mae.hiscamfec <= '2019-10-31' and  (i.mptdoc,i.mpcedu,i.ingcsc) in (select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >='2019-10-01' ) order by 1;




-----------------------------------------
-----------------------------------------
-------------------------------------------
-- Parece que no hay ninguna que cumpla que viene ingresado de meses anteriores y que no tengan movimiento en el mes
-----------------------------------------
-----------------------------------------
-----------------------------------------


-- Query para pacientes que viene de elmes anteriro y no tocan lamaepab11

select m.mpnomp, cap.mptdoc,cap.mpcedu,cap.mpnomc,i.ingcsc, i.ingfecadm ingreso_clinica,i.ingfecegr  egreso_clinica,mae.mpcodp,mae.mpnumc habitacion,
case when mae.hiscamfec <  '2019-10-01' then  '2019-10-01 00:00:00' else  cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,

(select case when  mae2.hiscamfec>'2019-10-31'  then '2019-10-31 23:59:59'  else cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)   from hosvital.maepab11 x      where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )

) as Fecha_liberacion,

(
select case when  mae2.hiscamfec>'2019-10-31'  then
 -- '2019-10-31 23:59:59'  
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 00:00:00')/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 00:00:00')*60 - minute('2019-10-01 00:00:00') )/60.00/24.00
else  
--cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor end fecha_ocupacion,
 (days('2019-10-31 23:59:59')/1.00 -   days(date(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor))/1.00)/1.00  + (   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor)*60 - minute(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor) )/60.00/24.00
-- (days('2019-10-31 23:59:59')/1.00 -   days('2019-10-01 09:56:43')/1.00)/1.00 +(   hour('2019-10-31 23:59:59')*60 + minute('2019-10-31 23:59:59') - hour('2019-10-01 09:56:43')*60 - minute('2019-10-01 09:56:43') )/60.00/24.00
end
else 
--cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor
case when mae.hiscamfec <  '2019-10-01' then
--  '2019-10-01 00:00:00' 
 (days('2019-10-01 00:00:00')/1.00 -   days(date(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor))/1.00)/1.00  + (   hour('2019-10-01 00:00:00')*60 + minute('2019-10-01 00:00:00') - hour(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor) )/60.00/24.00

else
 (days(date(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor))/1.00 -   days(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)/1.00)/1.00 + (   hour(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor)*60 + minute(cast( mae.hiscamfec as varchar(12))|| ' '||mae.hiscamhor) - hour(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor)*60 - minute(cast(mae2.hiscamfec as varchar(12))||' '||mae2.hiscamhor) )/60.00/24.00

end
 end
 from hosvital.maepab11 mae2
 where mae2.mptdoc=mae.mptdoc and mae2.mpcedu=mae.mpcedu and mae2.mpcodp=mae.mpcodp and mae2.mpnumc=mae.mpnumc and mae2.hiscamedo='L' and mae2.hiscamctv> mae.hiscamctv  and mae2.hiscamctv = (select min(x.hiscamctv)
											           from hosvital.maepab11 x
										          where x.mptdoc=mae.mptdoc and x.mpcedu=mae.mpcedu and 	x.mpcodp=mae.mpcodp and x.mpnumc=mae.mpnumc and x.hiscamedo='L' and x.hiscamctv  >  mae.hiscamctv )


)  duracion

from hosvital.ingresos i
inner join hosvital.maepab  m on (m.mpcodp=i.mpcodp and m.mpclapro=2 )
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 mae on (mae.mptdoc=i.mptdoc and mae.mpcedu=i.mpcedu and mae.hiscnsing=i.ingcsc )
where (i.ingfecadm< '2019-10-01 23:59:59'  and i.ingfecegr  = '0001-01-01 00:00:00') and i.mpcodp=m.mpcodp and mae.hiscamedo ='O' and mae.hiscamfec  < '2019-10-01' and (i.mptdoc,i.mpcedu,i.ingcsc)  not in
(select y.mptdoc,y.mpcedu,y.hiscnsing from hosvital.maepab11 y where y.hiscamfec >='2019-10-01' ) and
 (i.mptdoc,i.mpcedu,i.ingcsc) in (select  x.mpudoc, x.mpuced, x.mpctvin from hosvital.maepab1 x)
order by 1;



select * from hosvital.tmpfac;
select * from hosvital.maepab1 order by mpnumc;