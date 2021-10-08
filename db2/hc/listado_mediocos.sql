select * from hosvital.maemed1;
select * from hosvital.maemed;
select * from hosvital.maeesp;
select * from hosvital.maetpp;

SELECT COUNT(*) FROM HOSVITAL.MAEMED1;

select m1.mmcodm codigo,m1.mmnomm nombre, m1.mmregm as registro_medico, m1.mtipdoc ,m1.mmcedm,mae.mtpdsc as profesion, m1.mmestado estado , m1.mmfirma as firma, 
esp.menome

from hosvital.maemed1 m1
inner join hosvital.maemed m on (m.mmcodm = m1.mmcodm and m.meeste='S')
inner join hosvital.maeesp esp on (esp.mecode = m.mecode )
inner join hosvital.maetpp mae on (mae.mtpcod = m1.mmtposerv)
ORDER BY     m1.mmnomm,     m.mecode ;



select m1.mmcodm codigo,m1.mmnomm nombre, m1.mmregm as registro_medico, m1.mtipdoc ,m1.mmcedm, m1.mmestado estado , m1.mmfirma as firma
from hosvital.maemed1 m1
inner join hosvital.maemed m on (m.mmcodm = m1.mmcodm and m.meeste='S')
ORDER BY     m1.mmnomm,     m.mecode ;