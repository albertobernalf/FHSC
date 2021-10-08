
-- DESDE 1301 HASTA 13067501

SELECT * FROM CUENTAS
WHERE CNTCOD LIKE ('1301%') AND CNTVIG=2016 -- 33

SELECT * FROM CUENTAS
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  -- 199
 }



SELECT * FROM CUENTAS
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  AND CNTINT = 'CXC'-- 97
ORDER BY CNTCOD

SELECT * FROM BKP.CUENTAS_20161213_AB -- EL ORIGINAL

-- Primero Backup de la tabla cuentas
SELECT *
INTO BKP.CUENTAS_20161213_AB 
FROM CUENTAS ;


-- Segundo ... BAckup de las que estan CXC, para luego regresarlas


BEGIN TRANSACTION;
SELECT INTO 
 BKP.CUENTAS_20161213_AB_PARCIAL
FROM  CUENTAS
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  AND CNTINT = 'CXC' AND cnttrm= 'D' -- 97 FILAS,, 
-- Valida select * from BKP.CUENTAS_20161213_AB_PARCIAL
-- COMMIT;	
-- ROLLBACK;

-- Tercero ... Update de las cuentas CXC a No aplica ANTES PRIMER PASO

BEGIN TRANSACTION;
UPDATE DBO.CUENTAS
SET CNTINT='N/A' --ESTABA CXC
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  AND CNTINT = 'CXC' AND cnttrm= 'D'
-- ROLLBACK
-- valida 
SELECT CNTINT,* FROM DBO.CUENTAS
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  AND CNTINT = 'N/A' AND cnttrm= 'D' --deben dar 97  -- Y EN TOTAL 199 entre tota y detalle._
                                                                                                  -- uuy pero me dio 0 cerop
-- COMMIT;
-- ROLLBACK;

-- Ojo ESTO ES nuevo es una cuenta al que hay que quitarle el impuetso

-- 51378

select CNTIMP,* from cuentas where  CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD ='13070501'  AND CNTINT = 'N/A' AND cnttrm= 'D'

begin transaction;
update DBO.cuentas
set cntimp='N' -- estaba en s
where  CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD ='13070501'  AND CNTINT = 'N/A' AND cnttrm= 'D'
-- commit
-- rollback


-- Cuarto se AVISA , SEGUNDO PASO listop


-- Quinto se regresa de estado d N/A a CXC

BEGIN TRANSACTION;
UPDATE DBO.CUENTAS
SET CNTINT='CXC' --ESTABA CXC
FROM CUENTAS a, BKP.CUENTAS_20161213_AB_PARCIAL b
WHERE a.cntvig=2016 and
      a.cntvig= b.cntvig and a.cntcod=b.cntcod and a.cntdsc=b.cntdsc and a.cntint='N/A' and b.cntint='CXC' and
     a.CNTCOD >='1301' AND a.CNTCOD <='13067501' AND a.cnttrm= 'D'
-- Verificacion :

SELECT * FROM CUENTAS WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD <='13067501'  AND CNTINT = 'CXC' ORDER BY CNTCOD -- deben haber 97
	  
-- COMMIT;
-- ROLLBACK;

-- se regresa a la cuante el 's' de impuesto

-- 53111
begin transaction;
update DBO.cuentas
set cntimp='S'
where  CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD ='13070501'  AND CNTINT = 'N/A' AND cnttrm= 'D'
-- commit
-- rollback

-- Valido

select CNTIMP,* from cuentas where  CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD ='13070501'  AND CNTINT = 'N/A' AND cnttrm= 'D'


-----------------------------------------------------------------------------------------------
-- FIN PROCESO
-----------------------------------------------------------------------------------------------

-- Validaciom

SELECT cntimp FROM CUENTAS
WHERE CNTVIG=2016 AND CNTCOD >='1301' AND CNTCOD ='13070501'  AND CNTINT = 'N/A' AND cnttrm= 'D' 


-----------------------------------------------------------------------------------------------
-- FIN PROCESO
-----------------------------------------------------------------------------------------------

