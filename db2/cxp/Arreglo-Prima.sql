SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CEG' AND MVCNRO=33077;

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='CEG' AND MVBNROCMP  IN (33077,31759);
SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='CEG' AND MVBNROCMP  IN (33077,31759);


SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='CEG';


UPDATE   HOSVITAL.MOVCONT2
SET  CNTCOD='11200501'
WHERE DOCCOD='CEG' AND MVCNRO=33077 AND MVCCSC=1;

SELECT  * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='CEG'AND NIMCNRO= 33077;

UPDATE   HOSVITAL.NIMOVCON2
SET  NICNTCOD='11200501'
WHERE DOCCOD='CEG' AND NIMCNRO=33077 AND NIMC2CSC=1;