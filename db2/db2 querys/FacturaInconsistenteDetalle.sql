SELECT MPNFAC, MAVALS,matots, MATOTP, MATOTF , MAVAAB, MAVAPU , MAVPAU ,MASALCXC FROM  hosvital.maeate  where mpnfac = 574662;


update  hosvital.maeate
set matotp = 2075853
where mpnfac = 574662  and matotp =  2075852.60;  --2352581.00

update  hosvital.maeate
set matotf = 4428434
where mpnfac = 574662  and matotf =  4428433.60;	

update  hosvital.maeate
set mavals =3766034
where mpnfac = 574662  and mavals =  3766033.59	;





-- ESTABA 573461	4029171.34	2124985.35	4872032.35	

UPDATE HOSVITAL.MAEATE
SET MAVALS =  2124985.35	, MATOTP = 2747047.00
WHERE  mpnfac = 573461;

select * from hosvital.maeate where mpnfac = 574662;  -- 2075852.60	2352581.00		  --4428433.60		
			       -- proced                                        --sumionis        -- total

-- Verificar las cirugias

-- Veamos  los abonos

select * from hosvital.abonos where  mpcedu = '20980037';


select sum(mavatp)
 from hosvital.maeate2 
where mpnfac = 574662 and maesanup <> '' AND FCPTPOTRN ='F';   --2075852.60	

	

select sum(mavats)
from hosvital.maeate3
where mpnfac = 574662 and maespanus is not null and fcstpotrn ='F';  --2352581.00	


-- Veamos Registro x Registro Procedimientos:

select prcodi, macscp, mafepr, macanpr, mavatp  from hosvital.maeate2  
where mpnfac = 574662 and maesanup <> '' AND FCPTPOTRN ='F';

/*
511000   	21	2019-04-15 10:58:37.000000	1	194976.75	
511000   	23	2019-04-15 10:58:37.000000	1	81742.05	
511000   	24	2019-04-15 10:58:37.000000	1	32400.45	
512104   	31	2019-04-16 16:10:20.000000	1	273274.50	
512104   	32	2019-04-16 16:10:20.000000	1	204134.85	
a con}ninuacion lops arreglos
*/
	
UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 194977
WHERE  mpnfac = 574662 and macscp = 21 and prcodi='511000' and mavatp = 194976.75	;


UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 81742
WHERE  mpnfac = 574662 and macscp = 23 and prcodi='511000' and mavatp = 81742.05;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 32400
WHERE  mpnfac = 574662 and macscp = 24 and prcodi='511000' and mavatp = 32400.45;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp =273275
WHERE  mpnfac = 574662 and macscp = 31 and prcodi='512104' and mavatp = 273274.50	;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 204135
WHERE  mpnfac = 574662 and macscp = 32 and prcodi='512104' and mavatp = 204134.85;	

-- Veamos Suministros

select  macscs,msreso ,  macans, mavats  from hosvital.maeate3  
where mpnfac = 574662 and maespanus is not null and fcstpotrn ='F'; 



-- sdo caso
SELECT MPNFAC, MAVALS,matots, MATOTP, MATOTF , MAVAAB, MAVAPU , MAVPAU ,MASALCXC FROM  hosvital.maeate  where mpnfac = 574978;
        -- 574978	28383707.00	12554454.00	15829253.00	28383707.00	      28383707.00	


select sum(mavatp)
 from hosvital.maeate2 
where mpnfac = 574978 and maesanup <> '' AND FCPTPOTRN ='F';   --15829251.83	 / 12554454.00	



select sum(mavats)
from hosvital.maeate3
where mpnfac = 574978 and maespanus is not null and fcstpotrn ='F';  -- 12554454.00	


-- Veamos Registro x Registro Procedimientos:

select prcodi, macscp, mafepr, macanpr, mavatp  from hosvital.maeate2  
where mpnfac = 574978 and maesanup <> '' AND FCPTPOTRN ='F';

/*
194106   	225	2019-04-12 10:17:04.000000	1	183108.60	
194106   	226	2019-04-12 10:17:04.000000	1	138412.80	
194106   	227	2019-04-12 10:17:04.000000	1	198307.58	
194106   	228	2019-04-12 10:17:04.000000	1	164618.85	

*/

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 183109
WHERE  mpnfac = 574978 and macscp = 225 and prcodi='194106' and mavatp = 183108.60;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 138413
WHERE  mpnfac = 574978 and macscp = 226  and prcodi='194106' and mavatp = 138412.80	;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 198308
WHERE  mpnfac = 574978 and macscp = 227  and prcodi='194106' and mavatp = 198307.58	;

UPDATE HOSVITAL.MAEATE2
SET MAVAtp = 164619
WHERE  mpnfac = 574978 and macscp = 228  and prcodi='194106' and mavatp = 164618.85	;





UPDATE HOSVITAL.MAEATE
SET   matotp = 12554454 ,   matotf =     MAVALS =  2124985.35	, MATOTP = 2747047.00
WHERE  mpnfac = 574978;


-------------------------------------------------------------
-------------------------------------------------------------

SELECT MPNFAC, MAVALS,matots, MATOTP, MATOTF , MAVAAB, MAVAPU , MAVPAU ,MASALCXC FROM  hosvital.maeate  where mpnfac = 573461;
--573461	2124985.35	2747047.00	2747047.00	4872032.35	 -- estaba

update hosvital.maeate
set mavals=4029171, matotp = 2124985,matotf= 4872032
where mpnfac  = 573461;


select sum(mavatp)
 from hosvital.maeate2 
where mpnfac = 573461 and maesanup <> '' AND FCPTPOTRN ='F';   -- 2124985.35	 //2124985.00	



select sum(mavats)
from hosvital.maeate3
where mpnfac = 573461 and maespanus is not null and fcstpotrn ='F';  -- 2747047.00	

select * from hosvital.maeate2;

select prcodi, macscp, mafepr, macanpr, mavatp,mppinte,mavlrtot  from hosvital.maeate2  
where mpnfac = 573461 and maesanup <> '' AND FCPTPOTRN ='F';



update   hosvital.maeate2
set mavatp = 273273
where mpnfac = 573461 and macscp = 45 and prcodi = '512104'	;


update   hosvital.maeate2
set mavatp = 204136
where mpnfac = 573461 and macscp = 46 and prcodi = '512104'	and mavatp = 204134.85;


update   hosvital.maeate2
set mavatp = 273273
where mpnfac = 573461 and macscp = 45  and prcodi = '512104'	and mavatp = 273274.50;


update   hosvital.maeate2
set  mavlrtot = 1030633
where mpnfac = 573461 and macscp in  (42,43,44,45,46)   and prcodi = '512104'	and mavlrtot =1030633.35	;






