SELECT * FROM HOSVITAL.MAESUM1;
SELECT * FROM HOSVITAL.MAESUMN;
SELECT * FROM HOSVITAL.DSPFRMC;  -- CABEXOTE
SELECT * FROM HOSVITAL.DSPFRMC1;  -- WHERE DSMFCH>= '2019-09-01' ; -- DSNUMDOC


SELECT M1.MSRESO,M1.MSNOMG,

FROM  HOSVITAL.MAESUMN MN 

INNER JOIN HOSVITAL.DSPFRMC DSP ON (DSP.MSRESO=M1.MSRESO)
INNER JOIN HOSVITAL.DSPFRMC1 DSP1 ON (DSP1.HISTIPDOC=DSP.HISTIPDOC AND DSP1.HISCKEY=DSP.HISCKEY AND DSP1.HISCSEC=DSP.HISCSEC AND DSP1.MSRESO=DSP.MSRESO)
WHERE  DSP.DSMFCH >= '2019-09-01 00:00:00' AND MN.MSPOSX='1';


SELECT YEAR(DSP.DSMFCH),MONTH(DSP.DSMFCH)  ,DAY( DSP.DSMFCH),  M1.MSRESO,M1.MSNOMG,
(
SELECT SUM(DSMCNTMOV)
FROM  HOSVITAL.DSPFRMC1 DSP1
WHERE DSP1.DSMFHRMOV>='2019-09-01 00:00:00' AND  DSP1.DSMFHRMOV<='2019-09-30 00:00:00' AND DSP1.MSRESO=M1.MSRESO AND DSP1.DSMTPOTRN='DS' AND 
              YEAR(DSP1.DSMFHRMOV) = YEAR(DSP.DSMFCH) AND MONTH(DSP1.DSMFHRMOV) = MONTH(DSP.DSMFCH) AND DAY(DSP1.DSMFHRMOV) = DAY(DSP.DSMFCH) 
)
FROM  HOSVITAL.MAESUMN MN 
INNER JOIN HOSVITAL.MAESUM1 M1 ON (M1.MSCODI=MN.MSCODI AND M1.MSPRAC=MN.MSPRAC AND M1.CNCCD=MN.CNCCD AND M1.MSFORM=MN.MSFORM)
INNER JOIN HOSVITAL.DSPFRMC DSP ON (DSP.MSRESO=M1.MSRESO)
WHERE  MN.MSPOSX='1'
GROUP BY YEAR(DSP.DSMFCH),MONTH(DSP.DSMFCH)  ,DAY( DSP.DSMFCH),   M1.MSRESO,M1.MSNOMG ;



SELECT YEAR(DSP1.DSMFHRMOV)  ANO,MONTH(DSP1.DSMFHRMOV) MES  ,DAY(DSP1.DSMFHRMOV) DIA ,DSP1.MSRESO,M1.MSNOMG MEDICAMENTO ,SUM(DSMCNTMOV)
FROM  HOSVITAL.DSPFRMC1 DSP1
INNER JOIN HOSVITAL.MAESUM1 M1 ON (M1.MSRESO= DSP1.MSRESO)
WHERE  DSP1.MSRESO=M1.MSRESO AND DSP1.DSMTPOTRN='DS' AND 
 DSP1.DSMFHRMOV>='2019-08-01 00:00:00' AND  DSP1.DSMFHRMOV<='2019-08-31 00:00:00'  AND (M1.MSCODI,M1.MSPRAC,M1.CNCCD,M1.MSFORM) IN (SELECT MN.MSCODI,MN.MSPRAC,MN.CNCCD,MN.MSFORM FROM HOSVITAL.MAESUMN MN WHERE MN.MSPOSX='1')
GROUP BY  YEAR(DSP1.DSMFHRMOV) ,MONTH(DSP1.DSMFHRMOV) ,DAY(DSP1.DSMFHRMOV) ,DSP1.MSRESO,M1.MSNOMG
ORDER BY  YEAR(DSP1.DSMFHRMOV)  ,MONTH(DSP1.DSMFHRMOV) ,DAY(DSP1.DSMFHRMOV) ,DSP1.MSRESO,M1.MSNOMG;

          select * from hosvital.dspfrmc1 where  DSMFHRMOV>='2019-09-01 00:00:00' AND  DSMFHRMOV<='2019-09-30 00:00:00' and msreso='0001A07A'       	;