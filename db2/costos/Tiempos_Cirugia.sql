/*
Código Procedimiento
Nombre Procedimiento
Especialidad
Nombre Especialista
Ubicación de realización procedimiento

Tiempo preparación paciente inicial
Tiempo preparación paciente final

Tiempo de Anestesia inicial
Tiempo de anestesia final

Tiempo inicial acto quirúrgico
Tiempo Final acto quirúrgico

Tiempo recuperación Inicial
Tiempo recuperación final


*/

select * from hosvital.descirmed;
select * from hosvital.descirmed1;
select * from hosvital.procir;


select p.procircod cirugia ,cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc pacinte,p1.crgcnt as cantidad,p1.crgcod codigo_proced,m.prnomb descripcion ,m11.mmnomm medico_cirugia, esp11.menome as especialida,
 d.fecinicir as Realizacion_acto_Quirurgico, d.horinicir as hora_inicio, d.horfincir as  hora_final, mon.MonHorAns Hora_Fin_anestesia
from hosvital.procir p
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.capbas cap on (cap.mptdoc=p.mptdoc  and cap.mpcedu=p.mpcedu)
inner join hosvital.maepro m on (m.prcodi=p1.crgcod)
left join hosvital.procir2 p2 on (p2.procircod=p1.procircod and p2.perstip='01')
left join hosvital.maemed1 m1 on (m1.mmcodm = p2.perscod )
left join hosvital.maeesp esp on (esp.mecode=p2.persesp)
inner join hosvital.descirmed d on (d.codcir = p.procircod)	
inner join hosvital.maemed1 m11 on (m11.mmcodm = d.codmed)
inner join hosvital.maeesp esp11 on (esp11.mecode=d.codesp)
left join hosvital.monrecans mon on (mon.procircod=p.procircod)
where p.profec>= '2021-07-01'
order by p.mpcedu,p.procircod; 

