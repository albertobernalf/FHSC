SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU ='20120204';

UPDATE  HOSVITAL.INGRESOS 
SET INGINSLC='S'
WHERE MPCEDU ='20120204' AND INGCSC=1;
