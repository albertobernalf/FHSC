select * from hosvital.movcxp where empcod='03' and  doccod ='CAF' AND MVCXPNRO= 46 ;

select * from hosvital.hojoblprv where  empcod='03' and hopnoobl='RETEICA 6B';

select * from hosvital.hojoblprv;

select * from hosvital.movcxp x
 where x.empcod='02' and x.cntvig=2020 and  x.cntcod not in (select y.cntcod from hosvital.cuentas y where  y.empcod= x.empcod and  y.cntvig=x.cntvig  and y.cntcod=x.cntcod);



select * from hosvital.movcont2 where doccod='CA' AND MVCNRO=150;

select * from hosvital.nimovcxp where doccod='CAF' AND  NIMCPNRO=46;

select * from hosvital.movcxp x
 where x.empcod='02' and x.cntvig=2020 and  x.cntcod not in (select y.cntcod from hosvital.cuentas y where  y.empcod= x.empcod and  y.cntvig=x.cntvig  and y.cntcod=x.cntcod);

select * from hosvital.movcont3 where doccod='CA' AND MVCNRO=150;
select * from hosvital.movcont2 where doccod='CA' AND MVCNRO=150;

SELECT * FROM HOSVITAL.NIMOVCON1 WHERE DOCCOD='CA' AND NIMCNRO=150;
SELECT * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='CA' AND NIMCNRO=150;

UPDATE hosvital.movcont2
SET CNTCOD='23680590', MVCVLRLC=0,  MVCVLR=0
 where EMPCOD='02' AND doccod='CA' AND MVCNRO=150;


UPDATE hosvital.movcxp
set cntcod='23680590', MVCXPVAL=0
where EMPCOD = '02' AND doccod ='CA' AND MVCXPNRO= 150 AND  MVCXPCSC in (2);

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE EMPCOD='02' AND CNTVIG = 2021 ORDER BY HOPFCHOBL;



SELECT COUNT(*) FROM HOSVITAL.HOJOBLPRV WHERE EMPCOD='02' AND CNTVIG=2020 AND  (HOPTOTCRE - HOPTOTDEB)  <> 0;  --  143
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE EMPCOD='02' AND CNTVIG=2020 AND  (HOPTOTCRE - HOPTOTDEB)  <> 0; 

SELECT * FROM HOSVITAL.HOJOBLPRV H WHERE H.EMPCOD='02' AND H.CNTVIG=2020 AND  (H.HOPTOTCRE - H.HOPTOTDEB)  <> 0  AND H.CNTCOD NOT IN (SELECT Y.CNTCOD FROM HOSVITAL.CUENTAS Y WHERE  Y.EMPCOD= H.EMPCOD AND  Y.CNTVIG=2021);

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL='RETEICA 6B'; --  AND CNTCOD = '';


DELETE FROM  HOSVITAL.HOJOBLPRV 
WHERE EMPCOD='02' AND HOPNOOBL='RETEICA 6B' AND CNTCOD = '';


SELECT * FROM HOSVITAL.HOJOBLPRV  WHERE EMPCOD='02' AND CNTVIG=2021;