SELECT * FROM INGRESOS WHERE INGNUMCIT = 2091299  -- ANULADA HOY ,.:KP<:K  	2016-12-19 06:56:20.000	dep                                                                                                                                                                                                                                             
SELECT * FROM CTRLCITAS WHERE CITNUM = 2091299  -- ATENDIDA 2016-11-25 / 2016-11-30
SELECT * FROM HCCOM1 WHERE HISCKEY= '6636061' AND HCtvIn1 =229
SELECT HCtvIn1,* FROM HCCOM1 WHERE HISCKEY= '6636061' ORDER BY HISCSEC
SELECT * FROM HCCOM1 WHERE HISCKEY= '6636061' AND HisCitNum = 2091299  -- NO HAY DE LA CITA
SELECT HCtvIn1,* FROM HCCOM1 WHERE HISCKEY= '6636061'
-- EL INRESOM229 CORRESPO DERIA AL 2016-11-10/2016-11-09  -- NO HAY FOLIO EN CEROS
SELECT * FROM HCCOM1 WHERE HISCKEY= '6636061' AND HisCitNum = 0 