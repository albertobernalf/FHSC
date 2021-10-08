--890208
--890408


select * from hosvital.maeate2;


select prcodi, sum(mavlrtot) 
from hosvital.maeate2 where  mafepr >= '2019-06-01 00:00:00' and mafepr <= '2019-06-30 23:59:59' and prcodi in ('890208','890408') and fcptpotrn='F'  and maesanup <> 'S'
group by prcodi ;

/*
890408   	246432.00	
890208   	136200.00	


*/

select  mpnfac,prcodi,mavlrtot
from hosvital.maeate2 where  mafepr >= '2019-06-01 00:00:00' and mafepr <= '2019-06-30 23:59:59' and prcodi in ('890208','890408') and fcptpotrn='F'  and maesanup <> 'S'
;

select prcodi, sum(mavlrtot) 
from hosvital.maeate2 where  mafepr >= '2019-05-01 00:00:00' and mafepr <= '2019-05-31 23:59:59' and prcodi in ('890208','890408') and fcptpotrn='F'  and maesanup <> 'S'
group by prcodi ;

/*
890408   	209685.00	
890208   	36000.00	
890408   	209685.00	
890208   	36000.00
890408   	209685.00	
890208   	36000.00	

	

*/
select  mpnfac,prcodi,mavlrtot
from hosvital.maeate2 where  mafepr >= '2019-06-01 00:00:00' and mafepr <= '2019-06-30 23:59:59' and prcodi in ('890208','890408') and fcptpotrn='F'  and maesanup <> 'S'
;
select * from hosvital.maepro;

select m2.prcodi, m1.prnomb,sum(m2.mavlrtot) 
from hosvital.maeate2  m2, hosvital.maepro  m1
where  m2.mafepr >= '2019-06-01 00:00:00' and m2.mafepr <= '2019-06-30 23:59:59'  and m2.fcptpotrn='F'  and m2.maesanup <> 'S' and
         m2.prcodi=m1.prcodi and m1.prnomb like ('%SICOLOGI%')
group by m2.prcodi , m1.prnomb;


select m2.prcodi, m1.prnomb,sum(m2.mavlrtot) 
from hosvital.maeate2  m2
left join  hosvital.maepro  m1 on (m1.prcodi=m2.prcodi)
where  m2.mafepr >= '2019-01-04 00:00:00' and m2.mafepr <= '2019-06-30 23:59:59'  and m2.fcptpotrn='F'  and m2.maesanup <> 'S' and
         m2.prcodi=m1.prcodi and m1.prnomb like ('%SICOLOGI%')
group by m2.prcodi , m1.prnomb;


select  m2.mpnfac,m1.prcodi,m1.prnomb, m2.mavlrtot
from hosvital.maeate2  m2
left join  hosvital.maepro  m1 on (m1.prcodi=m2.prcodi)
where  m2.mafepr >= '2019-01-04 00:00:00' and m2.mafepr <= '2019-06-30 23:59:59'  and m2.fcptpotrn='F'  and m2.maesanup <> 'S' and
         m2.prcodi=m1.prcodi and m1.prnomb like ('%SICOLOGI%');

