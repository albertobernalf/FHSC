
SELECT *  FROM HOSVITAL.PEDPAQQX WHERE PROCIRCOD>=116790 ORDER BY PROCIRCOD;
SELECT *  FROM HOSVITAL.PEDPAQQX1 WHERE PROCIRCOD=116790;
SELECT *  FROM HOSVITAL.PEDPAQQX1 WHERE PROCIRCOD>=116790 ORDER BY PROCIRCOD;

SELECT *FROM HOSVITAL.KARDEX1 WHERE  MOVFCH >='2019-09-20 00:00:00' AND MOVCODPAC='41347585' ORDER BY MOVFCH;

SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY='41347585' ORDER BY DSMFCH;

SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY='41347585'  ORDER BY DSMFHRMOV;