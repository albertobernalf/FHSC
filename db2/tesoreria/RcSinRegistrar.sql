select EMPCOD,MCDPTO,DOCCOD, MVBNROCMP, MVBDET,MVBACT from hosvital.movban where doccod='RC' AND  MVBNROCMP >= 1283 AND MVBNROCMP <= 1354 ;
select  EMPCOD,MCDPTO,DOCCOD, MVBNROCMP, MVBDET,MVBACT from hosvital.movban where doccod='RC' AND  MVBNROCMP >= 1355 AND MVBNROCMP <= 1398 ;

UPDATE HOSVITAL.MOVBAN
SET MVBDET='N',  MVBACT='R'
WHERE EMPCOD='02' AND  MCDPTO='002' AND  DOCCOD='RC' AND MVBNROCMP=1283;

UPDATE HOSVITAL.MOVBAN
SET MVBDET='N',  MVBACT='R'
WHERE EMPCOD='02' AND  MCDPTO='002' AND DOCCOD='RC' AND MVBNROCMP>=1283 AND MVBNROCMP <= 1354 ;


UPDATE HOSVITAL.MOVBAN
SET MVBDET='N',  MVBACT='R'
WHERE EMPCOD='02' AND  MCDPTO='002' AND DOCCOD='RC' AND MVBNROCMP>=1355 AND MVBNROCMP <= 1398 ;

select * from hosvital.movban where empcod='02' and  MVBNROCMP = 1816;


UPDATE HOSVITAL.MOVBAN
SET MVBDET='N',  MVBACT='R'
WHERE EMPCOD='02' AND  MCDPTO='002' AND DOCCOD='RC' AND MVBNROCMP >= 1816 and  MVBNROCMP <= 1842;



SELECT  MVBDOCDET FROM HOSVITAL.MOVBAN WHERE DOCCOD='RC';

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RC' AND MVBNROCMP = 1283;
SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RC' AND MVBNROCMP = 1283;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='RC' AND MVBNROCMP = 1283;

--23195

SELECT * FROM HOSVITAL.MOVBAN WHERE EMPCOD='02' AND  MCDPTO='002' AND DOCCOD='RC' AND MVBNROCMP  in (1807,1816);

update  HOSVITAL.MOVBAN 
set   mvbact='S'
WHERE EMPCOD='02' AND  MCDPTO='002' AND DOCCOD='RC' AND MVBNROCMP >= 1816 and  MVBNROCMP <= 1842;

SELECT * FROM HOSVITAL.MOVBAN WHERE EMPCOD='01' AND  MCDPTO='001' AND DOCCOD='RNA' AND MVBNROCMP IN  (6048,6138,6272,6605,6672,6777,6848,6924,7185,7279,7310);


update  HOSVITAL.MOVBAN 
set   mvbact='S' -- ESTABA EN R
WHERE EMPCOD='01' AND  MCDPTO='001' AND DOCCOD='RNA' AND MVBNROCMP IN (6048,6138,6272,6605,6672,6777,6848,6924,7185,7279,7310)