
/*
Buena tarde, cordial saludo
mediante la presente, solicito una ayuda para tramitar reportes en excel con las siguientes características
0. Fecha de ingreso
1. datos paciente  , doc , cedula, nombres
1. Pacientes hospitalizados mayor a 6 días
2. Datos de identificación del paciente
3. Pabellón    actual
4. Cama     actual
5. Días de estancia a fecha ejecucion reporte
6. Análisis de la última valoración por médico especialista.   impresio ulrima evolucio medica   . campo analidsi

*/

select * from hosvital.hccom1des;
select   * from hosvital.hccom33;
select * from hosvital.maepab1;
select * from hosvital.maepab where mpclapro=2;

select * from  hosvital.maepab11 where mpcedu='1035417974' and hiscnsing=5;



-- Query  FInal.
-- Falta la Evolucion Analisis

select * from hosvital.hccom1des where hisckey='1035417974'  and hisdesatr='EVODESA';

select i.mptdoc  tipo_doc, i.mpcedu documento,i.ingcsc as ingreso, cap.mpnomc  paciente,i.ingfecadm,maepab.mpnomp  pabellon, m.mpnumc  cama, m.mpfchi fecha_ocupacion_cama,
(
select min(hiscamfec)  
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc) fecha_inicia_hospi,
(days(current_date)
-
(
select days(min(hiscamfec)  )
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)
) estancia,
(
select  hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc= i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec = (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey=hdes.hisckey  and hdes2.hisdesatr=hdes.hisdesatr)
) evolucion_analisis
from hosvital.maepab1  m
inner join hosvital.capbas cap on (cap.mptdoc =  m.mpudoc   and cap.mpcedu=m.mpuced)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu = cap.mpcedu and i.ingcsc = m.mpctvin)
inner join hosvital.maepab maepab on (maepab.mpcodp=i.mpcodp)
where -- i.mpcedu='1035417974' and
  (days(current_date) - days(m.mpfchi) )   > 6  and maepab.mpclapro=2;

-- Consulta especilizada
------------------------
------------------------



select i.mptdoc  tipo_doc, i.mpcedu documento,i.ingcsc as ingreso, cap.mpnomc  paciente,i.ingfecadm,maepab.mpnomp  pabellon, m.mpnumc  cama, m.mpfchi fecha_ocupacion_cama,
(
select min(hiscamfec)  
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc) fecha_inicia_hospi,
(days(current_date)
-
(
select days(min(hiscamfec)  )
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)
) estancia,
(
select  hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc= i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec = (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey=hdes.hisckey  and hdes2.hisdesatr=hdes.hisdesatr)
) evolucion_analisis
from hosvital.maepab1  m
inner join hosvital.capbas cap on (cap.mptdoc =  m.mpudoc   and cap.mpcedu=m.mpuced)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu = cap.mpcedu and i.ingcsc = m.mpctvin)
inner join hosvital.maepab maepab on (maepab.mpcodp=m.mpcodp)
where  (days(current_date) -
(
select days(min(hiscamfec)  )
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)
)   > 6  and maepab.mpclapro=2  ;


-- Consulta especilizada con el folio
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select i.mptdoc  tipo_doc, i.mpcedu documento,i.ingcsc as ingreso, cap.mpnomc  paciente,i.ingfecadm,maepab.mpnomp  pabellon, m.mpnumc  cama, m.mpfchi fecha_ocupacion_cama,
(
select min(hiscamfec)  
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc) fecha_inicia_hospi,
(days(current_date)
-
(
select days(min(hiscamfec)  )
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)
) estancia,
(
select  hiscsec from hosvital.hccom1des hdes where hdes.histipdoc= i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec = (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey=hdes.hisckey  and hdes2.hisdesatr=hdes.hisdesatr)
) folio,
(
select  hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc= i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec = (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey=hdes.hisckey  and hdes2.hisdesatr=hdes.hisdesatr)
) evolucion_analisis
from hosvital.maepab1  m
inner join hosvital.capbas cap on (cap.mptdoc =  m.mpudoc   and cap.mpcedu=m.mpuced)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu = cap.mpcedu and i.ingcsc = m.mpctvin)
inner join hosvital.maepab maepab on (maepab.mpcodp=m.mpcodp)
where  (days(current_date) -
(
select days(min(hiscamfec)  )
from hosvital.maepab11 m11
inner join hosvital.maepab  m on (m.mpcodp =  m11.mpcodp and m.mpclapro=2)
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)
)   > 6  and maepab.mpclapro=2 i.ingfecegr = '0001-01-01 00:00:00.00000'	 ;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ultima version 

select i.mptdoc  tipo_doc, i.mpcedu documento,i.ingcsc as ingreso, cap.mpnomc  paciente,i.ingfecadm,maepab.mpnomp  pabellon, m.mpnumc cama_actual,(select min(hiscamfec) from hosvital.maepab11 m11 inner join hosvital.maepab m on (m.mpcodp=m11.mpcodp and m.mpclapro=2) where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc) fecha_inicia_hospi,(days (current_date) - (select days(min(hiscamfec)) from hosvital.maepab11 m11 inner join hosvital.maepab m on (m.mpcodp=m11.mpcodp and m.mpclapro=2) where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc)) estancia,(select hiscsec from hosvital.hccom1des hdes where hdes.histipdoc= i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec = (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey=hdes.hisckey and hdes2.hisdesatr=hdes.hisdesatr)) folio,(select hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc=i.mptdoc and hdes.hisckey=i.mpcedu and hdes.hisdesatr='EVODESA' and hiscsec= (select max(hiscsec) from hosvital.hccom1des hdes2 where hdes2.histipdoc=hdes.histipdoc and hdes2.hisckey = hdes.hisckey and hdes2.hisdesatr=hdes.hisdesatr)) evolucion_analisis from hosvital.maepab1 m inner join hosvital.capbas cap on (cap.mptdoc=m.mpudoc and cap.mpcedu=m.mpuced) inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc=m.mpctvin) inner join hosvital.maepab maepab on (maepab.mpcodp=m.mpcodp)
 where (days (current_date) - (select days(min(hiscamfec)) from hosvital.maepab11 m11 inner join hosvital.maepab m on (m.mpcodp=m11.mpcodp and m.mpclapro=2) 
where m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc))>6 and maepab.mpclapro=2 and i.ingfecegr='0001-01-01 00:00:00.00000';
