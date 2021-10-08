/*
Buenos dias Don Alberto
Porfa generar el siguiente reporte;

Facturas realizadas -- Codigo 876122 - Portafolio 179
CC - Paciente - Cod Procedimiento - Nombre Procedimiento-  Fecha Factura -No Factura

Pendientes por facturar -- Codigo 876122 - Portafolio 179  
  CC -  Paciente - codigo Procedimiento - Procedimiento - Fecha 

Cordialmente,

*/

select * from hosvital.maeate2;

select  m.mptdoc,m.mpcedu,cap.mpnomc,m2.prcodi,maepro.prnomb,m.facfch,m.mpnfac
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.prcodi='876122' and m2.maesanup<>'S' and m2.fcptpotrn='F')
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.facfch >= '2021-01-01' and mpptcodi='179'  and m.maestf not in ('1','10');


select * from hosvital.tmpfac1;
select * from hosvital.tmpfac;
SELECT * FROM HOSVITAL.MAEPAC ; -- MENNIT , MTUCOD
SELECT * FROM HOSVITAL.MAEEMP31 WHERE PTCODI='179';  --MENNIT,MTUCO1,MEPPVIG,PTCODI

select  t1.tftdoc,t1.tfcedu,cap.mpnomc,t1.tfprc1,maepro.prnomb,t1.tffchp
from hosvital.tmpfac t
inner join hosvital.tmpfac1 t1 on ( t1.tftdoc= t.tftdoc and t1.tfcedu= t.tfcedu and t1.tfprc1='876122' and t1.tfptpotRn='F' and T1.TFESTAANU1 <>'S' )
inner join hosvital.capbas cap on (cap.mptdoc=t.tftdoc and cap.mpcedu=t.tfcedu)
inner join hosvital.maepro maepro on (maepro.prcodi=t1.tfprc1)
inner join hosvital.maepac maepac on (maepac.mptdoc=t.tftdoc and maepac.mpcedu=t.tfcedu and maepac.mennit=t.tfmeni)
inner join hosvital.maeemp31 m31 on ( m31.mennit=t.tfmeni and m31.ptcodi='179')
where t1.tffchp >= '2021-01-01 00:00:00' ;

-- Que no esten radicados

select * from hosvital.admglo11;

select  m.mptdoc,m.mpcedu,cap.mpnomc,m2.prcodi,maepro.prnomb,m.facfch,m.mpnfac
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.prcodi='876122' and m2.maesanup<>'S' and m2.fcptpotrn='F')
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.facfch >= '2021-01-01' and mpptcodi='179'  and m.maestf not in ('1','10') and m.mpnfac not in (select adm.mpnfac from hosvital.admglo11 adm where adm.mpnfac = m.mpnfac);

-- otro query

SELECT m.mpnfac as factura,m.facfch as  fecha_factura,cap.mptdoc as tipo_doc, cap.mpcedu as documento, cap.mpnomc as paciente, i.ingfecadm ingreso, i.ingfecegr egreso,
(select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S' ) total_estancia, 
(select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi!='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S') total_otrosConceptos, 
(select sum(mae3.mavats ) from hosvital.maeate3 mae3 where mae3.mpnfac=m.mpnfac and mae3.fcstpotrn='F' and mae3.maesanus<> 'S') total_suministros 
FROM hosvital.maeate m
 inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu = m.mpcedu)
 inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving)
 where m.facfch>='2021-06-01' and m.facfch<='2021-06-30' and m.mpmeni = 'COVID COMP' and m.maestf not  in ('1','10')