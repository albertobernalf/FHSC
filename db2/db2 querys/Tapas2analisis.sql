
select  a.mpnfac
from hosvital.adglosas a, hosvital.maeate b, hosvital.maeemp m, hosvital.terceros t1 , hosvital.hojobl h3
where a.mpnfac = b.mpnfac and b.mpmeni = m.mennit and substr(m.mecntr,1,9)= t1.trccod   and a.glofchrec >= '2019-01-01' and a.mpnfac =  531680	
 and  cast(h3.hojnumobl as integer) = a.mpnfac ;

select * from hosvital.adglosas where glofchrec >= '2019-01-01' and mpnfac =  531680;

select *
from hosvital.adglosas a, hosvital.maeate b, hosvital.maeemp m, hosvital.terceros t1 , hosvital.hojobl h3
where a.mpnfac = b.mpnfac and b.mpmeni = m.mennit and substr(m.mecntr,1,9)= t1.trccod   and a.glofchrec >= '2019-01-01' and a.mpnfac =  531680	
 and a.mpnfac = int(h3.hojnumobl );

select  *
from hosvital.adglosas a
inner join  hosvital.maeate b on (b.mpnfac = a.mpnfac)
inner join hosvital.maeemp m on (m.mennit =b.mpmeni)
inner join hosvital.terceros t1  on ( t1.trccod = substr(m.mecntr,1,9) )
inner join hosvital.hojobl h3 on (h3.cntvig = 2019 and h3.empcod='01' and h3.clicod = substr(m.mecntr,1,9) and cast(h3.hojnumobl as integer) = cast(a.mpnfac as integer) )
where  a.glofchrec >= '2019-01-01' ; -- and a.mpnfac =  556036	;

select * from hosvital.hojobl where hojnumobl = '556036';	

select * from hosvital.adglosas where glofchrec >= '2019-01-01'and mpnfac = 556036;

SELECT * FROM HOSVITAL.ADMGLO01 WHERE AGLREMFC >= '2019-01-01'  AND AGLRADFC = '0001-01-01';
select * from hosvital.admglo11 limit 100;

select     sum(m.matotf)
from hosvital.admglo01 a 
INNER JOIN hosvital.admglo11 b  ON ( b.aglremnr = a.aglremnr)
INNER JOIN  hosvital.terceros t1 ON ( t1.trcnit = a.emprnit )
INNER JOIN  hosvital.maeate m ON (m.mpnfac = b.mpnfac)
inner join hosvital.hojobl h3 on (h3.cntvig = 2019 and h3.empcod='01' and h3.clicod =t1.trccod and cast(h3.hojnumobl as integer) = cast(m.mpnfac as integer) )
where  t1.trccod = '900298372' and a.AGLRADFC = '0001-01-01';


select * from hosvital.maeate where facfch >='2019-03-01' and maestf = '10';

