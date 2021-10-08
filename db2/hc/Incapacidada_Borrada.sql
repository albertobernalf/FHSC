SELECT * FROM HOSVITAL.CUENTAS WHERE EMPCOD='01' AND CNTVIG=2021 ORDER BY CNTCOD;
SELECT * FROM HOSVITAL.CUENTAS WHERE EMPCOD='01' AND CNTVIG=2020 ORDER BY CNTCOD;

SELECT * FROM HOSVITAL.NIMOVCON1 WHERE EMPCOD='01' AND NIMC1FCH<= '2017-01-01 00:00:00' ORDER BY NIMC1FCH;

/*
HOSVITAL.INCPAC
01	001      	INC	57543	1032391609     	CC 	1	0	72 	2021-02-11	10	2021-02-20	E139 	1	0	HC	A4MY7Z6   	2021-02-16 13:04:32.000000	MI068	387	214	N	0	0	01		0	                                                            	01	001      	AU8	5523	     	0001-01-01 00:00:00.000000	13	NA 	                                                                                                                                  HOSVITAL.INCPAC1 
                                                                                                                                                                         	
01	001      	INC	57543	00000          	                    	

*/
SELECT * FROM HOSVITAL.INCPAC  WHERE INCDOCAFI = '1032391609';
SELECT * FROM HOSVITAL.INCPAC1  WHERE INCCONPAC=57543;

DELETE  FROM HOSVITAL.INCPAC  WHERE INCDOCAFI = '1032391609';
DELETE  FROM HOSVITAL.INCPAC1  WHERE INCCONPAC=57543;