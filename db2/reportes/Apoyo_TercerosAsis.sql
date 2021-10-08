select * from hosvital.maeate2 where mpnfac = 573052 order by prcodi;
select * from hosvital.ingresos where mpcedu = '41408694';

select * from hosvital.procir where procircod = 110524 ; --  and proctvin= 3;

--573052	
--574130	

select * from hosvital.maeate2;

select   mpnfac,prcodi, mavatp, mpphome,mahoncod,mppcso, maesanup from hosvital.maeate2 where mpnfac = 573652 order by prcodi,mahoncod;
select   mpnfac,prcodi, mavatp, mpphome,mahoncod,maesanup, mmcodm from hosvital.maeate2 where mpnfac = 573652 and prcodi = '808061' and fcptpotrn='F'  order by prcodi,mahoncod;
select   * from hosvital.maeate2 where mpnfac = 573652 and prcodi = '862324' and fcptpotrn='F'  order by prcodi,mahoncod;

select * from hosvital.maeate where mpnfac = 573652		;  --  148
select * from hosvital.maeate2 where mpnfac = 573652		 order by prcodi;  --89020227 	
select * from hosvital.maeate1 where mpnfac = 573652		 ;


select * from hosvital.portar1 where ptcodi='148' and prcodi = '210402';
select * from hosvital.portar1 where ptcodi='001'   and prcodi='862324';

select * from hosvital.forliq1 where forliqcod='102';
select * from hosvital.forliq2 where forliqcod='102';

select * from hosvital.procir where procircod = 110504 ;
select * from hosvital.ingresos where mpcedu = '79313961';
select * from hosvital.procir1 where procircod = 110504 ;
select * from hosvital.procir2 where procircod = 110504 ;

SELECT f1.forliqvlhn*pp1.PTCNTUVR*pp1.ptporc/100*mae2.mpphome 
FROM  HOSVITAL.forliq1 f1, hosvital.portar1  pp1 ,hosvital.maeate mae, hosvital.maeate2 mae2
 WHERE pp1.ptcodi = '001' and pp1.prcodi = '862324' and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '01'and  mae.mpnfac = kk.ingfac and mae.mpnfac = mae2.mpnfac and mae2.prcodi = kk.crgcod and mae2.mahoncod = f1.hnrcod;

	

-- vbeamos a ver si esta esta facturada--  

select * from hosvital.ingresos where ingfac = 573652;
select * from hosvital.procir where mpcedu = '79313961';
-- 110468 , 110489
select  procircod,mpcedu,mptdoc,proctvin, profec, proeps, procons  from hosvital.procir where   procircod in ( 111080)	 ; -- ops  No esta facturada
select * from hosvital.ingresos where mpcedu = '80381022'  and ingcsc= 1;  -- factura 575635	
	
select * from hosvital.consul;
select * from hosvital.procir where procircod = 110431 ;
select * from hosvital.procir1 where procircod  in  ( 111080);
select mpnfac,mactving, maestf  from hosvital.maeate where mpcedu = '23395218' order by mactving;  --  573652	
select * from hosvital.procir2 where procircod in  ( 111080) ; -- si esta facturada
select hnrdsc from hosvital.honrios where hnrcod='05';
select * from hosvital.vias;

select * from hosvital.tmpfac where tfcedu = '23395218';
select tmctving,tffchp,tfprc1,tfvatp,tfpcso, tfphome,tfhnrcod,tfvlrtot,tfngrp,tfcodcir  from hosvital.tmpfac1 where tfcedu = '51847789';
select * from hosvital.descirmed where codcir  in  ( 110431,110962);

-- la 110407 con este med 19318608        ,, pero en la ciru esta 23395218       	


select * from hosvital.maepro where prcodi in ('461301','861104');  	
	

select * from hosvital.descirmed1  where codcir = 110451;

select * from hosvital.maeesp where  mecode='137';


select * from hosvital.maeemp31 where mennit = 'CS0111';
select * from hosvital.portar where ptcodi='146' ;
select * from hosvital.portar1 where ptcodi='146'   and prcodi in ('454209');	;


select   mpnfac,prcodi, mavatp, mpphome,mahoncod,mppcso, maesanup,macodcir from hosvital.maeate2 where mpnfac = 575635	 order by prcodi,mahoncod;
select   mpnfac,prcodi, mavatp, mpphome,mahoncod,maesanup, mmcodm from hosvital.maeate2 where mpnfac = 573652 and prcodi = '808061' and fcptpotrn='F' and maesanup ='N'  order by prcodi,mahoncod;
select   * from hosvital.maeate2 where mpnfac = 573652;	
 --  and prcodi = '862324' and fcptpotrn='F'  order by prcodi,mahoncod;

select procircod, perstip, count(*)
from hosvital.procir2
where persest='S'
group by procircod,perstip
having count(*) >1
order by count(*);

select * from hosvital.procir2;


select * from hosvital.procir
where PROFEC>= '2019-04-19' AND PROFEC<= '2019-04-19'
order by procircod;

