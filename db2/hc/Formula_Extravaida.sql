SELECT * FROM  HOSVITAL.FRMSMNS WHERE HISCKEY = '41483516';
SELECT * FROM  HOSVITAL.FRMSMNS1 WHERE HISCKEY = '41483516';

select * from hosvital.ingresos  where mpcedu  in ('41483516','19154041') ;

SELECT h.histipdoc, h.hisckey,h.hiscsec,h.hictvin, h.FSMMSRESO FROM  HOSVITAL.FRMSMNS h WHERE   h.FSMFHRREG>= '2021-02-01 00:00:00' AND h.FSMMSRESO='0029MQ23' AND h.FSMINDAMB='A';

select * from hosvital.ingresos i where (i.mptdoc,i.mpcedu,i.ingcsc)  in
(
SELECT h.histipdoc, h.hisckey,h.hiscsec FROM  HOSVITAL.FRMSMNS h WHERE h.histipdoc=i.mptdoc and h.hisckey=i.mpcedu and h .hictvin = i.ingcsc and  h.FSMFHRREG>= '2021-02-01 00:00:00' AND h.FSMMSRESO='0029MQ23' AND h.FSMINDAMB='A');


select * from hosvital ingresos where (histipdoc, hisckey,hiscsec)  in
(SELECT  FROM  HOSVITAL.FRMSMNS  WHERE HISCKEY IN ('41483516','19154041') AND  FSMFHRREG>= '2021-02-01 00:00:00' AND FSMMSRESO='0029MQ23' AND FSMINDAMB='A');

UPDATE HOSVITAL.FRMSMNS  -- estaba lancetas apra toma de glñucometria                                                                                                                                                                                                                        	
SET HISCOBSFOR='lancetas  para toma de glucometria'
WHERE HISCKEY = '41483516' AND HISCSEC=1;