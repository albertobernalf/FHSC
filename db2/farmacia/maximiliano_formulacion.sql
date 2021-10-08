
/*
1. Médico que formula
2. Suministro formulado
3. Paciente
4. Folio
5. Fecha

*/

select * from hosvital.frmsmns;
select * from hosvital.frmsmns1;
select * from hosvital.hccom1;
select * from hosvital.maemed1;

select m.mmnomm as medico, maesum1.msreso as cod_med, maesum1.msnomg as medicamento, c.mptdoc as tipodoc , c.mpcedu as documento, c.mpnomc as paciente, h.hiscsec as folio, h.hisfhorat as fecha_orden
from hosvital.hccom1 h
inner join hosvital.frmsmns f on (f.histipdoc= h.histipdoc and f.hisckey=h.hisckey and f.hiscsec = h.hiscsec)
inner join hosvital.maemed1 m on  (m.mmcodm = h.hiscmmed)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = f.fsmmsreso)
inner join hosvital.capbas c on (c.mptdoc = h.histipdoc and c.mpcedu= h.hisckey)
where h.hisfhorat>= '2020-12-01 00:00:00' and h.hisfhorat<= '2020-12-10 23:59:59'
order by h.hisfhorat;