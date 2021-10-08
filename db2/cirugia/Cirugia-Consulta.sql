/*
NOMBRE  DEL PACIENTE
DOCUMENTO  
EDAD 
CAMA  
DIAGNÓSTICO  PREOPERATORIO  Y  POSOPERATORIO  (CIE  10  Y  CUPS)
MÉDICO  QUE  REALIZA  EL  PROCEDIMIENTO  E  IDENTIFICACIÓN 
REINTERVENCIONES  DENTRO DE LA  HOSPITALIZACIÓN
FECHA Y    HORA   DE  INTERVENCIÓN 
FECHA  Y  HORA DE  REINTERVENCIÓN 
*/

select * from hosvital.procir where  procircod = 129468; -- profecf, prohori, prohorf
select * from hosvital.procir1 where  procircod = 129468; -- proced, crgcod, medcod, espccod
select * from hosvital.procir4;
select * from hosvital.ingresos;
select * from hosvital.maedia;

select * from hosvital.descirmed where codcir = 129468	;  --  codmed, codcir,cedpac,diaent,diasal, horinicir, horfincir

select * from hosvital.descirmed1; -- codmed , codcir, dxcompl


select p.procircod cirugia , p.mptdoc tipo_doc,p.mpcedu documento , cap.mpnomc paciente, (days(current_date)  - days(cap.mpfchn  ))/365 edad ,i.mpnumc as cama, maemed1.mmcodm cod_medico, maemed1.mmnomm nombre_medico, mae.dmnomb as dx_entrada, mae1.dmnomb as dx_salida, p1.crgcod cod_procedimiento, proc.prnomb as nombre
from hosvital.procir p
inner join hosvital.procir1 p1 on (p1.procircod= p.procircod)
inner join hosvital.capbas cap on (cap.mptdoc = p.mptdoc and cap.mpcedu=p.mpcedu)
left join hosvital.ingresos i on (i.mptdoc=p.mptdoc and i.mpcedu=p.mpcedu and i.ingcsc = p.proctvin )
inner join hosvital.descirmed d on (d.codcir = p.procircod )
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = d.codmed)
left join hosvital.maedia mae on (mae.dmcodi = d.diaent)
left join hosvital.maedia mae1 on (mae1.dmcodi = d.diasal)
inner join hosvital.maepro proc on (proc.prcodi= p1.crgcod)
where p.profec >= '2021-01-01' and p.profec <= '2021-01-31' 
order by p.procircod,p.mpcedu,p1.crgcod;

