select * from hosvital.maepro;
select  matipdoc,mpnfac, maestf from hosvital.maeate where facfch >= '2019-04-01'and maestf in ('1','10');
select * from hosvital.maeate2;

select m1.prcodi,m1.prnomb, count(*)
from hosvital.maeate2 m, hosvital.maepro m1, hosvital.maeate m2
where m.mpnfac = m2.mpnfac and m2.matipdoc = '2' and m2.maestf not in ('1','10') and
	m.mafepr >= '2018-07-01 00:00:00' and  m.mafepr <= '2018-12-31 23:59:59' and m.prcodi = m1.prcodi  and m.fcptpotrn='F' and  m.maesanup ='N' and  
group by m1.prcodi,m1.prnomb
order by count(*) desc;
