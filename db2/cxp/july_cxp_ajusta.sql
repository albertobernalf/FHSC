select * from hosvital.hojoblprv WHERE HOPNOOBL='GLOSA 2020'    AND PRVCOD='830014193';
SELECT * FROM HOSVITAL.MOVCXP    WHERE MVCXPNUOB= 'GLOSA 2020'   AND PRVCOD='830014193';


SELECT  MVCXPNAT, SUM(MVCXPVAL)
FROM HOSVITAL.MOVCXP    WHERE MVCXPNUOB= 'NOV-31364'
GROUP BY MVCXPNAT;

SELECT  MVCXPNAT, SUM(MVCXPVAL)
FROM HOSVITAL.MOVCXP    WHERE MVCXPNUOB= 'NOV-31364' AND   MVCXPFCH <=  '2020-12-31 23:59:59'
GROUP BY MVCXPNAT;

/*

C	888020361.96	
D	359234797.92	

*/

UPDATE  hosvital.hojoblprv 
SET   HOPTOTDEB = 0
WHERE HOPNOOBL='GLOSA 2020'  AND PRVCOD='830014193' AND CNTVIG=2020;





UPDATE hosvital.hojoblprv 
SET  HOPTOTDEB = 73829800.00	
WHERE HOPNOOBL='EPC504897' AND CNTVIG=2020;

select * from hosvital.hojoblprv WHERE HOPNOOBL='FE - 8441';
select *  from hosvital.movcxp where mvcxpnuob = 'FE - 8441';

UPDATE hosvital.hojoblprv 
SET  HOPTOTDEB = 427178.00	
WHERE HOPNOOBL='FE - 8441' AND CNTVIG=2020;

select * from hosvital.hojoblprv WHERE HOPNOOBL='MCOL4128199933';
select *  from hosvital.movcxp where mvcxpnuob = 'MCOL4128199933';

UPDATE hosvital.hojoblprv 
SET  HOPTOTDEB = 535500.00	
WHERE HOPNOOBL='MCOL4128199933' AND CNTVIG=2020;




select * from hosvital.hojoblprv WHERE EMPCOD='02' AND PRVCOD= '899999061' AND  HOPNOOBL='RETEICA 6B';

SELECT * FROM HOSVITAL.MOVCXP WHERE EMPCOD='02' AND  MVCXPNUOB = 'RETEICA 6B';

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CI' AND MVCNRO= 123;


/* en la movcxp

02	CI 	002      	123	3	2020	2020-12-31 09:55:54.000000	PES	1.00	RETEICA 6B     	23680590            	899999061      	C	312000.00	0.00	   	   	         	         	TRASLADO  RETENCION DE ICA 6B                                                                       	S	N	    	    	

*/

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO= 150;

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CB' AND MVCNRO= 15;

SELECT * FROM HOSVITAL.MOVCXP WHERE EMPCOD='02' AND  MVCXPNUOB = 'RETEICA 6B';

DELETE  FROM HOSVITAL.MOVCXP WHERE EMPCOD='02' AND  MVCXPNUOB = 'RETEICA 6B' AND DOCCOD='CA';
/* ESTABA
02	002      	CB 	15	1	2020	0001-01-01 00:00:00.000000	   	0.00	RETEICA 6B     	23680590            	

*/
DELETE  FROM HOSVITAL.MOVCXP WHERE EMPCOD='02' AND  MVCXPNUOB = 'RETEICA 6B' AND DOCCOD='CB' AND  MVCXPNRO= 15;

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE EMPCOD='02' AND  HOPNOOBL='RETEICA 6B';

UPDATE HOSVITAL.HOJOBLPRV 
SET HOPTOTCRE=312000, HOPTOTDEB= 0.00
WHERE EMPCOD='02' AND  HOPNOOBL='RETEICA 6B' AND CNTVIG IN (2020,2021);
