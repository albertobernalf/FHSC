SELECT COUNT(*) FROM HOSVINEW.TERCEROS; -- 339576	
SELECT COUNT(*) FROM HOSVITAL.TERCEROS; -- 339779	

SELECT TRCCOD,TRCNIT,TRCRAZSOC,TRCDIR, TRCTLF,  TRCEMAIL, TRCREGFIS, TRCRESFIS  
 FROM  HOSVITAL.TERCEROS
WHERE TRCCOD='830006404';

-- 

SELECT * FROM HOSVITAL.TERCEROS 

-- 0. Copia dela tabla TERCEROS

create table HOSVITAL.TERCEROS_20200601 AS (SELECT * FROM HOSVITAL.TERCEROS) with data;

create table HOSVINEW.TERCEROS_20200601 AS (SELECT * FROM HOSVITAL.TERCEROS) with data;

SELECT COUNT(*) FROM  HOSVINEW.TERCEROS1; 	
SELECT COUNT(*) FROM  HOSVINEW.TERCEROS_20200601; -- 339779
SELECT COUNT(*) FROM  HOSVINEW.TERCEROS1; 	 -- 339576	/ LISTO ACTUALIZADO


SELECT COUNT(*) FROM HOSVITAL.TERCEROS; -- 339779	
SELECT COUNT(*) FROM HOSVITAL.TERCEROS_20200601;  -- 339779	


--1. Actualizacion Masiva


UPDATE HOSVINEW.TERCEROS A
SET (TRCDIR, TRCTLF,  TRCEMAIL, TRCREGFIS, TRCRESFIS ) = (SELECT  X.TRCDIR, X.TRCTLF,  X.TRCEMAIL, X.TRCREGFIS, X.TRCRESFIS
				 FROM  HOSVITAL.TERCEROS X	
				WHERE X.TRCCOD=A.TRCCOD) 
WHERE A.TRCCOD='830006404';



-- Validacion


SELECT TRCCOD,TRCNIT,TRCRAZSOC,TRCDIR, TRCTLF,  TRCEMAIL, TRCREGFIS, TRCRESFIS  
 FROM  HOSVINEW.TERCEROS
WHERE TRCCOD='830006404';

select A.TRCCOD,A.TRCDIR, A.TRCTLF,  A.TRCEMAIL, A.TRCREGFIS, A.TRCRESFIS, B.TRCDIR, B.TRCTLF,  B.TRCEMAIL, B.TRCREGFIS, B.TRCRESFIS
from HOSVINEW.TERCEROS A
INNER JOIN HOSVITAL.TERCEROS B ON (B.TRCCOD=A.TRCCOD)
WHERE (A.TRCDIR <> B.TRCDIR ) OR (A.TRCTLF<> B.TRCTLF) OR (A.TRCEMAIL <> B.TRCEMAIL) OR (A.TRCREGFIS <> B.TRCREGFIS) OR (A.TRCRESFIS <> B.TRCRESFIS)
ORDER BY A.TRCCOD;