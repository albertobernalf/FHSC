SELECT fct.MPNFAC,  EMP.MECNTR, EMP.MENOMB, fct.MATOTF AS TOTAL_FACTURA, fct.MAVALS AS VALOR_SUBSIDIADO, fct.MAVAPU AS VALOR_PAGO_USUARIO, fct.MAVNPU AS VAOR_NO_PAGADO_USUARIO, fct.FACFCH AS FECHA_FACTURA, CASE fct.MAESTF WHEN  7 THEN  'GLOSADA_SIN_RADICAR' when 0 THEN 'FACTURADA' WHEN 1 THEN 'ANULADA_SIN_CNT' WHEN 2 THEN 'RADICADA' WHEN 3 THEN 'GLOSADA' WHEN 4 THEN 'SIN_RADICAR' WHEN 10 THEN 'ANULADA_CNT' ELSE 'SIN_FACTURAR' END AS ESTADO_FACTURA, rd.aglfrdfac as fecha_radicacion 
FROM HOSVITAL.MAEATE as fct 
INNER JOIN  HOSVITAL.MAEEMP AS EMP ON (EMP.MENNIT = fct.MPMENI) 
inner join hosvital.admglo11 as rd on  (rd.mpnfac = fct.MPNFAC )
 WHERE rd.aglfrdfac BETWEEN '2019-07-01' AND '2019-08-20';

-------------------- Consulta nueva ----------
select * from  hosvital.admglo11;
select * from  hosvital.admglo01;
select * from  hosvital.maeemp;
select * from hosvital.maeate;

/*
select emp.mecntr, emp.menomb,
(select sum(m1.mavals)
 from hosvital.maeate m1
 where 
 where 

FROM HOSVITAL.MAEATE as m 
INNER JOIN  HOSVITAL.MAEEMP AS EMP ON (EMP.MENNIT = m.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = fct.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE adm2.aglfrdfac BETWEEN '2019-07-01' AND '2019-08-20' and substring(emp.mecntr,1,9) in ('900298372','830003564','900156264')
group by emp.mecntr, emp.menomb;
*/

select   distinct substring(emp1.mecntr,1,9) as nit,
case when substring(emp1.mecntr,1,9) = '900156264' then 'NUEVA EPS'  when substring(emp1.mecntr,1,9) =	'900298372'  then	'CAPITAL SALUD'  when substring(emp1.mecntr,1,9) =	'830003564'  then	'FAMISANAR'  when substring(emp1.mecntr,1,9) =	'800130907' then	'SALUD TOTAL'   when substring(emp1.mecntr,1,9) =	'901127521'  then	'SERVISALUD SAN JOSE'
 when substring(emp1.mecntr,1,9) =	'900519354'  then	'UNION TEMPORAL ORIENTAL REGION 5'  when substring(emp1.mecntr,1,9) =	'901126938' then	 'UNION TEMPORA REDVITAL'
 when substring(emp1.mecntr,1,9) =	'901127065' then	 'UNION TEMPORAL TOLIHUILA'  when substring(emp1.mecntr,1,9) =	'901153500' then 	'UNION TEMPORAL MEDISALUD'
 when substring(emp1.mecntr,1,9) =	'800246953' then	 'FONDO FINANCIERO DISTRITAL'  when substring(emp1.mecntr,1,9) =	'813005431' then 	'EMCOSALUD'
 when substring(emp1.mecntr,1,9) =	'901037916' then 	'ADRES'  when substring(emp1.mecntr,1,9) =	'830079672' then 	'FISALUD'
 when substring(emp1.mecntr,1,9) =	'800162035' then 	'SERVIMEDICOS'  when substring(emp1.mecntr,1,9) =	'800251440' then 	'SANITAS' end as empresa,
(select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and m1.facfch >= '2019-08-01' and m1.facfch <= '2019-08-31') as facturado,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as procedimientos_egresos_sin_facturar,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as suministros_egresos_sin_facturar,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000' or i.inginslc='N')) as procedimientos_sin_egreso,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000' or i.inginslc='N')) as suministros_sin_egreso,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc <= '2019-07-31' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and m3.facfch >= '2019-01-01' and  m3.facfch <= '2019-07-31') as radic_efec_mes_ant,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2' and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-08-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and m3.facfch >= '2019-08-01' and  m3.facfch <= '2019-08-31') as radic_efec_mes_actual,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and m3.facfch >= '2019-01-01' and  m3.facfch <= '2019-07-31') as pendiente_radic_mes_ant,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC and adm1.aglfacdev <> 'S'  )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4')  and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and m3.facfch >= '2019-08-01' and  m3.facfch <= '2019-08-31') as pendiente_radic_mes_actual
FROM hosvital.maeemp emp1
WHERE  substring(emp1.mecntr,1,9) in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440');


------------------------------------------
-- El query para el total
------------------------------------------


