SELECT  * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CEG' AND MVCNRO =32064;
--1.800.000.000	


SELECT * FROM HOSVITAL.HOJOBLPRV WHERE PRVCOD='830086601' AND HOPNOOBL= 'CE00025091';


UPDATE  HOSVITAL.HOJOBLPRV -- ESTABA 28517250.00	
SET HOPTOTDEB=0
 WHERE PRVCOD='830086601' AND HOPNOOBL= 'CE00025091' AND CNTVIG=2019;