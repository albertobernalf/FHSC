SELECT * FROM HOSVITAL.TERCEROS;

SELECT  COUNT(*)  -- 5916	
 FROM HOSVITAL.TERCEROS 
WHERE TRCEMAIL IS  NOT NULL;

-- 334200	
SELECT  TRCCOD,TRCRAZSOC,  TRCDIR, TRCTLF, TRCEMAIL   FROM HOSVITAL.TERCEROS  WHERE TRCEMAIL IS  NULL;

SELECT  TRCCOD,TRCRAZSOC,  TRCDIR, TRCEMAIL   FROM HOSVITAL.TERCEROS  WHERE TRCEMAIL IS NOT  NULL;


SELECT  COUNT(*)   FROM HOSVITAL.TERCEROS  WHERE TRCDIR IS   NULL;  -- 79	DIRECCIONES FALTAN
SELECT  COUNT(*)   FROM HOSVITAL.TERCEROS  WHERE TRCTLF IS   NULL;  -- 344	TELEFONOSMFALTAN
SELECT  COUNT(*)   FROM HOSVITAL.TERCEROS WHERE TRCEMAIL IS   NULL;  -- 5916

SELECT TRCREGFIS, TRCRESFIS, COUNT(*)
FROM HOSVITAL.TERCEROS
GROUP BY TRCREGFIS, TRCRESFIS;

