SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD= 'PCP' AND MVCXPNRO = 2279  AND PRVCOD= '1018421333';
SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD= 'PCP' AND MVCXPNRO = 2279;

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='CES.2019' AND PRVCOD='1018421333'; 
SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD= 'PCP' AND MVCXPNRO = 2280;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='CES.2019' AND PRVCOD='1018421333'; 
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='INT.CES2019' AND PRVCOD='1018421333';

SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD= 'PCP' AND MVCXPNRO = 2282;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='VAC2019' AND PRVCOD='1018421333'; 
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='INT.CES2019' AND PRVCOD='1018421333';


UPDATE HOSVITAL.HOJOBLPRV
SET HOPTOTDEB=138185
 WHERE HOPNOOBL='FB75336' AND PRVCOD='805026666' AND CNTVIG IN (2020); 




UPDATE HOSVITAL.HOJOBLPRV
SET HOPTOTDEB=	
 WHERE HOPNOOBL='INT.CES2019' AND PRVCOD='69029234' AND CNTVIG=2020; 

UPDATE HOSVITAL.HOJOBLPRV
SET HOPTOTDEB=273738.34	
 WHERE HOPNOOBL='VAC2019' AND PRVCOD='69029234' AND CNTVIG=2020; 

-- 1023879993
-- 69029234
-- 860534049