select * from hosvital.movcxc where mccnumobl='604976';

update  hosvital.movcxc
set mccvlr=0
 where mccnumobl='604976' and doccod='NGR' AND MVCXCNRO=33237;

update  hosvital.movcxc
set mccvlr=17932198.00	
 where mccnumobl='604976' and doccod='FAD' AND MVCXCNRO=1497;

Update hosvital.hojobl
set hojtotcre=0
where hojnumobl='604976' and cntvig=2019;

Update hosvital.hojobl
set hojtotcre=1520422,hojtotdeb=17932198.00	
where hojnumobl='604976' and cntvig=2020 and cntcod=13020601';



select * from hosvital.movcont3 where doccod='NGR' AND MVCNRO=32083;
select * from hosvital.movcont3 where doccod='NGR' AND MVCNRO=32087	
;

select * from hosvital.movcont2 where doccod='NGR' AND MVCNRO=32087;
select * from hosvital.movcont2 where doccod='NGR' AND MVCNRO=33237 and mvcdocrf1 = '604976';

SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL = '604976';

select * from hosvital.admglo11 where mpnfac =	604976;

select cntcod,mccnat,sum(mccvlr) -- credito 1146078.00	 / 13020601
from hosvital.movcxc where mccnumobl='604976' and doccod<>'FAD'
group by cntcod,mccnat;

-- la cta  13020601            	crdito = 2666500.00 - 1146078.00 = 1520422 


update hosvital.hojobl
set hjfcanobl='0001-01-01' 
where HOJNUMOBL = '604976';

SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL = '614448';


update hosvital.hojobl
set hjfcanobl='0001-01-01' 
where HOJNUMOBL = '614448';

