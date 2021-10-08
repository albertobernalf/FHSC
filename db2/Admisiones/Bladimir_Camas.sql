select * from hosvital. maepab1;
select * from hosvital. maepab;

select cap.mptdoc, cap.mpcedu ,cap.mpnomc,mae.mpnomp,m.mpnumc
 from hosvital.maepab1 m
inner join  hosvital.maepab mae on (mae.mpcodp = m.mpcodp)
inner join hosvital.ingresos i on (i.mptdoc = m.mpudoc and i.mpcedu=m.mpuced and i.ingcsc = m.mpctvin)
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where m.mpdisp=1
order by m.mpcodp,m.mpnumc;

select cap.mptdoc, cap.mpcedu ,cap.mpnomc,mae.mpnomp,m.mpnumc, maeemp.menomb as empresa
 from hosvital.maepab mae
left join  hosvital.maepab1 m on (m.mpcodp =mae.mpcodp )
left join hosvital.ingresos i on (i.mptdoc = m.mpudoc and i.mpcedu=m.mpuced and i.ingcsc = m.mpctvin)
left join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
left join hosvital.maeemp maeemp on (maeemp.mennit= i.ingnit)
order by m.mpcodp,m.mpnumc;

select * from  hosvital.maeemp;