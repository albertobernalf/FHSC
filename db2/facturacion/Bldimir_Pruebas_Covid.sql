/*
nombre contrato				
nombre empresa				
factura				
fecha fac				
fecha rad				
valor total factura				
valor subsidiado				
tipo doc paciente				
documento paciente				
nombre paciente				
fecha procedimiento	17/03/2020	25/08/2020		
codigo procedimiento	906270	906271	908856	906340
nombre procedimiento			


*/

select * from hosvital.admglo11;
select * from hosvital.admglo01;

select e.empdsc empresa, maeemp.menomb contrato,m.mpnfac factura,m.facfch fecha_factura,ad01.aglradfc fecha_radicacion,m.matotf as valor_factura, m.mavals as subsidiado,
cap.mptdoc tipo_doc,cap.mpcedu documento,cap.mpnomc paciente, m2.mafepr as fecha_proced,m2.prcodi as cod_proced, maepro.prnomb as procedimiento
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac = m.mpnfac)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.empress e on (e.mecntr=maeemp.mecntr)
inner join hosvital.capbas cap on (cap.mptdoc = m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.admglo11 ad11 on (ad11.mpnfac = m.mpnfac)
inner join hosvital.admglo01 ad01 on (ad01.aglremnr= ad11.aglremnr)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m2.mafepr >= '2020-03-17 00:00:00' and m2.mafepr <= '2020-08-25 23:59:59' and m2.prcodi in ('906270','906271','908856','906340') and m2.maesanup <> 'S' AND m2.fcptpotrn='F'
order by cap.mptdoc, cap.mpcedu, m2.mafepr, m2.prcodi;

SELECT * FROM HOSVITAL.MAEATE2 WHERE MPNFAC = 635317 AND prcodi in ('906270','906271','908856','906340');
