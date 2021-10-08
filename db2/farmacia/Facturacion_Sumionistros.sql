SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL = '542863';
SELECT * FROM HOSVITAL.HOJOBL  WHERE HOJNUMOBL = '542863';

select * from hosvital.maeate3;

select count(*) from hosvital.maeate3 where mafcsu>='2019-01-01 00:00:00';

select year(m3.mafcsu),month(m3.mafcsu),mae.menomb, maesum1.msnomg,sum(m3.macans), sum(m3.mavats)
from hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac = m.mpnfac)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = m3.msreso)
where  mafcsu>='2019-01-01 00:00:00' and m3.fcstpotrn='F' and m3.maesanus <> 'S' 
group by year(m3.mafcsu),month(m3.mafcsu),mae.menomb, maesum1.msnomg
order by  mae.menomb,year(m3.mafcsu),month(m3.mafcsu),maesum1.msnomg ;