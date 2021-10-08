select * from hosvital.ingresos where mpcedu='18255518';
select * from hosvital.frmsmns where hisckey='18255518';
select  HISCKEY,  HISCSEC,HCTVIN1 from hosvital.HCCOM1  where hisckey='18255518';
select  *  from hosvital.HCCOM1  where hisckey='18255518';
select * from hosvital.HCCOM51  where hisckey='18255518';

select * from hosvital.maesum1 where msnomg like ('%APOSITO BA%');
/*
0002MQ08       	APOSITO BACTIGRAS 10*10 CM                                                                                                                                                                                                                                          	
0003MQ08       	APOSITO BACTIGRAS 15*20 CM                                                                                                                                                                                                                                          	

*/

SELECT * FROM HOSVITAL.CAPBAS  WHERE MPNOMC LIKE ('%HENALDO%');

UPDATE  hosvital.HCCOM1
SET HCTVIN1 =1
where hisckey='18255518' AND HISCSEC=15 AND HCESP=790 AND HISFHORAT= '2019-06-14 06:39:49.00000';