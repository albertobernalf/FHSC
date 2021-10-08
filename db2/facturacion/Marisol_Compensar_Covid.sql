SELECT m.mpnfac as factura,m.facfch as  fecha_factura,cap.mptdoc as tipo_doc, cap.mpcedu as documento, cap.mpnomc as paciente, i.ingfecadm ingreso, i.ingfecegr egreso, (select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S' ) total_estancia, 
(select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi!='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S') total_otrosConceptos,
 (select sum(mae3.mavats ) from hosvital.maeate3 mae3 where mae3.mpnfac=m.mpnfac and mae3.fcstpotrn='F' and mae3.maesanus<> 'S') total_suministros 
FROM hosvital.maeate m inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu = m.mpcedu) 
 inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving) 
where m.facfch>='2021-05-01' and m.facfch<='2021-06-30' and m.mpmeni = 'COVID COMP' and m.maestf not  in ('1','10');

-- Con tomografia

SELECT m.mpnfac as factura,m.facfch as  fecha_factura,cap.mptdoc as tipo_doc, cap.mpcedu as documento, cap.mpnomc as paciente, i.ingfecadm ingreso, i.ingfecegr egreso, (select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S' ) total_estancia, 
(select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac and mae2.prcodi!='FHSC01202' and mae2.fcptpotrn='F' and mae2.maesanup<> 'S') total_otrosConceptos,
(select sum(mae2.mavatp ) from hosvital.maeate2 mae2 where mae2.mpnfac=m.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup<> 'S'  and mAE2.prcodi In ('879301-1','879901','879301','879420','879430','879990')) total_tomografias,
 (select sum(mae3.mavats ) from hosvital.maeate3 mae3 where mae3.mpnfac=m.mpnfac and mae3.fcstpotrn='F' and mae3.maesanus<> 'S') total_suministros 
FROM hosvital.maeate m inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu = m.mpcedu) 
 inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving) 
where m.facfch>='2021-05-01' and m.facfch<='2021-06-30' and m.mpmeni = 'COVID COMP' and m.maestf not  in ('1','10');


SELECT m.mpnfac as factura,m.facfch as  fecha_factura,cap.mptdoc as tipo_doc, cap.mpcedu as documento, cap.mpnomc as paciente, i.ingfecadm ingreso, i.ingfecegr egreso, 
m2.prcodi cod_rpc, maepro.prnomb procedimiento, m2.macanpr cantidad, m2.mpinte as unitario,m2.mavatp
FROM hosvital.maeate m inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu = m.mpcedu) 
 inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving) 
inner join hosvital.maeate2 m2  on (m2.mpnfac=m.mpnfac  and m2.fcptpotrn='F' and m2.maesanup<> 'S' )
inner join hosvital.maepro maepro on (maepro.prcodi= m2.prcodi)
where m.facfch>='2021-05-01' and m.facfch<='2021-06-30' and m.mpmeni = 'COVID COMP' and m.maestf not  in ('1','10')
union
sELECT m.mpnfac as factura,m.facfch as  fecha_factura,cap.mptdoc as tipo_doc, cap.mpcedu as documento, cap.mpnomc as paciente, i.ingfecadm ingreso, i.ingfecegr egreso, 
m3.msreso cod_rpc, maesum1.msnomg suministro, m3.macans cantidad, m3.mavalu as unitario,m3.mavats
FROM hosvital.maeate m inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu = m.mpcedu) 
 inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving) 
inner join hosvital.maeate3 m3  on (m3.mpnfac=m.mpnfac  and m3.fcstpotrn='F' and m3.maesanus<> 'S' )
inner join hosvital.maesum1 maesum1 on (maesum1.msreso= m3.msreso)
where m.facfch>='2021-05-01' and m.facfch<='2021-06-30' and m.mpmeni = 'COVID COMP' and m.maestf not  in ('1','10')  
order by 1;
