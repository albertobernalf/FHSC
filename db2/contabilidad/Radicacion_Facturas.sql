select * from hosvital.hojobl where hojnumobl='603718';   -- 17065194       
select * from hosvital.movcont2 where doccod = 'FAR' and mvcnro = 603718;
select * from hosvital.movcont3 where doccod = 'FAR' and mvcnro = 603718;

select * from hosvital.maeate where mpnfac = 603718;
SELECT *  FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('2939109');
select * from hosvital.admglo11 where mpnfac = 603718;
select * from hosvital.admglo01 where AGLREMNR= 23990;

-- Las facturas Particulares No se radican

select * from hosvital.hojobl where hojnumobl='603747';   -- 17065194       
select * from hosvital.maeate where mpnfac = 603747;
SELECT *  FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('10084381');
select * from hosvital.admglo11 where mpnfac = 603747;
select * from hosvital.admglo01 where AGLREMNR= 23990	;   --- 900156264-2    	

SELECT *  FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL= '587760';

select * from hosvital.maeemp where mennit='161';  -- 900372442      
select * from hosvital.maeemp where mennit='SS0021'; 	 -- 900298372

SELECT *  FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('2939109');


select * from hosvital.maeate where mpnfac = 587760;  -- 17065194       
select * from hosvital.maeate where MPCEDU ='17065194' ;
select * from hosvital.hojobl where hojnumobl ='592252';	


select * from hosvital.movcont3 where doccod='FAR' and mvcnro= 587760;
select * from hosvital.movcont2 where doccod='FAR' and mvcnro= 587760;

select * from hosvital.hojobl where hojnumobl in ('639617','640312','641382','641473','641579','641591','641712','641808','641995');
select  * from hosvital.movcxc where mccnumobl ='639617';

select *  from hosvital.admglo01 where aglremnr=26194;

select * from hosvital.admglo11 where mpnfac in ('639617','640312','641382','641473','641579','641591','641712','641808','641995');

select * from hosvital.movcxc where mccnumobl in  ('639617','640312','641382','641473','641579','641591','641712','641808','641995');

select * from hosvital.admglo11 where aglfrdfac >= '2021-02-20' order by aglfrdfac;

select * from hosvital.movcxc  where mccfch>= '2021-02-01 00:00:00'  and doccod='FAD' ;  -- eSTA CORRIDO HASTA EL 22-FEB



update hosvital.admglo11   -- ESTABA EN BLANCO    	0	0001-01-01 00:00:00.000000	
set  aglconnro=1789,aglconfec='2021-02-24 07:44:15.0000', aglcondoc='FAD'
where mpnfac in ('639617','640312','641382','641473','641579','641591','641712','641808','641995');


UPDATE HOSVITAL.HOJOBL
SET CLICOD='900298372'
where hojnumobl='587760'; 

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO =587761;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO =587760 ;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO =592252;

SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='FAR' AND MVCNRO =587760 ;


UPDATE HOSVITAL.MOVCXC
SET CLICOD='900298372'
where MCCNUMOBL='587760'; 




select * from hosvital.nimovcon1 where doccod='FAR'  and nimcnro= 587760;

select * from hosvital.hojobl WHERE HOJFCHOBL >='2019-06-01 00:00:00' AND HOJFCHOBL <='2019-07-01 00:00:00' AND EMPCOD='01';

SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL ='540429';	

select * from hosvital.admglo11 where  AGLFRDFAC >= '2019-08-01';

select * from hosvital.nihojobl where nihojno in (636397,636398,637070,637071,637072,637073,638145,638147,638151,638152,638175);


UPDATE hosvital.nihojobl
SET CLICOD='900298372'
where empcod='01' and hijojno in 