SELECT * FROM HOSVITAL.MAEATE WHERE MPNFAC =509758 ;
SELECT MPNFAC, FACFCH,MAESTF, MATOTF , MASALCXC,MPCEDU  FROM HOSVITAL.MAEATE WHERE MPNFAC =509758 ;
SELECT * FROM HOSVITAL.ADGLOSAS WHERE MPNFAC = 509758;
SELECT * FROM HOSVITAL.ADGLOSAS1 WHERE MPNFAC = 509758;
SELECT GLOEDOITNT FROM HOSVITAL.ADGLOSAS1 WHERE MPNFAC = 509758;

SELECT * FROM HOSVITAL.ADMGLO11 WHERE  MPNFAC = 509758;

UPDATE  HOSVITAL.ADGLOSAS1 
SET GLOEDOITNT='P'
WHERE MPNFAC = 509758;

CREATE TABLE HOSVITAL.ADGLOSAS_509758 AS (SELECT * FROM HOSVITAL.ADGLOSAS WHERE MPNFAC = 509758) WITH DATA;
CREATE TABLE HOSVITAL.ADGLOSAS1_509758 AS (SELECT * FROM HOSVITAL.ADGLOSAS1 WHERE MPNFAC = 509758) WITH DATA;

SELECT * FROM  HOSVITAL.ADGLOSAS1_509758 ;


DELETE FROM HOSVITAL.ADGLOSAS WHERE MPNFAC = 509758;
DELETE FROM HOSVITAL.ADGLOSAS1 WHERE MPNFAC = 509758;