select   'Otros',
(select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and substring(emp1.mecntr,1,9)  not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440') and m1.facfch >= '2019-08-01' and m1.facfch <= '2019-08-31') as facturado,

(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as procedimientos_egresos_sin_facturar,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as suministros_egresos_sin_facturar,

(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000' or i.inginslc='N')) as procedimientos_sin_egreso,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000' or i.inginslc='N')) as suministros_sin_egreso,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc <= '2019-07-31' and    substring(emp2.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and m3.facfch >= '2019-01-01' and  m3.facfch <= '2019-07-31') as radic_efec_mes_ant,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2' and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-08-01' and    substring(emp2.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440') and m3.facfch >= '2019-08-01' and  m3.facfch <= '2019-08-31') as radic_efec_mes_actual,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440') and m3.facfch >= '2019-01-01' and  m3.facfch <= '2019-07-31') as pendiente_radic_mes_ant,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC and adm1.aglfacdev <> 'S'  )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4')  and    substring(emp2.mecntr,1,9) not in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440')  and m3.facfch >= '2019-08-01' and  m3.facfch <= '2019-08-31') as pendiente_radic_mes_actual
FROM hosvital.maeemp emp1
WHERE  substring(emp1.mecntr,1,9) in ('800');


select * FROM hosvital.maeemp ; --where mennit =  '90'  order by mennit ;

-- Ultima version de la Consulta
---------------------------------------
---------------------------------------
---------------------------------------


select   distinct substring(emp1.mecntr,1,9) as nit,
case when substring(emp1.mecntr,1,9) = '900156264' then 'NUEVA EPS'  when substring(emp1.mecntr,1,9) =	'900298372'  then	'CAPITAL SALUD'  when substring(emp1.mecntr,1,9) =	'830003564'  then	'FAMISANAR'  when substring(emp1.mecntr,1,9) = '800130907'   then	'SALUD TOTAL'  when substring(emp1.mecntr,1,9) = '900372442'   then	'SALUD TOTAL regimen subsidiado'   when substring(emp1.mecntr,1,9) =	'901127521'  then	'SERVISALUD SAN JOSE'
 when substring(emp1.mecntr,1,9) =	'900519354'  then	'UNION TEMPORAL ORIENTAL REGION 5'  when substring(emp1.mecntr,1,9) =	'901126938' then	 'UNION TEMPORA REDVITAL'
 when substring(emp1.mecntr,1,9) =	'901127065' then	 'UNION TEMPORAL TOLIHUILA'  when substring(emp1.mecntr,1,9) =	'901153500' then 	'UNION TEMPORAL MEDISALUD'
 when substring(emp1.mecntr,1,9) =	'800246953' then	 'FONDO FINANCIERO DISTRITAL'  when substring(emp1.mecntr,1,9) =	'813005431' then 	'EMCOSALUD'
 when substring(emp1.mecntr,1,9) =	'901037916' then 	'ADRES'  when substring(emp1.mecntr,1,9) =	'830079672' then 	'FISALUD'
 when substring(emp1.mecntr,1,9) =	'800162035' then 	'SERVIMEDICOS'  when substring(emp1.mecntr,1,9) =	'800251440' then 	'SANITAS' end as empresa,
(select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and year(m1.facfch)=2019 and month(m1.facfch) =9) as facturado,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and year(t1.tffchp) =2019 and month(t1.tffchp) = 9 and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' )) as procedimientos_egresos_sin_facturar,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and year(t2.tffcsu) = 2019 and month(t2.tffcsu) = 9 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' )) as suministros_egresos_sin_facturar,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and year(t1.tffchp) =2019 and month(t1.tffchp) = 9  and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> '')) as procedimientos_sin_egreso,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE substring(emp1.mecntr,1,9) = substring(emp.mecntr,1,9) and year(t2.tffcsu) = 2019 and month(t2.tffcsu) = 9 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> '')) as suministros_sin_egreso,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and  substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =1 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_enero,


( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =2 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_febrero,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =3 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_marzo,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =4 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_Abril,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =5 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_mayo,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =6 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_junio,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =7 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_julio,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =8 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_agosto,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =9 ) as radic_efec_mes_ant_septiembre,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =10 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_octubre,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =11 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_noviembre,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =12 and  month(m3.facfch) <> 9) as radic_efec_mes_ant_diciembre,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2' and  m3.maestf not in ('1','10') and adm2.aglradfc >= '2019-09-01' and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and  month(m3.facfch)  =9) as radic_efec_mes_actual,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=1  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Enero,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=2  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Febrero,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=3  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Marzo,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=4  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Abril,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=5  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Mayo,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=6  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Junio,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=7  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Julio,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=8  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Agosto,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=9  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Septiembre,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=10  and  month(m3.facfch) <> 9)  as pendiente_radic_mes_ant_Octubre,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=11  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Noviembre,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch)=12  and  month(m3.facfch) <> 9) as pendiente_radic_mes_ant_Diciembre,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC and adm1.aglfacdev <> 'S'  )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4')  and    substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and  month(m3.facfch)  = 9) as pendiente_radic_mes_actual
FROM hosvital.maeemp emp1
WHERE  substring(emp1.mecntr,1,9) in ('900372442','900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440');

