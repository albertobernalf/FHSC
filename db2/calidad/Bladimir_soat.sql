select * from hosvital.datsoat;
select * from hosvital.maeate;

select * from hosvital.maeate3;


select * from hosvital.maesum1;


select * from hosvital.grupos;
select * from hosvital.grupos1; -- 01 medicamnetos


select m.mpnfac,c.mpnomc, m.matotf,m.matotp,m.matots,dat.dafecacc,
(select sum(m3.mavats)
 from hosvital.maeate3 m3
 where m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and  m3.maesanus ='N' and msreso in (select mae.msreso from hosvital.maesum1 mae where mae.msgrpcod='01')) as medicamentos,
(select sum(m3.mavats)
 from hosvital.maeate3 m3
 where m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and  m3.maesanus ='N' and msreso in (select mae.msreso from hosvital.maesum1 mae where mae.msgrpcod <>'01')) as otros

from hosvital.maeate m
inner join hosvital.datsoat dat on (dat.mpcedu=m.mpcedu and dat.mptdoc = m.mptdoc and dat.ctving=m.mactving)
-- inner join hosvital.maesum1 m -- msgrpcod, mssgrpcd
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu = m.mpcedu)
where m.facfch >= '2020-01-01' and m.facfch<= '2020-03-31'
group by m.mpnfac,c.mpnomc, m.matotf,m.matotp,m.matots,dat.dafecacc;
