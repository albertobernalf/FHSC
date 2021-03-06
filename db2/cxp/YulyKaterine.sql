select * from hosvital.movcont2 
where  doccod='CEG' AND MVCNRO IN (31699)  AND TRCCOD='1014271952';

/*
Estaba

01	CEG	31699	001      	83	2019	25050501            	   	   	         	         	1014271952     	NOM.MAYO19     	               	               	D	4423162.00	0.00	PAGO NOMINA MAYO 2019 FHSC                                                                          	0.00	4423162.00	        	2019-05-30	001      	5	2019	N	               	               	       	
*/


DELETE FROM HOSVITAL.MOVCONT2
where  doccod='CEG' AND MVCNRO IN (31699)  AND TRCCOD='1014271952' AND  MVCVLRLC= 4423162.00;


SELECT * FROM HOSVITAL.MOVCXP WHERE MVCXPNUOB='NOM.MAYO19' AND PRVCOD='1014271952'  AND DOCCOD='CEG' AND MVCXPNRO= 31699;	

--
/*
01	CEG	001      	31699	83	2019	2019-05-30 00:00:00.000000	PES	1.00	NOM.MAYO19     	25050501            	1014271952     	D	4423162.00	0.00	   	   	         	         	PAGO NOMINA MAYO 2019 FHSC                                                                          	S	N	    	    	

*/

DELETE FROM HOSVITAL.MOVCXP WHERE MVCXPNUOB='NOM.MAYO19' AND PRVCOD='1014271952' AND DOCCOD='CEG'  AND MVCXPNRO= 31699;	

SELECT * FROM HOSVITAL.HOJOBLPRV  WHERE  CNTVIG=2019 AND PRVCOD='1014271952' AND HOPNOOBL= 'NOM.MAYO19';

UPDATE HOSVITAL.HOJOBLPRV
SET  HOPTOTDEB = 0
WHERE  CNTVIG=2019 AND PRVCOD='1014271952' AND HOPNOOBL= 'NOM.MAYO19' AND HOPTOTDEB = 4423162.00	;

--
select * from hosvital.movcont2 
where  doccod='CEG' AND MVCNRO IN (31699) AND  MVCNAT='C'  ;


UPDATE  hosvital.movcont2 
SET MVCVLRLC=  843834535   , MVCVLR= 843834535
where  doccod='CEG' AND MVCNRO IN (31699) AND  MVCNAT='C'  AND  MVCVLR=848257697 ;
