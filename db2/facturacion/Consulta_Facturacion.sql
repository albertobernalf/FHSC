/*
Número de Ingreso
Tipo de Identificación.
Número de Identificación.
Nombres.
Apellidos.
Edad en Años.
Grupo Etáreo salud pública.
Sexo.
Día de Atención
Mes de Atención
Año de Atención
Ciudad
Localidad
Barrio
Código CIE 10 Diagnostico de Ingreso
Diagnóstico de Ingreso
Código CIE 10 Diagnostico de Egreso
Diagnóstico de Egreso
Ámbito (Ambulatorio, Hospitalario, Urgencias)
Convenio
Régimen Convenio
Código especialidad
Especialidad Profesional
Subespecialidad Profesional
Código CUPS  del Procedimiento
Nombre del Procedimiento
Centro de Costo
Valor Facturado

*/

select i.mptdoc tipo_doc ,i.mpcedu documento, i.ingcsc num_ingreso, c.mpnom1 nombre1 , c.mpnom2 nombre2, c.mpape1 apellido1, c.mpape2 apellido2 , (days(i.ingfecadm) - days(c.mpfchn))/365 edad ,

case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 5 then 'Primera Infancia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 6 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 11 then 'Infancia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 12 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=18 then 'Adolescencia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 14 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 26 then 'Juventud'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 27 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 59 then 'Adultez'
when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60 then 'Persona Mayor' end etareo,

c.mpsexo as genero, day(m2.mafepr) as dia_atencion,
month(m2.mafepr) as mes_atencion, year(m2.mafepr) as ano_atencion, d.mdnomd nombre_dpto, d1.mdnomm nombre_ciudad,d2.mdnomb barrio,
i.ingentdx as cie_ingreso,dia.dmnomb dx_ingreso,i.ingdxsal1 cie_salida,dia2.dmnomb dx_egreso,case when i.clapro='1' then 'Ambulatorio'  when i.clapro='2' then 'Hospitalizado'  when i.clapro='3' then 'Urgencias'   when i.clapro='5' then 'Urgencias'  end ambito,
mae.menomb as convenio, maetpa2.mtudes Regimen_convenio , esp.menome as especialidad,
m2.prcodi  codigo_proc, proc.prnomb as procedimiento, cen.cncdsc as costo,m2.mavatp as valor
from hosvital.ingresos i
inner join hosvital.maeate m on (m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving=i.ingcsc and m.maestf not in ('1','10'))
inner join hosvital.maeate2 m2 on (m2.mpnfac = m.mpnfac and m2.fcptpotrn='F' and m2.maesanup <> 'S' and m2.matipdoc in ('2','5'))
inner join hosvital.maeemp mae on (mae.mennit = m.mpmeni)
inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu)
inner join hosvital.maepro proc on (proc.prcodi= m2.prcodi)
left join hosvital.maeesp esp on (esp.mecode=m2.mecomm)
inner join hosvital.maedmb d on (d.mdcodd= c.mdcodd)
inner join hosvital.maedmb1 d1 on (d1.mdcodd= c.mdcodd and d1.mdcodm = c.mdcodm)
inner join hosvital.maedmb2 d2 on (d2.mdcodd= c.mdcodd and d2.mdcodm = c.mdcodm and d2.mdcodb = c.mdcodb )
left join hosvital.maedia dia on (dia.dmcodi= i.ingentdx)
left  join hosvital.maedia dia2 on (dia2.dmcodi= i.ingdxsal1)
inner  join hosvital.cencost cen on (cen.cnccod  = m2.fcpcodscc)
inner join hosvital.maepac maepac on (maepac.mptdoc = m.mptdoc and maepac.mpcedu = m.mpcedu and maepac.mennit= mae.mennit    )
inner join hosvital.maetpa2 maetpa2 on (maetpa2.mtucod =maepac.mtucod )
where i.ingfecadm>= '2020-01-17 00:00:00' and i.ingfecadm <= '2020-01-31 23:59:59' 
order by m.mpcedu;



select * from hosvital.ingresos where mpcedu='51687052';

