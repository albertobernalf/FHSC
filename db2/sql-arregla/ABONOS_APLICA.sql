-- Solicitud

SELECT * FROM ABONOS WHERE MPCEDU = '66725247' ORDER BY ABONUM

sELECT * FROM ABONOS WHERE MPCEDU = '20456309  '
select * from capbas where MPNOMC LIKE ('%ELENA%IZQUIE%')
SELECT mpcedu,mptdoc,mpnomc FROM CAPBAS WHERE MPCEDU = '1125598100'

select * from abonos where abofch >= '2014-11-01'

-- Consulta_1

select * from abonos1 -- LIMIT 1000
WHERE abonum = 520912


select * from abonos -- LIMIT 1000
WHERE abonum = 520912

BEGIN TRANSACTION;
UPDATE ABONOS
SET ABODET1='PSIQUIATRIA'
WHERE abonum = 520912
-- ROLLBACK
-- COMMIT

588778 2404035
591311 2404035
593887 2404035


SELECT * FROM ABONOS WHERE ABONUM >= 680770 ORDER BY ABONUM
SELECT * FROM ABONOS WHERE ABONUM >= 680769 ORDER BY ABONUM
SELECT * FROM ABONOS WHERE  MPCEDU= '1072656140' AND ABOVLR=35000

SELECT * FROM ABONOS where abonum in (680626                                            )		aND abodel=0 and	 ABONUM NOT IN  -- ""41674930       "    "
(SELECT ABONUM FROM MAEATE4)

RC 600326 Paciente CC 4146820
RC 574379 Paciente CC 1027282505
RC 580448 Paciente CC 1110517674	
C 548201 Aplicado en factura No 2205045

SELECT * FROM TMPFAC WHERE TFCEDU = '17111499'
SELECT * FROM TMPFAC4 WHERE TFCEDU = '1072656140'
SELECT * FROM TMPFAC4 WHERE ABONUM = 680626     

SELECT * FROM CAPBAS WHERE MPCEDU = '1013263517' -- TIENE RC Y TI
SELECT * FROM CAPBAS WHERE MPCEDU = '1110517674' -- 

select abonum,mpcedu,abovlr,aboapl,abosdo,abodel from abonos where mpcedu = '37546482 ' 
select * from maeate where mpcedu = '1013100350' ORDER BY MACTVING

-- Consulta de Abonos en cuentas activas y/o facturas

select mpnfac,maestf from maeate where mpnfac = 2290313 

SELECT * FROM MAEATE4 WHERE ABONUM = 680626                     -- 21800 / 141900.00
SELECT MAESTF,* FROM MAEATE WHERE MPNFAC = 2341816  -- NO ESTA ANULADA
SELECT * FROM REFACT WHERE REFATNUM = 2207112
select * from tmpfac4 where abonum = 650364

-- rcaja nro 606352 aplicado en factura nro 2296217 /  valor 8616952 / 10609920


              -- FAVT NTO 2221562/552897 ,, 2221562/552902
select * from maeate4 where ABONUM = 593887     -- 562953
SELECT * FROM ABONOS WHERE ABONUM = 613148
	

begin transaction; delete from 	 tmpfac4 where abonum = 521640;end;
begin transaction; delete from 	 tmpfac4 where abonum = 521640;end;

-- Actualizacion

BEGIN TRANSACTION;
UPDATE ABONOS
SET ABOSDO=ABOAPL, ABOAPL=0  -- 26800- 3700 = 23100 -- ESTABA APLICADO 26800
WHERE ABONUM IN   (680626                   ) AND ABOSDO=0 AND abonum not in (select abonum from MAEATE4)
-- ROLLBACK
--   COMMIT			

-- Otra forma de Actualizar

BEGIN TRANSACTION;
UPDATE ABONOS
SET ABOSDO=0 , ABOAPL=50900  -- 26800- 3700 = 23100 -- ESTABA APLICADO 26800
WHERE ABONUM IN   (675427     )
-- ROLLBACK
--   COMMIT	

	
BEGIN TRANSACTION;
DELETE FROM MAEATE4 WHERE abonum in (526095                              ) 
-- COMMIT;


SELECT * FROM MAEATE4 WHERE ABONUM = 545601  
SELECT * FROM INGRESOS WHERE MPCEDU = '1072658589' order by ingcsc
SELECT * FROM MAEATE   WHERE MPCEDU = '28375862' order by mactving -- ced: "2992949        "

