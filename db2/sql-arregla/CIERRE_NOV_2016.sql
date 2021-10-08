-- Ojo siempre constatar primero en PRUEBAS
-- IdentIfica las del problema


select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-12-01' and aglfrdfac<= '2016-12-31' and (aglconnro is null OR aglconnro=0)  -- 1028
ORDER BY aglfrdfac  -- 1028



--Se saca una copia de la taba ADMGLO11


CREATE TABLE ADMGLO11_20160523 AS SELECT * FROM ADMGLO11

SELECT COUNT(*) FROM ADMGLO11  --  1110368
SELECT COUNT(*) FROM ADMGLO11_20160420  -- 1110368


--Para las facturas pendientes ;
--En el campo AGLCONDOC=CFR y en el campo  AGLCONNRO el  numero de radicacion del dia

-- Query para mirar el consecutivo CFR para colocar a las que faltan :

select aglfrdfac,AGLCONDOC, AGLCONNRO,COUNT(*)
from ADMGLO11
where aglfrdfac>= '2016-12-01' and aglfrdfac<= '2016-12-31' 
GROUP BY aglfrdfac,AGLCONDOC, AGLCONNRO
ORDER BY aglfrdfac

-- ROLLBACK
-- SOLUCION
-- 411

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=986
WHERE aglfrdfac='2016-11-01' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 299



BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=987
WHERE aglfrdfac='2016-11-02' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 27


BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=988
WHERE aglfrdfac='2016-11-03' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 43


BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=989
WHERE aglfrdfac='2016-11-04' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 43



BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=991
WHERE aglfrdfac='2016-11-08' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 1

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC=	'CFR' , AGLCONNRO=992
WHERE aglfrdfac='2016-11-09' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 8

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=993
WHERE aglfrdfac='2016-11-10' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 99

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=994
WHERE aglfrdfac='2016-11-11' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 70

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=995
WHERE aglfrdfac='2016-11-15' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 53



BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=996
WHERE aglfrdfac='2016-11-16' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 26

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=997
WHERE aglfrdfac='2016-11-17' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 2

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=998
WHERE aglfrdfac='2016-11-18' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- + 18

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=1002
WHERE aglfrdfac='2016-11-24' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 3




select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-11-01' and aglfrdfac<= '2016-11-30' and (aglconnro is null OR aglconnro=0)  -- 1028
ORDER BY aglfrdfac  -- 0


  -- OJO AQUI QUEDO VOLANDO UNA FACTURA Y NO SE POR QUE. CFEO FUE ESTA 2245361

-- Validacion : No debe haber NINGUNA


select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-11-01' and aglfrdfac<= '2016-11-30' and (aglconnro is null OR aglconnro=0)  -- 511
ORDER BY aglfrdfac  -- 467




SELECT * FROM ADMGLO11
WHERE MPNFac IN (2374215,2372104)

SELECT * FROM HOJOBL WHERE HojNumObl IN ('2374215','2372104')
SELECT * FROM MOVCXC WCCFCH >= '2016-12-01'HERE MCCNumObl IN ('2374215','2372104')

SELECT * FROM MOVCXC
WHERE DOCCOD='CFR' AND MCCFch >= '2016-12-01'

SELECT * FROM HOJOBL WHERE HojNumObl = '2402339'
SELECT * FROM HOJOBL WHERE HojNumObl = '2403280'

2402339        
2402339        
        
2403280        
