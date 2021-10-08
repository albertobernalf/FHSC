select * from hosvital.movinv4 WHERE DOCCOD in ('IEI','ISI','IEA') AND MVTOCENCOS ='' order by    fchmvt -- and fchmvt >='2019-01-01 00:00:00';

select * from hosvital.docucon;

select * from hosvital.movinv3 limit 100;

SELECT MPNFAC,MSRESO,BODEGA,MSSCODI,MABODENT, MACENCOS FROM hosvital. MAEATE3 WHERE MPNFAC >= 10000;

select * from hosvital.maeate where facfch >= '2019-03-28' order by mpnfac;

-- Documento de paciente
select * from hosvital.movinv4 WHERE DOCCOD='SAL' AND DOCNRO in (4597921);

SELECT doccod,docnro,mvtodocpac,mvtotdopac,mvtocencos FROM hosvital.MOVINV4 WHERE DOCCOD='SAL' AND DOCNRO  in (4595275, 4595276, 4595291, 4595292, 4595293, 4595295,  4595294, 4595297, 4595296, 4595299, 4595298,4595300, 4595301, 4595302, 4595304 ,4595303, 4595305,
   4595306 ,  4595360 , 4595361);

-- Query que evalua el centro de costo a colocar, veamos pues

SELECT A.MPNFAC,A.MPCEDU,A.MPTDOC,A.MACTVING ,A.FACFCH
FROM hosvital.MAEATE A
WHERE A.MPCEDU= '1057014158'
ORDER BY A.MACTVING

-- Si esta facturado
SELECT MPNFAC,MSRESO,BODEGA,MSSCODI,MABODENT, MACENCOS FROM hosvital.MAEATE3 WHERE MPNFAC = 2179387;

SELECT A.FACFCH,B.MAFCSU, A.MPCEDU,A.MPTDOC,A.MACTVING ,B.MSRESO,B.MACENCOS,B.MABODENT,C.MPCNCDSC,C.MPCNCCOD
FROM hosvital.MAEATE A, hosvital.MAEATE3 B, hosvital.MAEPAB C
WHERE A.MPCEDU= '1105782397' AND A.MPNFAC=B.MPNFAC AND C.MPBODEGA=B.MABODENT
ORDER BY A.FACFCH;


SELECT * FROM MAEPAB WHERE MPCODP=28
SELECT * FROM TMPFAC2 LIMIT 100;

-- Si es estado de cuenta actual

SELECT A.TFCEDU,A.TFTDOC,A.TMCTVING ,B.TFRESO,B.TFCENCOS,A.TFCCODPAB,C.MPCNCDSC,C.MPCNCCOD,B.TFFCSU
FROM hosvital.TMPFAC A, hosvital.TMPFAC2 B, hosvital.MAEPAB C
WHERE A.TFCEDU= '1057014158' AND A.TFCEDU=B.TFCEDU AND A.TFTDOC=B.TFTDOC AND
    C.MPCODP=A.TFCCODPAB
ORDER BY A.TMCTVING;

SELECT * FROM hosvital.INGRESOMP WHERE MPCEDU  = '1105782397' ORDER BY INGCSC
select * from hosvital.maepab where mpcodp=28;


select * from hosvital.movinv4 where doccod='ISI' and docnro = 1147844; --F0318  / 0225PU01      , 	
select * from hosvital.docucon where doccod='ISI';   --ISI	SALIDA DE INVENTARIO                                        	


select * from hosvital.movinv4 where doccod='ISI' and mvtodocpac = '' and fchmvt >= '2019-03-01 00:00:00'