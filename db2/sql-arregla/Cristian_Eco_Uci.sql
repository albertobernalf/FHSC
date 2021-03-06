SELECT * FROM REPEXC1 WHERE  REPDSC LIKE ('%ECO%')


-- Ecocardiogramas Uci


SELECT A.HISFHORAT AS ATENCION,B.MPTDOC AS TIPO_DOC ,B.MPCEDU AS DOCUMENTO, B.MPNOMC AS PACIENTE,A.HISCSEC AS FOLIO, F.MENOME AS ESPECIALIDAD,
D.DMNOMB AS DIAGNOSTICO,
CASE WHEN C.HCDXCLS=0 THEN 'RELACIONADO' ELSE 'PRINCIPAL' END AS TIPO_DX
FROM HCCOM1 A , CAPBAS B, HCDIAGN C, MAEDIA D, MAEESP F , INGRESOMP T
WHERE A.HISFHORAT>= '2016-01-01' AND  A.HISFHORAT<= '2016-10-31' AND
     A.HISTIPDOC=B.MPTDOC AND A.HISCKEY=B.MPCEDU AND
      A.HISTIPDOC=C.HISTIPDOC AND A.HISCKEY=C.HISCKEY AND A.HISCSEC=C.HISCSEC AND C.HCDXCOD=DMCODI AND
         A.HISTIPDOC=T.MPTDOC AND 
          A.HISCKEY=T.MPCEDU AND A.HCTVIN1=T.INGCSC AND T.INGCTVMOP IN (SELECT MAX(H.INGCTVMOP) FROM INGRESOMP H
                                                                        WHERE H.MPTDOC=T.MPTDOC AND H.MPCEDU=T.MPCEDU AND H.INGCSC=T.INGCSC AND
                                                                              H.INGCODPAB IN (6,7,25))

--  Veamos el query para Ecocardiogramas

SELECT * FROM HCCOM51
SELECT * FROM HCCOM5
SELECT * FROM MAEPRO WHERE PRNOMB LIKE ('%ECOCARD%')

SELECT A.HISFHORAT AS ATENCION,B.MPTDOC AS TIPO_DOC ,B.MPCEDU AS DOCUMENTO, B.MPNOMC AS PACIENTE,A.HISCSEC AS FOLIO, F.MENOME AS ESPECIALIDAD,
D.DMNOMB AS DIAGNOSTICO,X.PRCODI,X.PRNOMB,
CASE WHEN C.HCDXCLS=0 THEN 'RELACIONADO' ELSE 'PRINCIPAL' END AS TIPO_DX
FROM HCCOM1 A , CAPBAS B, HCDIAGN C, MAEDIA D, MAEESP F , INGRESOMP T, HCCOM51 U, MAEPRO X
WHERE A.HISFHORAT>= '2016-01-01' AND  A.HISFHORAT<= '2016-11-30' AND
     A.HISTIPDOC=U.HISTIPDOC AND A.HISCKEY=U.HISCKEY AND  A.HISCSEC= U.HISCSEC AND U.HCTVIN51=A.HCtvIn1 AND
	 U.HCPRCCOD=X.PRCODI AND X.PRNOMB LIKE ('%ECOCAR%') AND 
     A.HISTIPDOC=B.MPTDOC AND A.HISCKEY=B.MPCEDU AND
      A.HISTIPDOC=C.HISTIPDOC AND A.HISCKEY=C.HISCKEY AND A.HISCSEC=C.HISCSEC AND C.HCDXCOD=D.DMCODI AND
         A.HISTIPDOC=T.MPTDOC AND 
          A.HISCKEY=T.MPCEDU AND A.HCTVIN1=T.INGCSC AND T.INGCTVMOP IN (SELECT MAX(H.INGCTVMOP) FROM INGRESOMP H
                                                                        WHERE H.MPTDOC=T.MPTDOC AND H.MPCEDU=T.MPCEDU AND H.INGCSC=T.INGCSC AND
                                                                              H.INGCODPAB IN (6,7,25))
     AND A.HCESP = F.MECODE 
    ORDER BY A.HISFHORAT ,A.HISTIPDOC,A.HISCKEY,A.HISCSEC 

SELECT * FROM MAEESP
SP_HELP MAEDIA
SP_HELP HCDIAGN
SELECT * FROM MAEDIA
SELECT * FROM HCCOM51 WHERE HISCKEY = '1072717342' AND HISCSEC=2 --881234  
SELECT * FROM HCCOM1 WHERE HISCKEY= '1072717342' AND HISCSEC=2
SELECT * FROM HCDIAGN WHERE HISCKEY= '1072717342'


-- EL REPORT

SELECT A.HISFHORAT AS ATENCION,B.MPTDOC AS TIPO_DOC ,B.MPCEDU AS DOCUMENTO, B.MPNOMC AS PACIENTE,A.HISCSEC AS FOLIO, F.MENOME AS ESPECIALIDAD,D.DMNOMB AS DIAGNOSTICO,
X.PRCODI,X.PRNOMB,CASE WHEN C.HCDXCLS=0 THEN 'RELACIONADO' ELSE 'PRINCIPAL' END AS TIPO_DX FROM HCCOM1 A , CAPBAS B, HCDIAGN C, MAEDIA D, MAEESP F , INGRESOMP T, HCCOM51 U, MAEPRO X 
WHERE A.HISFHORAT>='2016-01-01' AND A.HISFHORAT<='2016-11-30' AND A.HISTIPDOC=U.HISTIPDOC AND A.HISCKEY=U.HISCKEY AND  A.HISCSEC= U.HISCSEC AND U.HCTVIN51=A.HCtvIn1 AND U.HCPRCCOD=X.PRCODI AND
 X.PRNOMB LIKE '%ECOCAR%' AND A.HISTIPDOC=B.MPTDOC AND A.HISCKEY=B.MPCEDU AND A.HISTIPDOC=C.HISTIPDOC AND A.HISCKEY=C.HISCKEY AND A.HISCSEC=C.HISCSEC AND
  C.HCDXCOD=D.DMCODI AND A.HISTIPDOC=T.MPTDOC AND A.HISCKEY=T.MPCEDU AND A.HCTVIN1=T.INGCSC AND T.INGCTVMOP IN (SELECT MAX(H.INGCTVMOP) 
  FROM INGRESOMP H WHERE H.MPTDOC=T.MPTDOC AND H.MPCEDU=T.MPCEDU AND H.INGCSC=T.INGCSC AND H.INGCODPAB IN (6,7,25)) AND A.HCESP = F.MECODE 
