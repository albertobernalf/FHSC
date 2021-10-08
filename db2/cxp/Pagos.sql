
-- Pagos

SELECT A.MCDPTO AS SEDE,A.DOCCOD AS DOC, A.MVCNRO AS NUMERO, A.MVCCFCH AS FECHA_MOV, A.MVCMES AS MES_MOV, A.MVCANIO AS A�O, A.TRCCOD AS NIT, T.TRCRAZSOC AS RAZON_SOCIAL,
 A.MVCDOCRF1 AS OBLIGACION, P.PRVCON AS SUBGRUPO, P.PRVCRGCON AS GRUPO, A.MVCVLRLC AS VALOR, A.MVCNAT AS NAT, B.MVCEST AS ESTADO_DOC, B.MVCCPT AS OBSERVACIONES
FROM HOSVITAL.MOVCONT2 A
INNER JOIN HOSVITAL.MOVCONT3  B ON (A.EMPCOD= B.EMPCOD AND A.MCDPTO = B.MCDPTO AND A.MVCNRO = B.MVCNRO AND A.DOCCOD = B.DOCCOD )
INNER JOIN HOSVITAL.TERCEROS T ON (A.TRCCOD = T.TRCCOD) 
INNER JOIN HOSVITAL.PROVEEDOR1 P ON (T.TRCCOD = P.PRVCOD AND A.TRCCOD = T.TRCCOD)
WHERE A.DOCCOD IN ('CEG', 'ACH') AND A.MVCANIO IN ('2018','2019') AND A.DOCCOD='ACH' AND A. MVCNRO = 901
order bY A.doccod, A.MVCNRO;

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='ACH' AND MVCNRO = 901;

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD='830037248';
SELECT * FROM HOSVITAL.PROVEEDOR1 WHERE PRVCOD='830037248';	


-- Compras

SELECT   C.MCDPTO AS SEDE, C.DOCCOD AS DOCUMETO, C.ORDENRO AS NUM_ORD, DATE(C.ORDEFCH) AS FECHA, C.PRVCOD AS NIT, T.TRCRAZSOC AS PROVEEDOR, C1.ORDECNT AS CANT, C1.ORDEVLRU AS VLR_UNIT, C1.ORDETTAL AS VLR_TOTAL, C.ORDEEST AS ESTADO
FROM (HOSVITAL.COMPCAB C
INNER JOIN HOSVITAL.TERCEROS T ON C.PRVCOD = T.TRCCOD) 
INNER JOIN HOSVITAL.COMPCAB2 C1 ON (C1.ORDENRO = C.ORDENRO) AND (C.DOCCOD = C1.DOCCOD) AND (C1.MCDPTO = C.MCDPTO) AND (C.EMPCOD = C1.EMPCOD)
WHERE C.ORDEEST<>'A' AND YEAR(C.ORDEFCH) IN ('2018','2019')
UNION ALL
SELECT O.MCDPTO AS SEDE,O.DOCCOD, O.ORDTRBNRO, DATE(O.ORDTRBFCH), O.PRVCOD, T.TRCRAZSOC, O1.ORDTRBCNT, O1.ORDTRVLRU, O1.ORDTRTOTS, O.ORDTRBEST
FROM HOSVITAL.ORDTRAB1 O1
 INNER JOIN (HOSVITAL.ORDTRAB  O
INNER JOIN HOSVITAL.TERCEROS T ON O.PRVCOD = T.TRCCOD) ON (O1.ORDTRBNRO = O.ORDTRBNRO) AND (O1.DOCCOD = O.DOCCOD) AND (O1.MCDPTO = O.MCDPTO) AND (O1.EMPCOD = O.EMPCOD)
WHERE O.ORDTRBEST<>'A' AND YEAR(O.ORDTRBFCH) IN ('2018','2019')