SELECT * FROM TMPFAC WHERE TFCEDU = '1072658589' -- ""COMP POS AMB ""
SELECT * FROM TMPFAC1 WHERE TFCEDU = '215702' -- "COMP POS AMB "
SELECT * FROM TMPFAC2 WHERE TFCEDU = '215702'
create table  tmpfac4_abono_510218 as SELECT * FROM TMPFAC4 WHERE ABONUM = 510218
SELECT * FROM TMPFAC4 WHERE TFCEDU = '1125598100'
begin transaction;
delete from tmpfac4 where ABONUM = 510218
-- commit


begin transaction;
update tmpfac1
set tfnitp='PARTICULAR'
WHERE TFCEDU = '215702'

-- COMMIT

SELECT * FROM TMPFAC2 WHERE TFCEDU = '413454'
	

SELECT * FROM MAEATE WHERE MPNFAC IN (1816012,1820377)

SELECT * FROM TMPFAC4 WHERE ABONUM IN (429759 )

SELECT * FROM TMPFAC4 WHERE TFFCHA >= '2014-02-10'

BEGIN TRANSACTION;
UPDATE TMPFAC4
SET TFVALA=8900
WHERE ABONUM IN (404375    )
-- COMMIT



select * from tmpfac where tfcedu='20013091'
select * from maeate where mpcedu = '2992949' order by mactving

SELECT * FROM TMPFAC1 WHERE TFCEDU = '2992949' 
SELECT * FROM TMPFAC2 WHERE TFCEDU = '2992949' 
SELECT * FROM TMPFAC WHERE TFCEDU = '2992949' -- CC  -- "COLM.ALTA    "

SELECT * FROM MAEATE WHERE MPCEDU = '2992949' AND  MACTVING=70


SELECT  * FROM AUDSERV  -- LIMIT 10 
WHERE AUTCEDU = '2992949'

 
begin transaction;
update tmpfac
set tfmeni= 'PARTICULAR'
WHERE TFCEDU = '2992949'
-- COMMIT

--
BEGIN TRANSACTION;
UPDATE TMPFAC1 
SET TFNITP='PARTICULAR'
WHERE TFCEDU = '1018469660'
-- ROLLBACK;
-- COMMIT

-- Veamos los contratos del paciente

SELECT * FROM MA
EPAC WHERE MPCEDU = '20891739'

-- Aqui se copian los abonos a procesar :

SELECT * FROM TMPFAC WHERE TFCEDU = '1011203736' -- CLAPRO=8
SELECT * FROM TMPFAC1 WHERE TFCEDU = '246030'
SELECT * FROM TMPFAC2 WHERE TFCEDU = '246030'


-- Solucion
-- 526524, 522914, 523597, 525254


BEGIN TRANSACTION;
UPDATE ABONOS
SET ABOSDO=ABOAPL, ABOAPL=0  -- 26800- 3700 = 23100 -- ESTABA APLICADO 26800
WHERE ABONUM IN   (575597    ) AND ABOSDO=0 AND abonum not in (select abonum from MAEATE4)
-- ROLLBACK
--   COMMIT	

-- OTRO CASOP

BEGIN TRANSACTION;
UPDATE ABONOS
SET ABOSDO=362600, ABOAPL=0  -- 26800- 3700 = 23100 -- ESTABA APLICADO 26800
WHERE ABONUM IN   (541617 )
-- ROLLBACK
--   COMMIT	





-- Consultas auxiliares
9900.00;"2015-07-15";1690.00;0.00;8210.00
SELECT * FROM CAPBAS WHERE MPNOMC LIKE ('%MARIA%INES%BELTRAN%')

select * from refact where refatnum  = 1753268 -- 20332016
select * from refact1 where refatnum = 1753268 -- para refacturar


BEGIN TRANSACTION;
UPDATE TMPFAC4
SET TFNITA= 'HOSP/UR/CX',TFVALA=113000
WHERE ABONUM IN (338096)
-- ROLLBACK;
-- COMMIT


select * from desencriptar ('.,ÑB.<<,  ');

SELECT  * FROM MOVCONT2 WHERE DOCCOD='AJT' AND MVCNRO = 4830

-- consulta abonos

select * from maeate4 limit 100
select abonum,mpcedu,abovlr,aboapl,abosdo,abodel from abonos where mpcedu = '37546482'  -- hay 23 registros


select a.abonum,a.mpcedu,a.abovlr,a.aboapl,a.abosdo,a.abodel,b.mpnfac,b.afcvlrabo
from abonos a, maeate4 b
where a.abonum= b.abonum  and a.mpcedu = '37546482' 
order by a.abonum -- hay 33 registros  /   



-- 10609920
	

begin transaction;
update abonos
set abosdo = 2907904
where abonum = 606352
-- commit

select * from maeate2 where mpnfac = 2296217
select * from maeate where mpnfac = 2296217

select * from maeate4 where mpnfac = 2296217


