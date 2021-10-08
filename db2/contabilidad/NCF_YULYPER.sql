select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=10 and doccod='NCF' AND MVCCFCH >= '2020-10-01' AND MVCNAT='C';
select * from hosvital.movcont2 where  DOCCOD='NCF' AND MVCNRO = 8106;
-- 14150501 
select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=4 and doccod='NCF' AND MVCCFCH >= '2020-04-01' AND MVCNAT='D'  AND  CNTCOD='14150501';
select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=4 and doccod='NCF' AND MVCCFCH >= '2020-04-01' AND MVCNAT='D'  AND CNTCOD<>'14150501';

select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=8 and doccod='NCF' AND MVCCFCH >= '2020-08-01' AND MVCNAT='D'  AND CNTCOD='14150501' ORDER BY CNTCOD;

select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=9 and doccod='NCF' AND MVCCFCH >= '2020-09-01' AND MVCNAT='D'  AND CNTCOD<>'14150501' ORDER BY CNTCOD;

SELECT * FROM HOSVITAL.MAEATE WHERE MPNFAC IN ( 636683,636246,636660);
SELECT MPNFAC,MPCEDU,MPMENI, FACFCH,MAESTF, MATOTF,MATOTP,MATOTS, MASALCXC,MAVALS,MAFCHNOT,MAESTNOT,MANRNOTCR  FROM HOSVITAL.MAEATE WHERE MPNFAC IN ( 636683,636246,636660);

select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=10 and doccod='NCF' AND MVCCFCH >= '2020-10-01' AND MVCNAT='D'  AND CNTCOD='14150501' ORDER BY MVCCFCH; -- Hasta el 28 DE oCTUBRE
select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=10 and doccod='NCF' AND MVCCFCH >= '2020-10-29' AND MVCNAT='D'  AND CNTCOD<>'14150501' ORDER BY MVCCFCH;
-- Desde el 16 DE Abr hasta el 28 De Octubre

-- veamos una Factura
select * from hosvital.maepac where mpcedu = '1001044231';
select mpnfac,mactving  from hosvital.maeate where mpnfac = 636683; -- CS0111       	
select * from hosvital.maeate2 where mpnfac = 636683 and maesanup ='N'  AND  fcptpotrn='F'; --  and ; -- 904508   	, 883230   ,19747.00, 400000.
select * from hosvital.maeate3 where mpnfac = 636683 and maesanus ='N'  AND  fcstpotrn='F' and mavalu=3955;	   -- pabellon 36	509-S		
select * from hosvital.movcont2 where mvcanio=2020  and mvcdocrf1 = '636683' and cntcod='14150501'; -- Suministro 0246H02A     ,, pabellon  
select * from hosvital.ingresomp where mpcedu = '1001044231';	

select * from hosvital.cructatas;
select * from hosvital.gructocta;
select * from hosvital.gructoct1 where cntgruvig=2020 and cnccod='M0321';
SELECT * FROM HOSVITAL.GRPCTASER;
SELECT * FROM HOSVITAL.GRPCTASE1;
SELECT * FROM HOSVITAL.GRUCTAINV;
SELECT * FROM HOSVITAL.GRUCTAIN1  where gruCTAvig=2020 and cnccod='M0321' ;
SELECT * FROM HOSVITAL.GRUCTAIN1  where gruCTAvig=2020 and GRUCTAING= '14150501' ;
/*
OJO CON ESTA PARAMETRIZACION
01	01	001      	M  	M02	M0207    	         	2020	14150501            	41100201            	
01	01	001      	M  	M03	M0323    	         	2020	14150501            	61167001            	
01	01	001      	M  	M08	M0801    	         	2020	14150501            	61157001            	
01	01	001      	M  	M08	M0804    	         	2020	14150501            	61157001            	
01	03	001      	M  	M02	M0201    	         	2020	14150501            	61107001            	

*/


-- Veamos otra factura

-- veamos una Factura
select * from hosvital.maepac where mpcedu = '1001044231';
select mpnfac,mactving  from hosvital.maeate where mpnfac = 636246; -- CS0111       	
select * from hosvital.maeate2 where mpnfac = 636246 and maesanup ='N'  AND  fcptpotrn='F'; --  and ; -- 904508   	, 883230   ,19747.00, 400000.
select * from hosvital.maeate3 where mpnfac = 636246 and maesanus ='N'  AND  fcstpotrn='F' and mavalu=3955;	   -- pabellon 36	509-S		
select * from hosvital.movcont2 where mvcanio=2020  and mvcdocrf1 = '636660' ; --and cntcod='14150501'; -- Suministro 0246H02A     ,, pabellon   -- M0401 ,, M0321
select * from hosvital.ingresomp where mpcedu = '1001044231';	
