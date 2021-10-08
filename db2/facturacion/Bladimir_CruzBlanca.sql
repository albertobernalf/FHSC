select * from hosvital.tipproc;
select * from hosvital.maepro;
select * from hosvital.maeate2;
select * from hosvital.maeate3;
select * from hosvital.maeemp;

select * from hosvital.empress where empdsc like ('CRU%BLAN%');
select * from hosvital.MAEEMP  where MECNTR = '830009783-0';


select * from hosvital.grupos; -- grpcod, grpdsc
select * from hosvital.maesum1; -- msreso, msgrpcod


select m.mpnfac as factura, t.tiprdes,sum(m2.mavatp)
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac= m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi= m2.prcodi)
inner join hosvital.tipproc t on (t.tiprcod = mae.tpprcd)
where M.MPMENI IN ('CS0101','SS0101') AND m.mpnfac >= 583009 and m.mpnfac <= 608792  and m2.fcptpotrn =  'F' and m2.maesanup <> 'S'
group by  m.mpnfac  , t.tiprdes
union
select m.mpnfac as factura, g.grpdsc,sum(m3.mavats)
from hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac= m.mpnfac)
inner join hosvital.maesum1 mae on (mae.msreso= m3.msreso)
inner join hosvital.grupos g on (g.grpcod = mae.msgrpcod)
where  M.MPMENI IN ('CS0101','SS0101') AND m.mpnfac >= 583009 and m.mpnfac <= 608792  and m3.fcstpotrn = 'F' and m3.maesanus <> 'S'
group by  m.mpnfac  , g.grpdsc
ORDER BY 1;

