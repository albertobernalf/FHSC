

select   distinct substring(emp1.mecntr,1,9) as nit, e.empdsc  as empresa,
(select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and emp1.mecntr = emp.mecntr and m1.facfch >= '2019-08-01' and m1.facfch <= '2019-08-31') as facturado,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as procedimientos_egresos_sin_facturar,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' or i.inginslc='S')) as suministros_egresos_sin_facturar,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and t1.tffchp >= '2019-08-01 00:00:00' and t1.tffchp <= '2019-08-31 23:59:59' and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000' or i.inginslc='N')) as procedimientos_sin_egreso,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and t2.tffcsu >= '2019-08-01 00:00:00' and t2.tffcsu <= '2019-08-31 23:59:59' and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
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
case 
when substring(emp1.mecntr,1,9) = '900156264' then 'NUEVA EPS' 
 when substring(emp1.mecntr,1,9) = '900298372'  then	'CAPITAL SALUD'  
when substring(emp1.mecntr,1,9) = '830003564'  then	'FAMISANAR'  
when substring(emp1.mecntr,1,9) = '800130907'   then	'SALUD TOTAL' 
when substring(emp1.mecntr,1,9) = '901127521'  then	'SERVISALUD SAN JOSE'
 when substring(emp1.mecntr,1,9) = '900519354'  then	'UNION TEMPORAL ORIENTAL REGION 5'  
when substring(emp1.mecntr,1,9) = '901126938' then	 'UNION TEMPORA REDVITAL'
 when substring(emp1.mecntr,1,9) = '901127065' then	 'UNION TEMPORAL TOLIHUILA'  
when substring(emp1.mecntr,1,9) = '901153500' then 	'UNION TEMPORAL MEDISALUD'
 when substring(emp1.mecntr,1,9) = '800246953' then	 'FONDO FINANCIERO DISTRITAL'  
when substring(emp1.mecntr,1,9) ='813005431' then 	'EMCOSALUD'
 when substring(emp1.mecntr,1,9) = '901037916' then 	'ADRES'  
when substring(emp1.mecntr,1,9) = '830079672' then 	'FISALUD'
 when substring(emp1.mecntr,1,9) = '800162035' then 	'SERVIMEDICOS' 
 when substring(emp1.mecntr,1,9) ='800251440' then 	'SANITAS' end as empresa,
(select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and emp1.mecntr = emp.mecntr and year(m1.facfch)=2019 and month(m1.facfch) =10) as facturado,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and year(t1.tffchp) =2019 and month(t1.tffchp) = 10 and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' )) as procedimientos_egresos_sin_facturar,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and year(t2.tffcsu) = 2019 and month(t2.tffcsu) =10 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' )) as suministros_egresos_sin_facturar,
(select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and year(t1.tffchp) =2019 and month(t1.tffchp) =10   and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> '')) as procedimientos_sin_egreso,
(select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and year(t2.tffcsu) = 2019 and month(t2.tffcsu) = 10 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> '')) as suministros_sin_egreso,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and year(adm2.aglradfc)=2019 and month(adm2.aglradfc)=10  and  substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) <10 ) as radic_efec_meses_anterirores,
( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10','0','4') and year(adm2.aglradfc)=2019 and month(adm2.aglradfc)=10  and  substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch)=2019 and month(m3.facfch) =10 )  as radic_efec_mes_actual,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch) <10  ) as pendiente_radic_mes_anteriores,

( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and     substring(emp2.mecntr,1,9) = substring(emp1.mecntr,1,9) and year(m3.facfch) =2019 and month(m3.facfch) =10  ) as pendiente_radic_mes_actual
FROM hosvital.maeemp emp1
WHERE  substring(emp1.mecntr,1,9) in ('900298372','830003564','900156264','800130907','901127521','900519354','901126938','901127065','901153500','800246953','813005431','901037916','830079672','800162035','800251440');


-- Ultima version con la empresa

select    emp1.mecntr as nit, emp1.empdsc as empresa,
sum((select sum(m1.mavals)  total
 FROM hosvital.maeate  m1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = m1.MPMENI) 
 WHERE m1.matipdoc='2'  and  m1.maestf not in ('1','10') and emp1.mecntr = emp.mecntr and year(m1.facfch)=2019 and month(m1.facfch) =10)) as facturado,
sum((select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and year(t1.tffchp) =2019 and month(t1.tffchp) = 10 and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' ))) as procedimientos_egresos_sin_facturar,
sum((select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and year(t2.tffcsu) = 2019 and month(t2.tffcsu) =10 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr !='0001-01-01 00:00:00.00000' ))) as suministros_egresos_sin_facturar,
sum((select sum(t1.tfvatp)
 FROM hosvital.tmpfac1  t1 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t1.tfnitp) 
 WHERE emp1.mecntr = emp.mecntr and year(t1.tffchp) =2019 and month(t1.tffchp) =10   and  t1.tfptpotrn  = 'F' and t1.tfestaanu1 <>'S' and 
(t1.tftdoc,t1.tfcedu, t1.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> ''))) as procedimientos_sin_egreso,
sum((select sum(t2.tfvats)
 FROM hosvital.tmpfac2  t2 
 inner join hosvital.maeemp emp ON (emp.MENNIT = t2.tfnits) 
 WHERE emp1.mecntr = emp.mecntr and year(t2.tffcsu) = 2019 and month(t2.tffcsu) = 10 and  t2.tfstpotrn  = 'F' and t2.tfestaanu2 <>'S' and 
(t2.tftdoc,t2.tfcedu, t2.tmctving)  in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos i where i.ingfecegr ='0001-01-01 00:00:00.00000'  and i.mpnumc <> ''))) as suministros_sin_egreso,

sum(( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10') and year(adm2.aglradfc)=2019 and month(adm2.aglradfc)=10  and  emp1.mecntr = emp2.mecntr and year(m3.facfch)=2019 and month(m3.facfch) <10 )) as radic_efec_meses_anterirores,
sum(( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
inner join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
inner join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf not in ('1','10','0','4') and year(adm2.aglradfc)=2019 and month(adm2.aglradfc)=10  and  emp1.mecntr = emp2.mecntr and year(m3.facfch)=2019 and month(m3.facfch) =10 ))  as radic_efec_mes_actual,
sum(( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and emp1.mecntr = emp2.mecntr  and year(m3.facfch) =2019 and month(m3.facfch) <10  )) as pendiente_radic_mes_anteriores,
sum(( select sum(m3.mavals)
FROM HOSVITAL.MAEATE  m3 
INNER JOIN  HOSVITAL.MAEEMP AS EMP2 ON (EMP2.MENNIT = m3.MPMENI) 
left join hosvital.admglo11 adm1 on  (adm1.mpnfac = m3.MPNFAC )
left join hosvital.admglo01 adm2 on (adm2.aglremnr = adm1.aglremnr)
WHERE m3.matipdoc='2'  and  m3.maestf  in ('0','4') and  emp1.mecntr = emp2.mecntr and year(m3.facfch) =2019 and month(m3.facfch) =10  )) as pendiente_radic_mes_actual
FROM hosvital.empress emp1
group by emp1.mecntr , emp1.empdsc
order by  emp1.empdsc ;


select * from hosvital.empress;
