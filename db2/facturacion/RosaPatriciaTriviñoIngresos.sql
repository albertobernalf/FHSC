/*

Año
Mes
Asegurador
Código procedimiento
Descripción Procedimiento
Cantidad
Valor Unitario
Valor Total
Agrupador
Centro de Costos
Estado: Facturado – No Facturado
Diagnostico Principal Ingreso
Diagnostico Principal Egreso
Diagnostico Secundario 1
Diagnostico Secundario 2
Diagnostico Secundario 3
*/

select * from hosvital.maeate2;
select * from hosvital.maeate3;
select * from hosvital.tmpfac1;
select * from hosvital.tipproc;
select * from hosvital.maepro;
select * from hosvital.ingresos;
select * from hosvital.hcdiagn;

select 
m2.macscp csc ,year(m2.mafepr) ano ,month(m2.mafepr) mes,m2.mafepr fecha, m.mpmeni cod_contrato ,mae.menomb contrato,m2.prcodi cod_proc,maepro.prnomb desc_proced,cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,m2.macanpr cantidad,m2.mpinte unitario,m2.mavatp valor_total, m2.mpnfac factura , tip.tiprdes as agrupador, m2.fcpcodscc centro_costo,'Facturado' estado, i.ingdxcli dx_ing, i.ingdxsal1 dx_salida,
(select min(hc.hcdxcod)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc

) diagnostico_secundario
from hosvital.maeate m
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu=m.mpcedu and i.ingcsc=m.mactving)
 inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.maesanup <>'S')
 inner join hosvital.maeemp mae on  (mae.mennit= m.mpmeni) 
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi) 
inner join hosvital.tipproc tip on (tip.tiprcod = maepro.tpprcd)
where m2.mafepr BETWEEN '2021-07-01 00:00:00' AND '2021-07-31 23:59:59' and  m2.maesanup<>'S' and m2.fcptpotrn='F'
union
select  t1.tfcscp csc,  year( t1.tffchp) ano, month( t1.tffchp) mes, t1.tffchp fecha, t1.tfnitp cod_contrato,mae.menomb contrato , t1.tfprc1 cod_proc,maepro.prnomb desc_proced, cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,t1.tfcanpr cantidad,t1.tfinte unitario,   t1.tfvatp valor_total,0 factura , tip.tiprdes as agrupador,  t1.tfpcodscc centro_costo,'No Facturado' estado, i.ingdxcli dx_ing, i.ingdxsal1 dx_salida,
(select min(hc.hcdxcod)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc

) diagnostico_secundario
from hosvital.tmpfac1 t1
inner join hosvital.ingresos i on (i.mptdoc=t1.tftdoc and i.mpcedu=t1.tfcedu and i.ingcsc=t1.tmctving)
 inner join hosvital.maeemp mae on (mae.mennit= t1.tfnitp) 
inner join hosvital.capbas cap on (cap.mptdoc=t1.tftdoc and cap.mpcedu=t1.tfcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=t1.tfprc1) 
inner join hosvital.tipproc tip on (tip.tiprcod = maepro.tpprcd)
where t1.tffchp between  '2021-07-01 00:00:00'  and '2021-07-31 23:59:59'  and t1.tfptpotrn='F'  and t1.tfestaanu1<>'S'
order by 9,10,15;

--       	
-- Vamos a añadirle Sumionistros
--------------------------------------------------
----------------------------------------------------
SELECT * FROM HOSVITAL.MAEATE3;
SELECT * FROM HOSVITAL.tmpfac2;


select 
m2.macscp csc ,year(m2.mafepr) ano ,month(m2.mafepr) mes,m2.mafepr fecha, m.mpmeni cod_contrato ,mae.menomb contrato,m2.prcodi cod_proc,maepro.prnomb desc_proced,cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,m2.macanpr cantidad,m2.mpinte unitario,m2.mavatp valor_total, m2.mpnfac factura , tip.tiprdes as agrupador, m2.fcpcodscc centro_costo,'Facturado' estado, i.ingdxcli dx_ing, dia.dmnomb,i.ingdxsal1 dx_salida, dia1.dmnomb,
(select min(dia2.dmnomb)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
inner join hosvital.maedia dia2 on (dia2.dmcodi=hc.hcdxcod)
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc
) diagnostico_secundario
from hosvital.maeate m
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu=m.mpcedu and i.ingcsc=m.mactving)
 inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.maesanup <>'S')
 inner join hosvital.maeemp mae on  (mae.mennit= m.mpmeni) 
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi) 
inner join hosvital.tipproc tip on (tip.tiprcod = maepro.tpprcd)
inner join hosvital.maedia dia on (dia.dmcodi=i.ingdxcli) 
inner join hosvital.maedia dia1 on (dia1.dmcodi= i.ingdxsal1)
where m2.mafepr BETWEEN '2021-07-01 00:00:00' AND '2021-07-31 23:59:59' and  m2.maesanup<>'S' and m2.fcptpotrn='F'


