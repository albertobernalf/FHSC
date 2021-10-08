/*
en el reporte debe quedar el número de cédula del paciente, el nombre del paciente, el nombre del profesional que realiza la evolución, especialidad y servicio.
Hccom2des, hisclpr, hcesp, hiscmmed,hisccie,fhcindesp
*/

select * from hosvital.hccom1 where hisfhorat>= '2020-11-01 00:00:00';
select * from hosvital.Hccom2des;
select * from hosvital.maeesp;

select h1.histipdoc tipo_doc,h1.hisckey documento, h1.hiscsec folio,maemed1.mmnomm paciente,esp.menome especialidad, h2.hcdscatr as evolucion,
case when h1.hisclpr ='1' then 'Ambulatorio'   when h1.hisclpr ='2' then 'Hospitalizado'   when h1.hisclpr ='3' then 'Urgencias'  else 'Otro Servicio' end servicio
from hosvital.hccom1 h1
inner join hosvital.Hccom2des h2 on (h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hiscsec=h1.hiscsec)
inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu = h1.hisckey)
inner join hosvital.maeesp esp on (esp.mecode=h1.hcesp)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h1.hiscmmed)
where h1.hisfhorat >= '2020-11-01 00:00:00' and h1.hisfhorat <= '2020-11-04 00:00:00' 