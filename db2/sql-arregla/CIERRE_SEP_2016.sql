-- Ojo siempre constatar primero en PRUEBAS
-- IdentIfica las del problema


select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-04-01' and aglfrdfac<= '2016-04-30' and (aglconnro is null OR aglconnro=0)  -- 1028
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
where aglfrdfac>= '2016-11-01' and aglfrdfac<= '2016-11-30' 
GROUP BY aglfrdfac,AGLCONDOC, AGLCONNRO
ORDER BY aglfrdfac

-- ROLLBACK
-- SOLUCION
-- 411

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=966
WHERE aglfrdfac='2016-10-03' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 676



BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=967
WHERE aglfrdfac='2016-10-04' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 676


BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=968
WHERE aglfrdfac='2016-10-05' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 41

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=969
WHERE aglfrdfac='2016-10-06' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 15

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC=	'CFR' , AGLCONNRO=971
WHERE aglfrdfac='2016-10-10' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 30

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=972
WHERE aglfrdfac='2016-10-11' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 127

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=973
WHERE aglfrdfac='2016-10-12' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 10

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=974
WHERE aglfrdfac='2016-10-13' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 38



BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=975
WHERE aglfrdfac='2016-10-14' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 7

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=976
WHERE aglfrdfac='2016-10-18' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 71

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=978
WHERE aglfrdfac='2016-10-20' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- + 22

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=979
WHERE aglfrdfac='2016-10-21' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 13

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=980
WHERE aglfrdfac='2016-10-24' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 13

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR' , AGLCONNRO=985
WHERE aglfrdfac='2016-10-31' and (aglconnro is null OR aglconnro=0)
-- COMMIT;  -- 13








select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-10-01' and aglfrdfac<= '2016-10-31' and (aglconnro is null OR aglconnro=0)  -- 1028
ORDER BY aglfrdfac  -- 0


  -- OJO AQUI QUEDO VOLANDO UNA FACTURA Y NO SE POR QUE. CFEO FUE ESTA 2245361

-- Validacion : No debe haber NINGUNA


select MPNFAC,aglfrdfac,AGLCONDOC, AGLCONNRO,AGLPERCER from ADMGLO11
where aglfrdfac>= '2016-03-01' and aglfrdfac<= '2016-03-29' and (aglconnro is null OR aglconnro=0)  -- 511
ORDER BY aglfrdfac  -- 467




