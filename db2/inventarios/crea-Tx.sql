SELECT DSPF.HISTIPDOC, DSPF.HISCKEY, PACI.MPNOMC, DSPF.HISCSEC, DSPF.MSRESO,SUMI.MSNOMG,DSPF.DSMCNTDSP, DATE(DSPF.DSMFCH)
 FROM HOSVITAL.DSPFRMC DSPF
 INNER JOIN HOSVITAL.MAESUM1 SUMI ON SUMI.MSRESO = DSPF.MSRESO INNER JOIN HOSVITAL.CAPBAS PACI ON ( (PACI.MPTDOC = DSPF.HISTIPDOC) AND (PACI.MPCEDU = DSPF.HISCKEY)) WHERE  (DATE(DSPF.DSMFCH)  >=  '2020-08-01'  AND DATE(DSPF.DSMFCH) <=  '2020-09-30' ) AND SUMI.MSRESO IN ('0361J04B','0360J04B', '0369J06B  ', '0010NP02' ,  '0400J06B ' ,'0011J05A');

SELECT * FROM HOSVITAL.BODUSR WHERE AUSRID='ADOLARA';

SELECT * FROM HOSVITAL.BODUSR 
WHERE AUSRID='1015445738';

SELECT * FROM HOSVITAL.TRANINV1 WHERE AUSRID='ADOLARA';
SELECT * FROM HOSVITAL.TRANINV1 WHERE AUSRID='1015445738';

INSERT INTO HOSVITAL.TRANINV1
SELECT EMPCOD,TRANCOD,TRANAPL, '1015445738'
FROM HOSVITAL.TRANINV1 WHERE AUSRID='ADOLARA' AND (TRANCOD,TRANAPL) NOT IN (SELECT TRANCOD,TRANAPL FROM HOSVITAL.TRANINV1 WHERE AUSRID='1015445738');