SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU='20143533';  --HAY 2 INGRESOS
SELECT * FROM HOSVITAL.FRMSMNS1  WHERE HISCKEY='20143533';
SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY='20143533' ORDER BY FSMMSRESO ;
SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY='20143533' AND FSMMSRESO = 'N01B001060';
SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU ='20143533';  --IMNGRESO NRO 2 DE AYER 2019-04-10 09:49:23.000000

SELECT * FROM HOSVITAL.TMPFAC2 WHERE TFCEDU = '20143533' AND TFRESO = 'N01B001060';
SELECT * FROM HOSVITAL.MAESUM1 WHERE MSRESO ='N01B001060';

SELECT * FROM HOSVITAL.MAESUM1 WHERE MSNOMG LIKE ('%LIDOCAINA%');  -- 0459N01B       	

	