-- PRIMERO

SELECT * FROM KARDEX WHERE MSRESO = 'MQ0222123'
SELECT * FROM KARDEX1 WHERE MSRESO = 'MQ0222123'
SELECT * FROM BLTAINV3 WHERE BltAno =2016 AND BltMes=12


BEGIN TRANSACTION;
UPDATE KARDEX
SET MOVCSTP=36346.6700  ,MovCUni=36346.6700,MovSVlr=13*36346.6700
WHERE MSRESO = 'MQ0222123'
-- COMMIT;

SELECT MSCSTPRM,MSSldUni,MSSldVlr,* FROM MAESUM1 WHERE MSRESO = 'MQ0222123'

SELECT * FROM MAESUM1

BEGIN TRANSACTION;
UPDATE MAESUM1
SET MSCSTPRM= 36346.6700 ,MSSldUni=13,MSSldVlr=13*36346.6700
WHERE MSRESO = 'MQ0222123'
-- COMMIT

BEGIN TRANSACTION;
UPDATE KARDEX
SET 

SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO IN ('MQ0222123','MQ0222124','MQ0222125','MQ0210120')

-- SEGUNDO 

SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO IN ('MQ0222124')

select * from CTRCSTPRM where ccpmsreso = 'MQ0222124'


SELECT * FROM KARDEX WHERE MSRESO = 'MQ0222124'
SELECT * FROM KARDEX1 WHERE MSRESO = 'MQ0222124' ORDER BY MOVFCH  -- NO HAY PROBLEA  SI HAY VALOR INITARIO



BEGIN TRANSACTION;
UPDATE KARDEX
--SET MOVCSTP=36192.0000
SET MOVCSTP=36192.0000  ,MovCUni=36192.0000,MovSVlr=8*36192.0000
WHERE MSRESO = 'MQ0222124'
-- COMMIT;

SELECT MSCSTPRM,MSSldUni,MSSldVlr,* FROM MAESUM1 WHERE MSRESO = 'MQ0222124'
SELECT * FROM MAESUM1

BEGIN TRANSACTION;
UPDATE MAESUM1
--SET MSCSTPRM= 36192.0000
SET MSCSTPRM= 36192.0000  ,MSSldUni=8,MSSldVlr=8*36192.0000
WHERE MSRESO = 'MQ0222124'
-- COMMIT


-- TERCERO
SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO IN ('MQ0222125')

SELECT * FROM KARDEX WHERE MSRESO = 'MQ0222125'
SELECT * FROM KARDEX1 WHERE MSRESO = 'MQ0222125' ORDER BY BODEGA,MOVFCH  



BEGIN TRANSACTION;
UPDATE KARDEX
-- SET MOVCSTP=67280.0000
SET MOVCSTP=67280.0000 ,MovCUni=67280.0000,MovSVlr=1*67280.0000
WHERE MSRESO = 'MQ0222125'
-- COMMIT;

SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO = 'MQ0222125'
SELECT * FROM MAESUM1

BEGIN TRANSACTION;
UPDATE MAESUM1
--SET MSCSTPRM= 67280.0000
SET MSCSTPRM= 67280.0000  ,MSSldUni=1,MSSldVlr=1*67280.0000
WHERE MSRESO = 'MQ0222125'
-- COMMIT


-- CUARTO, HAY DOS BODEGAS 
SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO IN ('MQ0210120')

SELECT * FROM KARDEX WHERE MSRESO = 'MQ0210120'
SELECT * FROM KARDEX1 WHERE MSRESO = 'MQ0210120' ORDER BY BODEGA,MOVFCH  -- HAY PROBLEA  NO HAY VALOR INITARIO

BEGIN TRANSACTION;
UPDATE KARDEX
--SET MOVCSTP=63050.4300
SET MOVCSTP=63050.4300 ,MovCUni=63050.43000,MovSVlr=5*63050.4300
WHERE MSRESO = 'MQ0210120' AND BODEGA='08'
-- COMMIT;
-- ROLLBACK

SELECT MSCSTPRM,* FROM MAESUM1 WHERE MSRESO = 'MQ0222123'
SELECT * FROM MAESUM1

BEGIN TRANSACTION;
UPDATE MAESUM1
-- SET MSCSTPRM= 63050.4300
SET MSCSTPRM= 63050.4300  ,MSSldUni=5,MSSldVlr=5*63050.4300
WHERE MSRESO = 'MQ0210120'
-- COMMIT


