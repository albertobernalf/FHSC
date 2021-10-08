/*
Número de Factura.
Organizar los grupos etarios de la siguiente manera:
De 0 a antes de 1 año
De 01 a 04 años
De 05 a 14 años
De 15 a 18 años
De 19 a 44 años
De 45 a 49 años
De 50 a 54 años
De 55 a 59 años
De 60 a 64 años
De 65 a 69 años
De 70 a 74 años
De 75 años o más

case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 < 1 then 'Antes de 1 Año' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 1 and (days (i.ingfecadm) - days(c.mpfchn))/365 <4 then 'De 01 a 04 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >=5 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=14 then 'De 05 a 14 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 15 and (days(i.ingfecadm) - days (c.mpfchn))/365 < 18 then 'De 15 a 18 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 19 and (days(i.ingfecadm) - days (c.mpfchn))/365 < 44 then 'De 19 a 44 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 45  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 49 then 'De 45 a 49 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 50  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 54 then 'De 50 a 54 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 55  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 59 then 'De 55 a 59 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 64 then 'De 60 a 64 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 65  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 69 then 'De 65 a 69 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 70  and (days(i.ingfecadm) - days (c.mpfchn))/365 < 74 then 'De 70 a 74 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 75 then De 75 años o más' end etareo
 

Revisar la Localidad, pues están llegando nombres también de municipios que no son de las localidades de Bogotá.
Código de Honorario
Nombre de Honorario
Nombre del profesional que realizó el procedimiento.


*/
select * from hosvital.maedmb;  -- Depto
select * from hosvital.maedmb1;
select * from hosvital.maedmb2;

select m.mdcodd, m.mdnomd,m1.mdcodm,m1.mdnomm,m2.mdcodb,m2.mdnomb

from hosvital.maedmb m
inner join hosvital.maedmb1 m1 on (m1.mdcodd=m.mdcodd)
inner join  hosvital.maedmb2 m2 on (m2.mdcodd = m1.mdcodd and  m2.mdcodm= m1.mdcodm)
order by m.mdcodd,m1.mdcodm;





-- inicial

select i.mptdoc tipo_doc ,i.mpcedu documento, i.ingcsc num_ingreso,c.mpnom1 nombre1,c.mpnom2 nombre2, c.mpape1 apellido1, c.mpape2 apellido2 , (days(i.ingfecadm) - days(c.mpfchn))/365 edad ,case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 5 then 'Primera Infancia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 6 and (days (i.ingfecadm) - days(c.mpfchn))/365 <= 11 then 'Infancia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >=12 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=18 then 'Adolescencia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 14 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 26 then 'Juventud' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 27 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 59 then 'Adultez' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60 then 'Persona Mayor' end etareo,c.mpsexo as genero, day(m2.mafepr) as dia_atencion, month(m2.mafepr) as mes_atencion, year(m2.mafepr) as ano_atencion, d.mdnomd nombre_dpto, d1.mdnomm nombre_ciudad,d2.mdnomb barrio, i.ingentdx as cie_ingreso,dia.dmnomb dx_ingreso,i.ingdxsal1 cie_salida,dia2.dmnomb dx_egreso,case when i.clapro='1' then 'Ambulatorio' when i.clapro='2' then 'Hospitalizado' when i.clapro = '3' then 'Urgencias' when i.clapro='5' then 'Urgencias' end ambito, mae.menomb as convenio, maetpa2.mtudes Regimen_convenio , esp.menome as especialidad, m2.prcodi codigo_proc, proc.prnomb as procedimiento, cen.cncdsc as costo,m2.mavatp as valor from hosvital.ingresos i inner join hosvital.maeate m on (m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving=i.ingcsc and m.maestf not in ('1','10')) inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup <> 'S' and m2.matipdoc in ('2','5')) inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni) inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) inner join hosvital.maepro proc on (proc.prcodi= m2.prcodi) left join hosvital.maeesp esp on (esp.mecode=m2.mecomm) inner join hosvital.maedmb d on (d.mdcodd= c.mdcodd) inner join hosvital.maedmb1 d1 on (d1.mdcodd= c.mdcodd and d1.mdcodm=c.mdcodm) inner join hosvital.maedmb2 d2 on (d2.mdcodd= c.mdcodd and d2.mdcodm=c.mdcodm and d2.mdcodb = c.mdcodb) left join hosvital.maedia dia on (dia.dmcodi= i.ingentdx) left join hosvital.maedia dia2 on (dia2.dmcodi= i.ingdxsal1) inner join hosvital.cencost cen on (cen.cnccod= m2.fcpcodscc) inner join hosvital.maepac maepac on (maepac.mptdoc = m.mptdoc and maepac.mpcedu = m.mpcedu and maepac.mennit= mae.mennit) inner join hosvital.maetpa2 maetpa2 on (maetpa2.mtucod =maepac.mtucod) where i.ingfecadm>='2020-10-01 00:00:00' and i.ingfecadm<= '2020-10-31 00:00:00' and c.mpcedu='1033724215' order by m.mpcedu