union
select  t1.tfcscp csc,  year( t1.tffchp) ano, month( t1.tffchp) mes, t1.tffchp fecha, t1.tfnitp cod_contrato,mae.menomb contrato , t1.tfprc1 cod_proc,maepro.prnomb desc_proced, cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,t1.tfcanpr cantidad,t1.tfinte unitario,   t1.tfvatp valor_total,0 factura , tip.tiprdes as agrupador,  t1.tfpcodscc centro_costo,'No Facturado' estado, i.ingdxcli dx_ing, dia.dmnomb,i.ingdxsal1 dx_salida, dia1.dmnomb,
(select min(dia2.dmnomb)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
inner join hosvital.maedia dia2 on (dia2.dmcodi=hc.hcdxcod)
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc
) diagnostico_secundario
from hosvital.tmpfac1 t1
inner join hosvital.ingresos i on (i.mptdoc=t1.tftdoc and i.mpcedu=t1.tfcedu and i.ingcsc=t1.tmctving)
 inner join hosvital.maeemp mae on (mae.mennit= t1.tfnitp) 
inner join hosvital.capbas cap on (cap.mptdoc=t1.tftdoc and cap.mpcedu=t1.tfcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=t1.tfprc1) 
inner join hosvital.tipproc tip on (tip.tiprcod = maepro.tpprcd)
inner join hosvital.maedia dia on (dia.dmcodi=i.ingdxcli) 
inner join hosvital.maedia dia1 on (dia1.dmcodi= i.ingdxsal1)
where t1.tffchp between  '2021-07-01 00:00:00'  and '2021-07-31 23:59:59'  and t1.tfptpotrn='F'  and t1.tfestaanu1<>'S'
union
select 
m3.macscs csc ,year(m3.mafcsu) ano ,month(m3.mafcsu) mes,m3.mafcsu fecha, m.mpmeni cod_contrato ,mae.menomb contrato,m3.msreso cod_sum,maesum1.msnomg desc_suminist,cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,m3.macans cantidad,m3.mavalu unitario,m3.mavats valor_total, m3.mpnfac factura , 'Suministros y Medicamentos'  as agrupador, m3.macencos centro_costo,'Facturado' estado, i.ingdxcli dx_ing, dia.dmnomb,i.ingdxsal1 dx_salida, dia1.dmnomb,
(select min(dia2.dmnomb)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
inner join hosvital.maedia dia2 on (dia2.dmcodi=hc.hcdxcod)
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc
) diagnostico_secundario
from hosvital.maeate m
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu=m.mpcedu and i.ingcsc=m.mactving)
 inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.maesanus <>'S')
 inner join hosvital.maeemp mae on  (mae.mennit= m.mpmeni) 
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
 inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso) 
inner join hosvital.maedia dia on (dia.dmcodi=i.ingdxcli) 
inner join hosvital.maedia dia1 on (dia1.dmcodi= i.ingdxsal1)
where m3.mafcsu BETWEEN '2021-07-01 00:00:00' AND '2021-07-31 23:59:59' and  m3.maesanus<>'S' and m3.fcstpotrn='F'
union
select  t2.tfcscs csc,  year( t2.tffcsu) ano, month( t2.tffcsu) mes, t2.tffcsu fecha, t2.tfnits cod_contrato,mae.menomb contrato , t2.tfreso cod_sum,maesum1.msnomg desc_suminist, cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente ,t2.tfcans cantidad,t2.tfvalu unitario,   t2.tfvats valor_total,0 factura , 'Suministros y Medicamentos' as agrupador,  t2.tfcencos centro_costo,'No Facturado' estado, i.ingdxcli dx_ing, dia.dmnomb,i.ingdxsal1 dx_salida, dia1.dmnomb,
(select min(dia2.dmnomb)
from hosvital.hcdiagn hc
inner join hosvital.hccom1 h1 on (h1.histipdoc=hc.histipdoc and h1.hisckey=hc.hisckey and h1.hiscsec=hc.hiscsec )
inner join hosvital.maedia dia2 on (dia2.dmcodi=hc.hcdxcod)
where hc.histipdoc=i.mptdoc and hc.hisckey = i.mpcedu and hc.hcdxcls=1  and h1.hctvin1 = i.ingcsc

) diagnostico_secundario
from hosvital.tmpfac2 t2
inner join hosvital.ingresos i on (i.mptdoc=t2.tftdoc and i.mpcedu=t2.tfcedu and i.ingcsc=t2.tmctving)
 inner join hosvital.maeemp mae on (mae.mennit= t2.tfnits) 
inner join hosvital.capbas cap on (cap.mptdoc=t2.tftdoc and cap.mpcedu=t2.tfcedu)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=t2.tfreso)
inner join hosvital.maedia dia on (dia.dmcodi=i.ingdxcli) 
inner join hosvital.maedia dia1 on (dia1.dmcodi= i.ingdxsal1)
where t2.tffcsu between  '2021-07-01 00:00:00'  and '2021-07-31 23:59:59'  and t2.tfstpotrn='F'  and t2.tfestaanu2<>'S'
order by 9,10,15;


SELECT SUM(MAVATP) FROM HOSVITAL.MAEATE2 WHERE MPNFAC = 661824 AND  MAFEPR >= '2021-07-01 00:00:00' AND MAFEPR <= '2021-07-05 00:00:00'  AND maesanup<>'S' and fcptpotrn='F';
--918580.00	

SELECT SUM(MAVATs) FROM HOSVITAL.MAEATE3 WHERE MPNFAC = 661824 AND  MAFCSU >= '2021-07-01 00:00:00' AND MAFCSU <= '2021-07-05 00:00:00'  AND maesanus<>'S' and fcStpotrn='F';