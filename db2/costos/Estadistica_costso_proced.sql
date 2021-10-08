/*
Por favor me colaboran enviando la estadística de los pacientes a los cuales se les ha realizado el siguiente procedimiento: 853104 MAMOPLASTIA DE REDUCCIÓN BILATERAL.

El objetivo es ver la trazabilidad de todo lo que consumió cada paciente, osea todo lo que se le cargo, respecto a insumos y medicamentos, todo lo que se haya cargado.

Es importante resaltar que se requiere una base de datos donde está el número de identificación del paciente, el nombre, la eps, acompañado de todo el cargue de facturación.

*/

select * from hosvital.maeate2;
select * from hosvital.maeate2  where mafepr >= '2015-01-01 00:00:00'  and prcodi='853104' ;
select * from hosvital.maeate;
select * from hosvital.maeemp;
select * from hosvital.maeate3;

select cap.mptdoc as tipo_doc, cap.mpcedu as documento,cap.mpnomc as paciente,maeemp.menomb, m2.mpnfac as factura, m2.macscp as consec , m2.mafepr as fecha, m2.prcodi as procedimiento,maepro.prnomb as procedimiento,m2.macanpr as cantidad, m2.mavatp as valor
from hosvital.capbas cap
inner join hosvital.maeate m on (m.mptdoc=cap.mptdoc and m.mpcedu=cap.mpcedu)
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and  m2.maesanup<>'S' and m2.fcptpotrn ='F')
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m2.mafepr >= '2017-01-01 00:00:00' and m2.mafepr <= '2020-12-01 00:00:00' and m2.mpnfac    in  (select m22.mpnfac from hosvital.maeate2 m22
						          where m22.mpnfac = m2.mpnfac and m22.prcodi='853104' and m22.maesanup<>'S' and m22.fcptpotrn ='F')
order by m2.mpnfac,m2.prcodi;



select cap.mptdoc as tipo_doc, cap.mpcedu as documento,cap.mpnomc as paciente,maeemp.menomb, m3.mpnfac as factura, m3.macscs as consec , m3.mafcsu as fecha, m3.msreso as suministro,maesum1.msnomg as suministro,m3.macans as cantidad, m3.mavats as valor
from hosvital.capbas cap
inner join hosvital.maeate m on (m.mptdoc=cap.mptdoc and m.mpcedu=cap.mpcedu)
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and  m3.maesanus<>'S' and m3.fcstpotrn ='F')
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m3.mafcsu >= '2017-01-01 00:00:00' and m3.mafcsu <= '2020-12-01 00:00:00' and m3.mpnfac    in  (select m22.mpnfac from hosvital.maeate2 m22
						          where m22.mpnfac = m3.mpnfac and m22.prcodi='853104' and m22.maesanup<>'S' and m22.fcptpotrn ='F')
order by m3.mpnfac,m3.macscs ,m3.msreso;

-- Query ttoal o Genral



select cap.mptdoc as tipo_doc, cap.mpcedu as documento,cap.mpnomc as paciente,maeemp.menomb, m2.mpnfac as factura, m2.macscp as consec , m2.mafepr as fecha, m2.prcodi as procedimiento,maepro.prnomb as procedimiento,m2.macanpr as cantidad, m2.mavatp as valor
from hosvital.capbas cap
inner join hosvital.maeate m on (m.mptdoc=cap.mptdoc and m.mpcedu=cap.mpcedu)
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and  m2.maesanup<>'S' and m2.fcptpotrn ='F')
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m2.mafepr >= '2017-01-01 00:00:00' and m2.mafepr <= '2020-12-01 00:00:00' and m2.mpnfac    in  (select m22.mpnfac from hosvital.maeate2 m22
						          where m22.mpnfac = m2.mpnfac and m22.prcodi='853104' and m22.maesanup<>'S' and m22.fcptpotrn ='F')
union
select cap.mptdoc as tipo_doc, cap.mpcedu as documento,cap.mpnomc as paciente,maeemp.menomb, m3.mpnfac as factura, m3.macscs as consec , m3.mafcsu as fecha, m3.msreso as suministro,maesum1.msnomg as suministro,m3.macans as cantidad, m3.mavats as valor
from hosvital.capbas cap
inner join hosvital.maeate m on (m.mptdoc=cap.mptdoc and m.mpcedu=cap.mpcedu)
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and  m3.maesanus<>'S' and m3.fcstpotrn ='F')
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m3.mafcsu >= '2017-01-01 00:00:00' and m3.mafcsu <= '2020-12-01 00:00:00' and m3.mpnfac    in  (select m22.mpnfac from hosvital.maeate2 m22
						          where m22.mpnfac = m3.mpnfac and m22.prcodi='853104' and m22.maesanup<>'S' and m22.fcptpotrn ='F')
order by 5,8;