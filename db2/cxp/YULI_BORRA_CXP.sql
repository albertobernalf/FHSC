select * from hosvital.hojoblprv where prvcod='899999061' and hopnoobl='RETEICA 6B';
SELECT * FROM HOSVITAL.MOVCXP WHERE MVCXPNUOB = 'RETEICA 6B'  AND DOCCOD='CCB' AND MVCXPNRO=14;
select * from hosvital.hojoblprv where prvcod='899999061' and hopnoobl='RETEICA 6B' AND CNTVIG=2021;

UPDATE hosvital.hojoblprv 
SET HOPTOTDEB=0.00
where prvcod='899999061' and hopnoobl='RETEICA 6B' AND CNTVIG=2021 AND PRVCOD='899999061' ;

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CCB' AND MVCNRO = 14;

SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='CCB' AND MVCNRO = 14;

/*

ESTABA

03	CCB	003      	14	1	2020	0001-01-01 00:00:00.000000	   	0.00	RETEICA 6B     	23680590            	899999061      	D	4799000.00	0.00	   	   	         	         	                                                                                                    	S	N	    	    	


*/


DELETE FROM HOSVITAL.MOVCXP WHERE PRVCOD='899999061' AND MVCXPNUOB = 'RETEICA 6B' AND DOCCOD='CCB' AND MVCXPNRO=14;