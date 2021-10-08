select distinct prosit from hosvital.procir;
select * from hosvital.procir1;
select * from hosvital.maeemp;


select p.mptdoc tipo_doc,p.mpcedu documento ,c.mpnomc paciente , maeemp.mennit cod_contrato, maeemp.menomb contrato, case when p.prosit='1' then 'Programada'  when p.prosit='0' then ''  when p.prosit='2' then 'Urgencias'  end as atencion,p.procircod cod_cirugia,p.profec fecha_cirugia,p1.crgcod cups,mae.prnomb procedimiento , p.ProCirAut autorizacion
from hosvital.procir p
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.capbas c on (c.mptdoc = p.mptdoc and c.mpcedu=p.mpcedu)
inner join hosvital.maepro mae on (mae.prcodi= p1.crgcod)
inner join hosvital.maeemp maeemp on (maeemp.mennit=p.proeps)
where p.profec >= '2020-08-01' and p.profec <= '2020-08-31'
order by p.procircod,p1.crgcod;