-- query Final


select i.mptdoc tipo_doc ,i.mpcedu documento, i.ingcsc num_ingreso,c.mpnom1 nombre1,c.mpnom2 nombre2, c.mpape1 apellido1, c.mpape2 apellido2 , (days(i.ingfecadm) - days(c.mpfchn))/365 edad ,m.mpnfac as factura,
case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 < 1 then 'Antes de 1 Año' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 1 and (days (i.ingfecadm) - days(c.mpfchn))/365 <4 then 'De 01 a 04 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >=5 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=14 then 'De 05 a 14 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 15 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 18 then 'De 15 a 18 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 19 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 44 then 'De 19 a 44 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 45  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 49 then 'De 45 a 49 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 50  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 54 then 'De 50 a 54 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 55  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 59 then 'De 55 a 59 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 64 then 'De 60 a 64 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 65  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 69 then 'De 65 a 69 años' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 70  and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 74 then 'De 70 a 74 años'  when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 75 then 'De 75 años o más' end etareo,c.mpsexo as genero, day(m2.mafepr) as dia_atencion, month(m2.mafepr) as mes_atencion, year(m2.mafepr) as ano_atencion, d.mdnomd nombre_dpto, d1.mdnomm nombre_ciudad,d2.mdnomb barrio, i.ingentdx as cie_ingreso,dia.dmnomb dx_ingreso,i.ingdxsal1 cie_salida,dia2.dmnomb dx_egreso,case when i.clapro='1' then 'Ambulatorio' when i.clapro='2' then 'Hospitalizado' when i.clapro = '3' then 'Urgencias' when i.clapro='5' then 'Urgencias' end ambito, mae.menomb as convenio, maetpa2.mtudes Regimen_convenio , esp.menome as especialidad, m2.prcodi codigo_proc, proc.prnomb as procedimiento, cen.cncdsc as costo, m2.mahoncod as cod_honorario, h.hnrdsc as nombre_honorario,maemed1.mmnomm as medico,   m2.mavatp as valor from hosvital.ingresos i inner join hosvital.maeate m on (m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving=i.ingcsc and m.maestf not in ('1','10')) inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup <> 'S' and m2.matipdoc in ('2','5')) left join hosvital.honrios h on (h.hnrcod = m2.mahoncod) left  join hosvital.maemed1 maemed1 on (maemed1.mmcodm = m2.mmcodm) inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni) inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) inner join hosvital.maepro proc on (proc.prcodi= m2.prcodi) left join hosvital.maeesp esp on (esp.mecode=m2.mecomm) inner join hosvital.maedmb d on (d.mdcodd= c.mdcodd) inner join hosvital.maedmb1 d1 on (d1.mdcodd= d.mdcodd and d1.mdcodm=c.mdcodm) inner join hosvital.maedmb2 d2 on (d2.mdcodd = d1.mdcodd and d2.mdcodm = d1.mdcodm and d2.mdcodd= c.mdcodd and d2.mdcodm=c.mdcodm and d2.mdcodb = c.mdcodb) left join hosvital.maedia dia on (dia.dmcodi= i.ingentdx) left join hosvital.maedia dia2 on (dia2.dmcodi= i.ingdxsal1) inner join hosvital.cencost cen on (cen.cnccod= m2.fcpcodscc) inner join hosvital.maepac maepac on (maepac.mptdoc = m.mptdoc and maepac.mpcedu = m.mpcedu and maepac.mennit= mae.mennit) inner join hosvital.maetpa2 maetpa2 on (maetpa2.mtucod =maepac.mtucod) where i.ingfecadm>='2020-10-01 00:00:00' and i.ingfecadm<= '2020-10-31 00:00:00' and c.mpcedu='1033724215' order by m.mpcedu;
