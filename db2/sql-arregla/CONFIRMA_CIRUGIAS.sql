-- Paso 0. LA SOLICITUD

-- Buco el documento de identidad del paciente

SELECT * FROM CAPBAS WHERE MPNOMC LIKE ('%CRISTINA%ISABEL%GARZON%CASTILLO%')
select * from capbas where mpcedu = '5103662'

-- Busco por Documento del paciente
SELECT * FROM MAEATE WHERE MPCEDU = '1075661328' ORDER BY MACTVING
SELECT * FROM TMPFAC WHERE TFCEDU = '1073154152'

-- Consulat por docunmento de identidad

SELECT PROESTA,PROFEC,PROFSEP,* FROM PROCIR WHERE MPCEDU = '1073154152'  ORDER BY PROFEC
SELECT * FROM PROCIR1 WHERE PROCIRCOD = 54560

19428270  
-- Busco por Numero de Cirugia Paciente

SELECT PROCIRCOD,PROESTA FROM PROCIR WHERE procircod in  (66509         ) 
SELECT * FROM PROCIR WHERE procircod in  (70560         )  -- "2016-05-17 01:21:26"   "ME921"
SELECT * FROM PROCIR1 WHERE procircod in  (70560         ) 
SELECT * FROM PROCIR2 WHERE procircod in  (70560         )
SELECT * FROM DESCIRMED  WHERE CODCIR in  (70560         )
SELECT * FROM DESCIRMED1  WHERE CODCIR in  (70560         )

-- Busco si el paciente esta Activo

SELECT * FROM TMPFAC  WHERE TFCEDU = '19135513'
SELECT * FROM TMPFAC1 WHERE TFCEDU = '19135513'
SELECT * FROM MAEPRO WHERE PRCODI = '542100'

-- PARA PREGUNTAR SI HAY FACTURAS DESPUES DE LA CIRUGIA

SELECT * FROM MAEATE WHERE MPCEDU ='19135513' AND FACFCH >= '2009-08-07'

-- SOLO PASO ESTADOS DE REALIZADO A CONFIRMADO Y NO VISCEVERSA	
-- SE PASA DE 4 = REALIZADA A 2 = CONFIRMADA

BEGIN TRANSACTION;
UPDATE procir
SET proesta=2
WHERE PROCIRCOD   in    (78252    	 ) 
--   	COMMIT										,,
--   rollback;	 	
SELECT PROCIRCOD,proesta FROM PROCIR WHERE procircod in   (78252   	 ) 
SELECT * FROM MAEATE WHERE MPCEDU = '1073154152'  ORDER BY MACTVING
		
SELECT * FROM DESCIRMED -- LIMIT 100
WHERE CODCIR IN   (65365 ,65376 , 65589           )

SELECT * FROM DESCIRMED1 -- LIMIT 100
WHERE CODCIR IN  (63328,63327,63326 ,63329     )

-- commit
-- ROLLBACK;
53567
53892
SELECT * FROM PROCIR1 WHERE  procircod in (64941 , 64966  )
SELECT * FROM PROCIR WHERE  procircod in (64941 , 64966  )
SELECT * FROM HCCOM1 WHERE HISCKEY = '80550257' AND HISCSEC IN (87,53)

SELECT * FROM MAEATE WHERE MPCEDU = '80550257' ORDER BY MACTVING