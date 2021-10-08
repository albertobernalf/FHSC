select * from hosvital.maepab; -- mpcodp = 2
select * from hosvital.ingresos;

select * from hosvital.maepab1;
select * from hosvital.capbas where mpcedu = '3056078';
select * from hosvital.maeemp;
select * from hosvital.maepac where mpcedu = '3056078';;


select i.ingcsc,m1.mpnumc cama,cap.mpnomc tipo_doc,cap.mptdoc documento,cap.mpcedu,(year(i.ingfecadm) - year( cap.mpfchn)) as edad,maeemp.menomb, days(current_date) - days(i.ingfecadm) as estancia,
maepac.mtcodp
from hosvital.maepab1 m1 
inner join hosvital.maepab m on (m.mpclapro=2 and m.mpcodp=m1.mpcodp)
inner join hosvital.capbas cap on (cap.mptdoc=m1.mpudoc and cap.mpcedu=m1.mpuced)
inner join hosvital.ingresos i on (i.mptdoc = cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = m1.mpctvin)
inner join hosvital.maeemp maeemp on (maeemp.mennit= i.ingnit)
inner join hosvital.maepac maepac on (maepac.mptdoc=cap.mptdoc and maepac.mpcedu=cap.mpcedu and maepac.mennit=maeemp.mennit)
where m.mpclapro=2
order by m1.mpcodp,m1.mpnumc;
