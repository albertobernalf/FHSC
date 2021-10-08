select * from hosvital.refcref   where refcod IN (46940);
select * from hosvital.refcref   where reffch >= '2021-01-01 00:00:00'  order by refcod;;

SELECT DISTINCT REFTIP FROM hosvital.refcref;
select * from hosvital.empress;

/*

Fecha y hora de inicio remisión. --
Nombre del paciente --
Cedula del paciente --
Asegurador  --
Último registro   --??
Estado de la remisión.  --

*/
 	

select case  when r.reftip='S' then 'Referencia' when r.reftip='E' then 'Conta Referencia' end tipo , r.reffch fecha_remision, r.refcod numero, r.refnom med_referente, e.empdsc empresa, cap.mptdoc tipo_doc, cap.mpcedu documento,cap.mpnomc paciente, case when r.refest='R' then 'Rechazado' when r.refest='A' then 'Aceptado' when r.refest='N' then 'Anulado' when r.refest='P' then 'Pendiente' end as estado, r.refdscsrv 
from hosvital.refcref r
inner join hosvital.empress e on (e.mecntr=r.mecntr)
inner join hosvital.capbas cap on (cap.mptdoc=r.mptdoc and cap.mpcedu= r.mpcedu)
where reffch>= '2021-01-01 00:00:00' and   reffch<= '2021-07-31 00:00:00' and (r.refcod) in (select max(rr.refcod) from hosvital.refcref rr where rr.doccod=r.doccod and rr.reftip=r.reftip and
							   rr.mptdoc = r.mptdoc and rr.mpcedu=r.mpcedu and rr.refcod=r.refcod)
order by  r.reffch, r.mptdoc, r.mpcedu;