select * from hosvital.maeate;
select * from hosvital.maetpa2;
select * from hosvital.maepac; -- mtucod
select * from hosvital.cencost;
select * from hosvital.maeate2;
select * from hosvital.maeemp;
select * from hosvital.capbas;
select * from hosvital.maepro;
select * from hosvital.maeesp;

select * from hosvital.maedmb;
select * from hosvital.maedmb1;
select * from hosvital.maedmb2;
select * from hosvital.maedia;

/*
case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 5 then 'Primera Infancia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 6 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 11 then 'Infancia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 12 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=18 then 'Adolescencia'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 14 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 26 then 'Juventud'
 when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 27 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 59 then 'Adultez'
when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60 then 'Persona Mayor' end etareo



Primera Infancia (0-5 años)
Infancia (6 - 11 años)
Adolescencia (12 - 18 años)
Juventud (14 - 26 años)
Adultez (27- 59 años)
Persona Mayor (60 años o mas) envejecimiento y vejez.
*/



select i.mptdoc tipo_doc ,i.mpcedu documento, i.ingcsc num_ingreso,c.mpnom1 nombre1,c.mpnom2 nombre2, c.mpape1 apellido1, c.mpape2 apellido2 , (days(i.ingfecadm) - days(c.mpfchn))/365 edad ,case when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 0 and (days(i.ingfecadm) - days(c.mpfchn))/365 <= 5 then 'Primera Infancia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 6 and (days (i.ingfecadm) - days(c.mpfchn))/365 <= 11 then 'Infancia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >=12 and (days(i.ingfecadm) - days(c.mpfchn))/365 <=18 then 'Adolescencia' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 14 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 26 then 'Juventud' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 27 and (days(i.ingfecadm) - days (c.mpfchn))/365 <= 59 then 'Adultez' when (days(i.ingfecadm) - days(c.mpfchn))/365 >= 60 then 'Persona Mayor' end etareo,c.mpsexo as genero, day(m2.mafepr) as dia_atencion, month(m2.mafepr) as mes_atencion, year(m2.mafepr) as ano_atencion, d.mdnomd nombre_dpto, d1.mdnomm nombre_ciudad,d2.mdnomb barrio, i.ingentdx as cie_ingreso,dia.dmnomb dx_ingreso,i.ingdxsal1 cie_salida,dia2.dmnomb dx_egreso,case when i.clapro='1' then 'Ambulatorio' when i.clapro='2' then 'Hospitalizado' when i.clapro='3' then 'Urgencias' when i.clapro='5' then 'Urgencias' end ambito, mae.menomb as convenio, maetpa2.mtudes Regimen_convenio , esp.menome as especialidad, m2.prcodi codigo_proc, proc.prnomb as procedimiento, cen.cncdsc as costo,m2.mavatp as valor from hosvital.ingresos i inner join hosvital.maeate m on (m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving=i.ingcsc and m.maestf not in ('1','10')) inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup <> 'S' and m2.matipdoc in ('2','5')) inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni) inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) inner join hosvital.maepro proc on (proc.prcodi= m2.prcodi) left join hosvital.maeesp esp on (esp.mecode=m2.mecomm) inner join hosvital.maedmb d on (d.mdcodd= c.mdcodd) inner join hosvital.maedmb1 d1 on (d1.mdcodd= c.mdcodd and d1.mdcodm=c.mdcodm) inner join hosvital.maedmb2 d2 on (d2.mdcodd= c.mdcodd and d2.mdcodm=c.mdcodm and d2.mdcodb = c.mdcodb) left join hosvital.maedia dia on (dia.dmcodi= i.ingentdx) left join hosvital.maedia dia2 on (dia2.dmcodi= i.ingdxsal1) inner join hosvital.cencost cen on (cen.cnccod= m2.fcpcodscc) inner join hosvital.maepac maepac on (maepac.mptdoc = m.mptdoc and maepac.mpcedu = m.mpcedu and maepac.mennit= mae.mennit) inner join hosvital.maetpa2 maetpa2 on (maetpa2.mtucod =maepac.mtucod) where i.ingfecadm>='2020-01-01 00:00:00' and i.ingfecadm<= '2020-01-15 23:59:59' order by m.mpcedu

