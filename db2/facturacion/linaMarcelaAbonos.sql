select * from hosvital.maeate4;
select * from hosvital.tmpfac;

SELECT  m.mpnfac factura,m.mptdoc tipo_doc, m.mpcedu documento,cap.mpnomc paciente,m4.abonum No_abono, afcvlrabo valor
FROM hosvital.maeate m
left join hosvital.maeate4 m4 on ( m4.mpnfac=m.mpnfac)
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
where m.facfch >= '2021-07-01' and m.facfch<= '2021-07-31'
union
SELECT  0 factura,t.tftdoc tipo_doc, t.tfcedu documento,cap.mpnomc paciente,t4.abonum No_abono, t4.tfvala valor
FROM hosvital.tmpfac t
left join hosvital.tmpfac4 t4 on (t4.tftdoc= t.tftdoc and t4.tfcedu=t.tfcedu and t4.tmctving= t.tmctving)
inner join hosvital.capbas cap on (cap.mptdoc=t.tftdoc and cap.mpcedu=t.tfcedu)
where t.tffchi >= '2021-07-01' and t.tffchi <= '2021-07-31'
order by 1;

select * from hosvital.tmpfac4;