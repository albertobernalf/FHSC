﻿SELECT * FROM PROCIR WHERE MPCEDU = '1072655537'
SELECT * FROM MAEATE WHERE MPCEDU = '1072655537'

SELECT MAAGRCIR,MAESANUP,MAHONCOD, MAVATP,MAVLRTOT,MAESPANUP,PRCODI,*
FROM MAEATE2 WHERE MPNFAC =  2308674     AND PRCODI = '541400' AND 
 MAHONCOD <> ''  
ORDER BY PRCODI,MAAGRCIR,MAHONCOD

CREATE TABLE MAEATE2_2324725 AS SELECT *  FROM MAEATE2 WHERE MPNFAC = 2324725

SELECT * FROM MAEATE2_2324725

select * from maeate where mpcedu = '740100'

-- Actualizacion liquodacion de cirugia

BEGIN TRANSACTION;
UPDATE MAEATE2
SET MAVLRTOT=894140.00
 WHERE MPNFAC = 2400106               AND MAHONCOD <> '' AND PRCODI = '770931' --AND MAAGRCIR =25 ---- AND MAVLRTOT= 5441080 ---AND MAcscp in (8,9,7)
-- COMMIT
-- ROLLBACK


-- Por igual

SELECT MAAGRCIR,PRCODI,SUM(MAVATP), MAVLRTOT ,(SUM(MAVATP) - MAVLRTOT) AS DIFERENCIA
FROM MAEATE2 
WHERE MPNFAC =   2400106                            AND MAHONCOD <> '' AND MAESANUP <>'S'
GROUP BY MAAGRCIR,PRCODI,MAVLRTOT
ORDER BY MAAGRCIR,PRCODI

 -- Por diferentre

 SELECT MAAGRCIR,PRCODI,SUM(MAVATP), MAVLRTOT
 FROM MAEATE2 
 WHERE MPNFAC = 2400106                                             AND MAHONCOD <> '' AND MAESANUP <>'S' 
 GROUP BY MAAGRCIR,PRCODI,MAVLRTOT
 HAVING SUM(MAVATP) <> MAVLRTOT
-- rollback;


 -- Actualizacion DETAKLLADA liquodacion de cirugia

BEGIN TRANSACTION;
UPDATE MAEATE2
SET MAVLRTOT=2381546 
 WHERE MPNFAC = 2339434          AND MAHONCOD <> '' AND PRCODI = '862304' AND MAAGRCIR=33 ---AND MAcscp in (8,9,7)
-- COMMIT
-- ROLLBACK

CREATE TABLE MAEATE2_2358773 AS 
SELECT * FROM MAEATE2 WHERE MPNFAC = 2358773

SELECT * FROM MAEATE2 WHERE MPNFAC = 2358773 AND PRCODI ='389101'

BEGIN TRANSACTION;
DELETE FROM MAEATE2
WHERE MPNFAC = 2358773 AND PRCODI ='389101' AND MAVATP=0.00
-- COMMIT
