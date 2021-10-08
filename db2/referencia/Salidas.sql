/*
Fecha y hora de ingreso
Fecha y hora de salida
Nombre del paciente
Cédula del paciente
Asegurador 
Último registro 
# factura. 
*/

select * from hosvital.maeemp;


select i.mptdoc tipo_doc,i.mpcedu documento,cap.mpnomc paciente, i.ingfecadm as ingreso,i.ingfecegr as salida,mae.menomb as asegurador, m.mpnfac as factura
from Hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu  = i.mpcedu)
left join hosvital.maeate m on (m.mptdoc=i.mptdoc and m.mpcedu=i.mpcedu and m.mactving=i.ingcsc)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where i.ingfecadm >= '2021-07-01 00:00:00' and i.ingfecadm <= '2021-07-31 00:00:00'
order by i.ingfecadm;
