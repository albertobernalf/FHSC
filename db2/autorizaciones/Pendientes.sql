select * from hosvital.audserv WHERE  AUTFECSOL >= '2020-07-01'   AND AUTCSC = 21953;
select * from hosvital.audserv  WHERE  AUTCSC IN (20729, 20733);
select * from hosvital.audserv3 WHERE  AUTCSC IN (20729, 20733);

select * from hosvital.audserv2 where  AUTSERVFCH >= '2020-01-01 00:00:00' AND autestreg='P';





SELECT A.DOCCOD, A.AUTCSC CONSECUTIVO,  A.AUTTIPDOC AS TIPO_DOC, A.AUTCEDU AS DOCUMENTO,C.MPNOMC AS PACIENTE, A.AUTFECSOL AS FECHA_SOLICITADO, A.AUTESTADO AS ESTADO1,A2.AUTSERV AS CODIGO ,M.PRNOMB AS DESCRIPCION
FROM HOSVITAL.AUDSERV A
INNER JOIN HOSVITAL.AUDSERV3 A2 ON (A2.DOCCOD= A.DOCCOD AND A2.AUTCSC=A.AUTCSC)
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = A.AUTTIPDOC AND C.MPCEDU=A.AUTCEDU)
INNER JOIN HOSVITAL.MAEPRO M ON (M.PRCODI = A2.AUTSERV)
WHERE A.DOCCOD = 'AU7' AND A.AUTFECSOL >= '2020-07-01' AND  A.AUTFECSOL <= '2020-07-28'    AND A.AUTTIP  IN ('P') AND A2.AUTCPTEST='P' AND A2.AUTSERVTIP IN ('P')  -- AND  A.AUTCEDU='1005342085'

UNION

SELECT A.DOCCOD, A.AUTCSC CONSECUTIVO,  A.AUTTIPDOC AS TIPO_DOC, A.AUTCEDU AS DOCUMENTO,C.MPNOMC AS PACIENTE, A.AUTFECSOL AS FECHA_SOLICITADO, A.AUTESTADO AS ESTADO1,A2.AUTSERV AS CODIGO,A2.AUTSERVDSC AS DESCRIPCION
FROM HOSVITAL.AUDSERV A
INNER JOIN HOSVITAL.AUDSERV3 A2 ON (A2.DOCCOD= A.DOCCOD AND A2.AUTCSC=A.AUTCSC)
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = A.AUTTIPDOC AND C.MPCEDU=A.AUTCEDU)
-- INNER JOIN HOSVITAL.MAESUM1 M ON (M.MSRESO = A2.AUTSERV)
WHERE A.DOCCOD = 'AU7' AND A.AUTFECSOL >= '2020-07-01' AND  A.AUTFECSOL <= '2020-07-28'   AND A2.AUTSERVTIP IN ('G','I')  AND A2.AUTCPTEST='P'  AND A.AUTTIP  IN ('G','I') -- AND A.AUTCEDU='1005342085'
ORDER BY 5;

SELECT * FROM HOSVITAL.MAESUM1 WHERE MSRESO='A06A D15 253350';