ORDER BY A.HISFHORAT ,A.HISTIPDOC,A.HISCKEY,A.HISCSEC


SELECT * FROM INGRESOMP WHERE MPCEDU = '23174245' AND INGCODPAB IN (6,7,25)
SELECT HCtvIn1,HisFHorAt,* FROM HCCOM1 WHERE HISCKEY= '23174245'AND HISCSEC=68 -- INGRESO NRO 6
SELECT * FROM HCCOM5 WHERE HISCKEY = '23174245'AND HISCSEC IN (68,88) AND HCPrcCod='881234'
SELECT * FROM HCCOM51 WHERE HISCKEY = '23174245'AND HISCSEC IN (68,88) AND HCPrcCod='881234'


SELECT * FROM MAEPRO WHERE PRCODI IN ('881234' ,  '903439',   '881234' ,  '902209'  ) 

-- Este es el ultimo Query :
-- Cristian Ecos ...


SELECT A.HISTIPDOC,A.HISCKEY,B.MPNOMC, A.HISCSEC,R.HCESP,D.MENOME,C.PRCODI,C.PRNOMB,
A.HCFCHRORD, A.HCFCHRAP, A.HCPrcHrRe,W.INGCODPAB,Y.MPNOMP 
FROM HCCOM51 A,CAPBAS B, MAEPRO C,MAEESP D, HCCOM5 X, HCCOM1 R, INGRESOMP W, MAEPAB Y 
WHERE A.HCFCHRORD>='2016-01-01' AND A.HCFCHRORD<='2016-11-30' AND A.HCPRCCOD = C.PRCODI AND C.PRNOMB LIKE ('%ECOCAR%') 
  AND A.HISTIPDOC=X.HISTIPDOC AND A.HISCKEY=X.HISCKEY AND A.HISCSEC =  
 X.HISCSEC AND A.HCPRCCOD= X.HCPRCCOD AND 
 A.HISTIPDOC=B.MPTDOC AND A.HISCKEY=B.MPCEDU AND
  A.HCPRCCOD = C.PRCODI AND R.HCESP = D.MECODE AND A.HISTIPDOC=R.HISTIPDOC AND
   A.HISCKEY=R.HISCKEY AND A.HISCSEC =  R.HISCSEC AND W.MPTDOC=A.HISTIPDOC AND 
   W.MPCEDU=A.HISCKEY AND W.INGCSC=A.HCTVIN51 AND Y.MPCODP=W.INGCODPAB AND W.INGCODPAB IN (6,7,25) 
   AND A.HCFCHRORD BETWEEN W.INGFECMOP AND W.INGFECMOE 
   ORDER BY A.HISTIPDOC,A.HISCKEY,B.MPNOMC, A.HISCSEC

   --Crstian TAC



   SELECT A.HISTIPDOC,A.HISCKEY,B.MPNOMC, A.HISCSEC,R.HCESP,D.MENOME,C.PRCODI,C.PRNOMB,A.HCFCHRORD, A.HCFCHRAP, A.HCPrcHrRe,W.INGCODPAB,Y.MPNOMP 
FROM HCCOM51 A,CAPBAS B, MAEPRO C,MAEESP D, HCCOM5 X, HCCOM1 R, INGRESOMP W, MAEPAB Y 
WHERE A.HCFCHRORD>='2016-01-01' AND A.HCFCHRORD<='2016-11-30' AND A.HCPRCCOD IN  ('871410',
'873710','873720','8791','879111','879112','879113','879116','879121','879122','879131','879161','8792','879201',
'879205','879301','879391','8794','879410','879420','879421','879430','879460','8795','879510','879520','879522','879523','879910')
  AND A.HISTIPDOC=X.HISTIPDOC AND A.HISCKEY=X.HISCKEY AND A.HISCSEC =  
 X.HISCSEC AND A.HCPRCCOD= X.HCPRCCOD AND A.HISTIPDOC=B.MPTDOC AND A.HISCKEY=B.MPCEDU AND
  A.HCPRCCOD = C.PRCODI AND R.HCESP = D.MECODE AND A.HISTIPDOC=R.HISTIPDOC AND
   A.HISCKEY=R.HISCKEY AND A.HISCSEC =  R.HISCSEC AND W.MPTDOC=A.HISTIPDOC AND 
   W.MPCEDU=A.HISCKEY AND W.INGCSC=A.HCTVIN51 AND Y.MPCODP=W.INGCODPAB AND W.INGCODPAB IN (1) 
   AND A.HCFCHRORD BETWEEN W.INGFECMOP AND W.INGFECMOE 
   ORDER BY A.HISTIPDOC,A.HISCKEY,B.MPNOMC, A.HISCSEC

   SELECT * FROM INGRESOMP WHERE INGCODPAB IN (1)


