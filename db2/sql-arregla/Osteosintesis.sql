SELECT * FROM TMPFAC WHERE TFMENI='SURA SOAT' -- 7319406         CC

-- ORTAFOLIOS DE SUMINJSGROS =12


SELECT * FROM PORTARS1 WHERE PSCodi=12 AND MSRESO ='CUT022874779'

SELECT * FROM MAEATE3 WHERE MSRESO = ''
SELECT * FROM MAESUM1 WHERE MSRESO = 'CUT02287455' -- Tornillo
SELECT * FROM MAESUM1 WHERE MSRESO = '19934768-10' -- Tornillo

SELECT @@SERVERNAME

86082050  CC
80252508  CC

SELECT * FROM TMPFAC2 WHERE TFCEDU = '86082050' AND TFRESO IN ('CUT02286590','CUT02286562')
SELECT * FROM TMPFAC2 WHERE TFCEDU = '80252508' AND TFRESO IN ('CUT02286590','CUT02286562')

SELECT * FROM MAETPA2
select * from maeemp31 where mennit='SURA SOAT'
select * from maeemp32 where mennit='SURA SOAT'

SELECT * FROM MAEEMP3 WHERE MENNIT= 'SURA SOAT'


SELECT * FROM TMPFAC WHERE TFCedu = '80252508'
SELECT * FROM TMPFAC2 WHERE TFCedu = '80252508' AND TFRESO IN ('CUT02286590','CUT02286562')
SELECT * FROM MAESUM1 WHERE MSRESO IN  ('CUT02286590','CUT02286562')

SELECT * ROM M

select * from maeemp32 where mennit='PARTICULAR'

SELECT * FROM PORTARS1 WHERE MSRESO='CUT02286562' -- 443296
SELECT * FROM PORTARS1 WHERE PSCODI=12
SELECT * FROM PORTARS2 WHERE MSRESO= 'CUT02286562'


SELECT *FROM INGRESOS WHERE MPCEDU = '80252508'
SELECT  MPTipAfi,* FROM CAPBAS WHERE MPCEDU = '80252508'
SELECT * FROM MAEPAC  WHERE MPCEDU = '80252508'
SELECT * FROM MAEPAC WHERE 


SELECT * FROM PORTARS2 WHERE PSVALU1 = 443296


SELECT * FROM TMPFAC2 WHERE  TFRESO IN ('CUT02286590','CUT02286562')
SELECT * FROM MAEATE3 WHERE  MSRESO IN ('CUT02286590','CUT02286562')

SELECT * FROM MAEATE WHERE MPNFAC IN (1397723,
1645814,
2041659,
2125762,
2126548,
2156114,
2203878,
2268123,
1415970,
1858334,
1910926,
1968343,
2177772,
2203878,
2304626,
2337339,
2389815)


19465673	750222

SELECT * FROM MAEATE WHERE MPNFAC =2203878  --C ED :17166067    
BEGIN TRANSACTION;
UPDATE MAEATE SET   MAESTF=0 WHERE MPNFAC = 2337339
SELECT @@SERVERNAME
COMMIT

SELECT * FROM MOVCXC WHERE MCCNUMOBL = '2203878'
SELECT * FROM HOJOBL WHERE HojNumObl = '2203878'