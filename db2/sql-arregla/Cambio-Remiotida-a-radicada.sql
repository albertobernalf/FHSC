﻿
select * from admglo11 WHERE aglremnr = 61460 -- AND MPNFAC IN (1941380,1943617,1940191,1941834,1943542,1945517,1940299,1943519);
SELECT * FROM MAEATE WHERE  MPNFAC IN (2389157,2390822,2391813,2392404,2393506,2393682,2389650,2391801,2392189,2393050,2393587,23947229); -- ESTAN EN ESTADO 4

SELECT * FROM ADMGLO11 WHERE  AGLREMNR= 61460
SELECT * FROM ADMGLO01 WHERE  AGLREMNR= 61460


BEGIN TRANSACTION;
UPDATE MAEATE
SET MAESTF=4 -- REMITIDA
WHERE  MPNFAC IN (2389157,2390822,2391813,2392404,2393506,2393682,2389650,2391801,2392189,2393050,2393587,23947229,2394722);
-- COMMIT

SELECT * FROM ADMGLO01 WHERE  AGLREMNR= 61460

BEGIN TRANSACTION;
UPDATE ADMGLO01
SET AGLREMES='R', AGlRadFc='1753-01-01 00:00:00.00', AGlRadHr='' -- RENMITIDA  2016-12-14 00:00:00.000, 13:52:16  -- ESTABA EN D
WHERE  AGLREMNR= 61460;
-- COMMIT
-- ROLLBACK
SELECT * FROM ADMGLO11 WHERE  AGLREMNR= 61460


BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLFACES='R',AglFRdFac= '1753-01-01 00:00:00.00' , AGLNRDFAC=''-- Remitida   D  ,, 2016-12-14 00:00:00.000
WHERE  AGLREMNR= 61460 And MPNFAC IN (2389157,2390822,2391813,2392404,2393506,2393682,2389650,2391801,2392189,2393050,2393587,23947229,2394722);
-- COMMIT
-- ROLLBACK;