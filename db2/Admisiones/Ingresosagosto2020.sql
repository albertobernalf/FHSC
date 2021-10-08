/*
solicito a ustedes, nombre, cédula, hora, eps y médico tratante
*/

select * from hosvital.ingresos;
select * from hosvital.maemed1;

select i.mptdoc as tipo_doc, i.mpcedu as documento, cap.mpnomc as paciente,time(i.ingfecadm) as hora, mae.menomb, maemed1.mmnomm
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
left join hosvital.maeemp mae on (mae.mennit=i.ingnit)
left  join hosvital.maemed1 maemed1 on (maemed1.mmcodm=i.ingcomt)
where i.ingfecadm>= '2020-08-15 00:00:00 ' and i.ingfecadm <= '2020-08-15 23:59:59'
order by i.ingfecadm;