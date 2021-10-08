-- Me colaboran con desbloque de las requisiciones del almacén general # 2828 - 3321- 6057 -8657 - 12236 - 12523.

SELECT REQNRO,requso FROM hosvital.requisici ORDER BY 1;

-- Paso No 1. Consulto la requisiscion 

SELECT REQNRO,requso 
FROM hosvital.requisici 
WHERE reqnro IN 
(58236  );

-- PAso No 2 : Actualizo el estado de la requisision


update hosvital.requisici set requso = 'N' where reqnro IN  (55801,55803,55806,55808    );  -- estaba en blanco

-- 	COMMIT	
-- ROLLBACK
--  

-- Select * from pg_class where relname like ('%requisi%')
-- ARREGLO CUANDO LAS REQUISICIONES LOS SACA DEL SISTEMA

SELECT * FROM REQUISICI WHERE REQNRO = 16149  
BEGIN TRANSACTION;
UPDATE REQUISICI
SET  REQOBS='Secretaria'
WHERE REQNRO = 6324
-- COMMIT

SELECT * FROM REQUISICI 
WHERE REQNRO=6055



BEGIN TRANSACTION;
UPDATE REQUISI1
SET MSReSo='CUT0012'
WHERE DOCCOD='IRQ' AND REQNRO=13203 AND REQNOMPRO LIKE ('%SCOTT TOALLA ROLLO%')
-- COMMIT

select * from kardex1 limit 1

select * from kardex1
where doctip='IRQ' and docnro=13203