select * from hosVital.citmed where citnum in (550917,550283,550200);

select * from hosvital.citmed1 where citfecpa >='2020-08-01'  and citcance ='S';

select * from hosVital.ctrlcitas where citnum in (550917,550283,550200);

select distinct citmtv from hosvital.ctrlcitas;

select c1.citnum,C1.Citfecpa,cap.mpnomc,c1.citesta, case when ctr.citmtv = 1 then 'Administrativo'   when ctr.citmtv = 2 then 'Paciente'   when ctr.citmtv = 1 then 'Medico' end
from hosvital.citmed1 c1 inner join hosvital.ctrlcitas ctr on (ctr.citnum = c1.citnum and ctr.citcmbdto= 'CANCELADA')
INNER JOIN HOSVITAL.CAPBAS cap on (cap.mptdoc = c1.cittipdoc and cap.mpcedu = c1.citced)
where c1.citfecpa >= '2020-01-01' AND C1.CITFECPA <= '2020-10-31' and c1.citcance = 'S';


select c1.citnum,C1.Citfecpa,cap.mpnomc,c1.citesta,case when ctr.citmtv =1 then 'Administrativo' when ctr.citmtv = 2 then 'Paciente' when ctr.citmtv = 1 then 'Medico' end from hosvital.citmed1 c1 inner join hosvital.ctrlcitas ctr on (ctr.citnum=c1.citnum and ctr.citcmbdto= 'CANCELADA') INNER JOIN HOSVITAL.CAPBAS cap on (cap.mptdoc = c1.cittipdoc and cap.mpcedu = c1.citced) where c1.citfecpa>='2020-08-01 00:00:00' AND C1.CITFECPA 
<='2020-10-01 00:00:00' and c1.citcance = 'S'