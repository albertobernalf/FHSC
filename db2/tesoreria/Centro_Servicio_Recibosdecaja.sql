select  *  from hosvital.movcont3
where DOCCOD = 'RC'   AND  mvcnro IN (1492 );

select  *  from hosvital.movcont3
where DOCCOD = 'RC'   AND  mvcnro IN (1271 );



select  *  from hoxsvital.movcont2
where DOCCOD = 'RC'   AND  mvcnro IN (1271 );


SELECT *
from  hosvital.movban 
where doccod= 'RC' and mvbnrocmp IN ( 1271,1269  );

SELECT  distinct mvbact
from  hosvital.movban 
where doccod= 'RC' ; --and mvbnrocmp IN ( 1271,1269  );


update  hosvital.movban
set mvbact = 'R'
where doccod= 'RC' and mvbnrocmp IN ( 1271) and mvbvlr= 14863564.00	;


update  hosvital.movban
set mvbact = 'R'
where doccod= 'RC' and mvbnrocmp IN ( 1273 , 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281);


INSERT INTO HOSVITAL.MOVBAN1
 select '02',DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,1,TRCCOD,'','S',MVBVLR,MVBVLR, MVBFCH ,'' ,'',''
from hosvital.movban
 where doccod= 'RC'    AND  mvbnrocmp IN (1273 , 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281,1271);


SELECT * from hosvital.movban where doccod= 'RC' AND  mvbnrocmp IN (1273 , 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281,1271);

select * from hosvital.movban1 where doccod= 'RC'   AND  mvbnrocmp IN (1273 , 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281,1271);


---

SELECT * from hosvital.movban where doccod= 'RC' AND  mvbnrocmp IN (1268,1271);  --2019-03-26 07:45:25.000000	

SELECT * from hosvital.movban1 where doccod= 'RC' AND  mvbnrocmp IN (1268,1271);

SELECT * from hosvital.movban where doccod= 'RC' AND  mvbnrocmp IN (1271);  --2019-03-26 07:45:25.000000	

SELECT * from hosvital.movban1 where doccod= 'RC' AND  mvbnrocmp IN (1271);


update  hosvital.movban1
set mvb1est='N', mvb1f1 = '2019-03-27 14:27:55.000000'
 where doccod= 'RC' AND  mvbnrocmp IN (1271) and mvb1vl1 = 14863564.00
 ;
-- 

INSERT INTO HOSVITAL.MOVBAN1
 (EMPCOD,DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,MVB1ID,MVB1TRC,MVB1OPE,MVB1EST,MVB1VL1,MVB1VL2,MVB1F1,MVB1F2,MVB1CON,MVB1VL3)
select '02',DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,1,TRCCOD,'','S',MVBVLR,MVBVLR, cast('2019-03-29 14:27:55.000000' as timestamp)  , ' '  ,'',0
from hosvital.movban where doccod= 'RC'  AND  mvbnrocmp IN (1273 );

INSERT INTO HOSVITAL.MOVBAN1
 (EMPCOD,DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,MVB1ID,MVB1TRC,MVB1OPE,MVB1EST,MVB1VL1,MVB1VL2,MVB1CON,MVB1VL3)
select '02',DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,1,TRCCOD,'','S',MVBVLR,MVBVLR  ,'',0
from hosvital.movban where doccod= 'RC'  AND  mvbnrocmp   IN ( 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281);

update  hosvital.movban1
set mvb1est='N', mvb1f1 = '2019-03-29 14:27:55.000000' , mvb1f2='1901-01-01 00:00:00.000000',MVB1VL2=0
 where doccod= 'RC' AND  mvbnrocmp IN  ( 1273, 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281);


select * from hosvital.movban where docCod='RC' AND  mvbnrocmp=1283;
select * from hosvital.movban1 where docCod='RC' AND  mvbnrocmp=1283;
select * from hosvital.movban2 where docCod='RC' AND  mvbnrocmp=1283;


INSERT INTO HOSVITAL.MOVBAN1
 (EMPCOD,DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,MVB1ID,MVB1TRC,MVB1OPE,MVB1EST,MVB1VL1,MVB1VL2, MVB1F1,     MVB1CON,MVB1VL3)
select '02',DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,1,TRCCOD,'','S',MVBVLR,MVBVLR,MVBFCH  ,'',0
from hosvital.movban 
where doccod= 'RC'  AND  mvbnrocmp   IN ( 1283);


update  hosvital.movban1
set mvb1est='N', mvb1f1 = '2019-04-01 11:05:00.00000' , mvb1f2='1901-01-01 00:00:00.000000',MVB1VL2=0
 where doccod= 'RC' AND  mvbnrocmp IN  ( 1283);



select * from hosvital.movban where docCod='RC' AND  mvbnrocmp>=2124 ;  -- MVBFCH
select * from hosvital.movban1 where docCod='RC' AND  mvbnrocmp >=2124;


-- Rutina Final  armada con Andre Digital Ware:

-- Paso 1

INSERT INTO HOSVITAL.MOVBAN1
 (EMPCOD,DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,MVB1ID,MVB1TRC,MVB1OPE,MVB1EST,MVB1VL1,MVB1VL2, MVB1F1,     MVB1CON,MVB1VL3)
select '02',DOCCOD,MCDPTO,MVBNROCMP,MVBCSC,1,TRCCOD,'','S',MVBVLR,MVBVLR,MVBFCH  ,'',0
from hosvital.movban 
where empcod= '02' and   mcdpto='002' and doccod= 'RC'  AND  mvbnrocmp >= 2124     and   mvbnrocmp  <= 2134   ;
-- Paso 2

update  hosvital.movban1
set mvb1est='N',  mvb1f2='1901-01-01 00:00:00.000000',MVB1VL2=0
 where empcod= '02' and mcdpto='002' and doccod= 'RC' AND mvbnrocmp >= 2124     and   mvbnrocmp  <= 2134   ;



-- paso Adicional. creo No siempre  Para dejar SIN REGISTRAR los recibos de caja

UPDATE HOSVITAL.MOVBAN
SET MVBDET='N',  MVBACT='R'
 where empcod= '02' and mcdpto='002' and doccod= 'RC' AND  mvbnrocmp >= 2124     and   mvbnrocmp  <= 2134   ;
