select * from hosvital.maepro where prnomb like ('%COLECIS%');
SELECT * FROM HOSVITAL.MAEATE2;


-- Detalle

SELECT M2.MPNFAC,CAP.MPTDOC,CAP.MPCEDU,CAP.MPNOMC,PRCODI,MAFEPR,M2.MAHONCOD,MACANPR,MAVATP,M2.MAVLRTOT,M2.FCPTPOTRN
FROM HOSVITAL.MAEATE2 M2
INNER JOIN HOSVITAL.MAEATE M ON (M.MPNFAC= M2.MPNFAC)
INNER JOIN HOSVITAL.CAPBAS CAP ON (CAP.MPTDOC=M.MPTDOC AND CAP.MPCEDU=M.MPCEDU)
WHERE M2.MAFEPR >= '2019-10-01 00:00:00' AND M2.MAFEPR <= '2019-11-30 00:00:00'  AND M2.FCPTPOTRN IN ('F','H') AND M2.MAESANUP <>'S' AND M2.PRCODI IN (SELECT PRCODI  from hosvital.maepro where prnomb like ('%COLECIS%'));

-- Por Procedimiento

SELECT M2.PRCODI, MAE.PRNOMB  , SUM(M2.MAVATP)
FROM HOSVITAL.MAEATE2 M2
INNER JOIN HOSVITAL.MAEATE M ON (M.MPNFAC= M2.MPNFAC)
INNER JOIN HOSVITAL.CAPBAS CAP ON (CAP.MPTDOC=M.MPTDOC AND CAP.MPCEDU=M.MPCEDU)
INNER JOIN HOSVITAL.MAEPRO MAE ON (MAE.PRCODI= M2.PRCODI AND MAE.prnomb like ('%COLECIS%'))
WHERE M2.MAFEPR >= '2019-10-01 00:00:00' AND M2.MAFEPR <= '2019-11-30 00:00:00'  AND M2.FCPTPOTRN IN ('F','H') AND M2.MAESANUP <>'S' 
GROUP BY M2.PRCODI,MAE.PRNOMB;


-- Gran total


SELECT  SUM(M2.MAVATP)
FROM HOSVITAL.MAEATE2 M2
INNER JOIN HOSVITAL.MAEATE M ON (M.MPNFAC= M2.MPNFAC)
INNER JOIN HOSVITAL.CAPBAS CAP ON (CAP.MPTDOC=M.MPTDOC AND CAP.MPCEDU=M.MPCEDU)
INNER JOIN HOSVITAL.MAEPRO MAE ON (MAE.PRCODI= M2.PRCODI AND MAE.prnomb like ('%COLECIS%'))
WHERE M2.MAFEPR >= '2019-10-01 00:00:00' AND M2.MAFEPR <= '2019-11-30 00:00:00'  AND M2.FCPTPOTRN IN ('F','H') AND M2.MAESANUP <>'S' ;