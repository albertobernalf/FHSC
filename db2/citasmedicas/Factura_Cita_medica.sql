SELECT MPNFAC, MACTVING,MAESTF, FACFCH FROM HOSVITAL.MAEATE WHERE MPCEDU = '1023921322' ;  -- 552101

SELECT MPCEDU, INGCSC,INGFAC,CLAPRO,INGFECADM,INGFECEGR,  INGNIT,INGNUMCIT FROM HOSVITAL.INGRESOS WHERE INGNUMCIT = 552101 ;

/*
631707	1	10	2020-06-24	
632665	2	10	2020-07-07	
632668	3	10	2020-07-07	
634672	4	4	2020-08-04	
638764	1	0	2020-09-24	

1023921322     	1	5	2020-06-24 03:15:11.000000	2020-06-24 11:30:49.000000	890903407-9  	0	
1023921322     	2	1	2020-07-07 08:30:00.000000	2020-07-07 08:30:00.000000	890903407-9  	549390	
1023921322     	3	1	2020-07-07 10:00:00.000000	2020-07-07 10:00:00.000000	MAPRE        	549389	
1023921322     	4	1	2020-08-04 09:00:00.000000	2020-08-04 09:00:00.000000	MAPRE        	550043	



*/

UPDATE HOSVITAL.INGRESOS
SET INGNUMCIT = 0 -- ESTABA 3730337        	

WHERE MPCEDU = '3730337' AND INGCSC IN (11);
