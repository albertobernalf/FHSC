/*
HISTORIA CLINICA, UBICACIÓN, CAMA, PACIENTE,  EDAD

SELECT RIGHT('000'+ISNULL(field,''),3)

Longitud de campos:
Historia: carácter de 20
Cama: carácter de 30
Paciente: carácter de 100
Edad: carácter de 30
*/
select * from hosvital.maepab;
select * from hosvital.maepab1;
select * from hosvital.capbas;
select * from hosvital.ingresos;

select cast(i.mpcedu as varchar(20)) historia_clinica, cast(m.mpnomp as varchar(30)) ubicacion,cast(m1.mpnumc as varchar(30)),cast(cap.mpnomc as varchar(100)),cast( (days(current_date) - days(cap.mpfchn) )/365  as varchar(30)) edad
from hosvital.ingresos i
inner join hosvital.maepab1 m1 on   (m1.mpudoc=i.mptdoc  and m1.mpuced= i.mpcedu)
inner join hosvital.maepab m on (m.mpcodp = m1.mpcodp)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu);
--where i.ingfecadm >= '2020-10-01 00:00:00' and i.ingfecadm <= '2020-10-31 23:59:59';