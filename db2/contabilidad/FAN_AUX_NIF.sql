select * from hosvipru.rsmaux where rsmempcod='03' and rsmano=2019 and rsmctncon ='11200502'  order by rsmctncon; -- and rsmctncon like ('%11200%');
select * from hosvipru.nirsmaux where  nircemp='03' and nircanio=2019 and nirccue ='11200502'  order by nirccue ;
select * from hosvital.nirsmgen where  nircemp='03' and nircanio=2019 and nirccue ='11200502'   order by nirccue ; 
select * from hosvital.resmcue  where rsmempcod='03' and rsmano=2019 and rsmctncon ='11200502'  order by rsmctncon;

SELECT * FROM HOSVITAL.CUENTAS WHERE CNTVIG=2019 AND  EMPCOD='03';

SELECT * FROM HOSVITAL.NICUENTAS WHERE NICNTVIG=2019 AND  EMPCOD='03';
/*

SIF	1	
CEF	30	
CEF	38	
RCF	26	
RCF	27	
NBF	4	
NBF	5	
NBF	16	

*/

select *   from hosviPRU.nimovcon2  where empcod='03' and nicntcod='11200502' and nimc2anio=2019 and nimc2mes<=2;

-- local
select * from hosvipru.movcont2;

select cntcod,mvcnat,sum(mvcvlr)
from hosviPRU.movcont2  
where empcod='03' and cntcod='11200503' and mvcanio=2019 and mvcmes<=1
group by   cntcod,mvcnat;

-- niif

select nicntcod,nimc2nat,sum(nimc2vl)
from hosviPRU.nimovcon2  
where empcod='03' and nicntcod='11200503' and nimc2anio=2019 and nimc2mes<=1
group by   nicntcod,nimc2nat;


select * from hosviPRU.nimovcon1 where (doccod,nimcnro) in (
select doccod,nimcnro  from hosviPRU.nimovcon2  where empcod='03' and nicntcod='11200502' and nimc2anio=2019 and nimc2mes<=1 ) ;

update hosvipru.nimovcon1
set nimc1fs=  nimc1fch
where doccod='NBF' AND NIMCNRO IN (4,5,16);


SELECT * FROM HOSVIPRU.NIMOVCXC WHERE NIMCCNO='629750 ';

select * from hosvital.movban where doccOD  ='NBF' AND MVBNROCMP=16;
select * from hosvital.movCXC where doccOD  ='NBF' AND MVCXCNRO=16;

