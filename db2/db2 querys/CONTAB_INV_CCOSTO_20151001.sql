﻿-- SAL (4595275, 4595276, 4595291, 4595292, 4595293, 4595295,  4595294, 4595297, 4595296, 4595299, 4595298,4595300, 4595301, 4595302, 4595304 ,4595303, 4595305,
   4595306 ,  4595360 , 4595361)

select * from movinv4 WHERE DOCCOD='ENT' AND DOCNRO in (167716)

begin transaction;
UPDATE MOVINV4 
SET MVTOCENCOS='20102'
WHERE DOCCOD='ENT' AND DOCNRO in (167716) 

-- COMMIT;



SELECT * FROM MOVINV3 WHERE DOCCOD='SAL' AND DOCNRO in (4568619, 4597920 , 4597919)

-- Documento de paciente
select * from movinv4 WHERE DOCCOD='SAL' AND DOCNRO in (4597921,)

SELECT doccod,docnro,mvtodocpac,mvtotdopac,mvtocencos FROM MOVINV4 WHERE DOCCOD='SAL' AND DOCNRO  in (4595275, 4595276, 4595291, 4595292, 4595293, 4595295,  4595294, 4595297, 4595296, 4595299, 4595298,4595300, 4595301, 4595302, 4595304 ,4595303, 4595305,
   4595306 ,  4595360 , 4595361)

-- Query que evalua el centro de costo a colocar, veamos pues

SELECT A.MPNFAC,A.MPCEDU,A.MPTDOC,A.MACTVING ,A.FACFCH
FROM MAEATE A
WHERE A.MPCEDU= '1057014158'
ORDER BY A.MACTVING

-- Si esta facturado
SELECT MPNFAC,MSRESO,BODEGA,MSSCODI,MABODENT, MACENCOS FROM MAEATE3 WHERE MPNFAC = 2179387

SELECT A.FACFCH,B.MAFCSU, A.MPCEDU,A.MPTDOC,A.MACTVING ,B.MSRESO,B.MACENCOS,B.MABODENT,C.MPCNCDSC,C.MPCNCCOD
FROM MAEATE A, MAEATE3 B, MAEPAB C
WHERE A.MPCEDU= '1105782397' AND A.MPNFAC=B.MPNFAC AND C.MPBODEGA=B.MABODENT
ORDER BY A.FACFCH


SELECT * FROM MAEPAB WHERE MPCODP=28
SELECT * FROM TMPFAC2 LIMIT 100

-- Si es estado de cuenta actual

SELECT A.TFCEDU,A.TFTDOC,A.TMCTVING ,B.TFRESO,B.TFCENCOS,A.TFCCODPAB,C.MPCNCDSC,C.MPCNCCOD,B.TFFCSU
FROM TMPFAC A, TMPFAC2 B, MAEPAB C
WHERE A.TFCEDU= '1057014158' AND A.TFCEDU=B.TFCEDU AND A.TFTDOC=B.TFTDOC AND
    C.MPCODP=A.TFCCODPAB
ORDER BY A.TMCTVING

SELECT * FROM INGRESOMP WHERE MPCEDU  = '1105782397' ORDER BY INGCSC
select * from maepab where mpcodp=28


begin transaction;
UPDATE MOVINV4 
SET MVTOCENCOS='20302'
WHERE DOCCOD='SAL' AND DOCNRO in (4595275, 4595276, 4595291, 4595292, 4595293, 4595295,  4595294, 4595297, 4595296, 4595299, 4595298,4595300, 4595301, 4595302, 4595304 ,4595303, 4595305,
   4595306 ,  4595360 , 4595361)
-- 	;

----------------------------------------
-- ahora veamos documentos ent
----------------------------------------