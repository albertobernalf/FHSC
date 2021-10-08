SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU ='51557653';  -- HAY DOS INGRESOS 1 Y 2

SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU ='51557653';
SELECT * FROM HOSVITAL.TMPFAC2 WHERE TFCEDU ='51557653' AND TFRESO = '0025MQ23-D';
SELECT * FROM HOSVITAL.TMPFAC2 WHERE TFCEDU ='51557653' AND TFRESO = '0025MQ25-D';


SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY = '51557653' AND FSMMSRESO  LIKE ('%006MQ%') ;  -- AND HICTVIN1 = 2;

--SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU = '51557653'

--SELECT * FROM HOSVITAL.FRMSMNS1 WHERE HISCKEY = '51557653' AND HICTVIN1 = 2 AND;

SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU = '51557653';

SELECT * FROM HOSVITAL.MAESUM1 WHERE MSNOMG LIKE ('%MACROGOTE%'); --0006MQ25       	
SELECT * FROM HOSVITAL.MAESUM1 WHERE MSNOMG LIKE ('%HOJ%BISTURI%'); --0025MQ23       	D. HOJA DE BISTURI N 15                                                                                                                                                                                                                                             	
-- Caso 2 estan Formulados pero no aparecen para desdpachar en farmacia

SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU ='17025430';  -- HAY DOS INGRESOS 1 Y 2
SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU ='17025430'; 
SELECT * FROM HOSVITAL.TMPFAC2 WHERE TFCEDU ='17025430' AND TFRESO = '0025MQ23-D';

-- Veamos formulacion
-- Lo que dice la formulacion sobre el despacho



SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY = '21107098' AND  FSMFHRREG >= '2019-04-13 00:00:00' ORDER BY FSMFHRREG;  --  AND FSMMSRESO  LIKE ('%0025MQ23%') ;   -- AND HICTVIN1 = 2;

SELECT  A.HISTIPDOC AS TIPO_DOC, A.HISCKEY Doc,A.HISCSEC Fol,A.FSMMSRESO Med,A.HISCANSUM Cant,A.HCFCHRDSP Despachada,A.HCSMAUT Aut,A.FSMDSCMDC,A.HCUserDsp UsuDesp,A.HCFcHrDsp Fecha_Despacho,
      A.HICtvIn INGRESO,B.HCFhHrAp AS Aplicado,B.ASUsuApl UsuAplica, B.ASUsuSus UsuSusp, B.ASFecPApl AS Aplica
from  HOSVITAL.FRMSMNS A, HOSVITAL.FRMSMNS1 B
WHERE  A.HISTIPDOC = B.HISTIPDOC AND A.HISCKEY = B.HISCKEY AND A.HISCSEC=B.HISCSEC AND
	A.MSCodi = B.MSCodi AND A.MSPrAc = B.MSPrAc AND A.MSForm = B.MSForm AND A.CncCd = B.CncCd AND
              A.HISCKEY = '21107098' AND  A.FSMFHRREG >= '2019-04-13 00:00:00' 
ORDER BY A.FSMFHRREG;

--Lo qu dicen los despachos que vuienen desde la formulacion


SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY = '21107098' ;
SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY = '21107098' ;


SELECT  A.HISTipDoc TIPO_DOC,A.HISCKEY DOCUMENTO, A.HISCSEC FOLIO, A.MSRESO MEDICAMENTO, A.DSmCntDsp Q_DESP,A.DSmCntSol Q_SOL,A.DSmEst ESTADO,
	A.DSmFch FECHA_DESPACHO,A.DSmUsrReg USUARIO,A.DSmCntDes Q_DESPACHADA,A.DSmCntDev q_DEVUELTA, A.DSmUltCns CONSECUTIVO,A.DSCtvIn INGRESO,
	A.DsTipDes TIPO_DESPACHO
FROM HOSVITAL.DSPFRMC A
WHERE A.HISCKEY = '21107098'
ORDER BY A.HISCSEC;

-- Si junto la Formulacion  con el despacho este seria el Query

SELECT  A.HISTIPDOC AS TIPO_DOC, A.HISCKEY Doc,A.HISCSEC Fol,A.FSMMSRESO Med,A.HISCANSUM Cant,A.HCFCHRDSP Despachada,A.HCSMAUT Aut,A.FSMDSCMDC,A.HCUserDsp UsuDesp,A.HCFcHrDsp Fecha_Despacho,
      A.HICtvIn INGRESO,B.HCFhHrAp AS Aplicado,B.ASUsuApl UsuAplica, B.ASUsuSus UsuSusp, B.ASFecPApl AS Aplica,
	C.DSmCntDsp Q_DESP,C.DSmCntSol Q_SOL,C.DSmEst ESTADO,
	C.DSmFch FECHA_DESPACHO,C.DSmUsrReg USUARIO,C.DSmCntDes Q_DESPACHADA,C.DSmCntDev q_DEVUELTA, C.DSmUltCns CONSECUTIVO,C.DSCtvIn INGRESO,
	C.DsTipDes TIPO_DESPACHO
from  HOSVITAL.FRMSMNS A, HOSVITAL.FRMSMNS1 B, HOSVITAL.DSPFRMC C
WHERE  A.HISTIPDOC = B.HISTIPDOC AND A.HISCKEY = B.HISCKEY AND A.HISCSEC=B.HISCSEC AND
	A.MSCodi = B.MSCodi AND A.MSPrAc = B.MSPrAc AND A.MSForm = B.MSForm AND A.CncCd = B.CncCd AND
              B.HISTIPDOC = C.HISTIPDOC AND B.HISCKEY = C.HISCKEY AND B.HISCSEC=C.HISCSEC AND  C.MSRESO = A.FSMMSRESO  AND A.HISCKEY = '21107098' AND A.FSMFHRREG >= '2019-04-13 00:00:00' 
ORDER BY A.FSMFHRREG;



SELECT  A.HISTIPDOC AS TIPO_DOC, A.HISCKEY Doc,A.HISCSEC Fol,
A.FSMMSRESO MSRESO,A.HISCANSUM Cant,A.HCFCHRDSP Despachada,A.HCSMAUT Aut,A.FSMDSCMDC,A.HCUserDsp UsuDesp,A.HCFcHrDsp Fecha_Despacho,
      A.HICtvIn INGRESO,C.DSmCntDsp Q_DESP,
C.DSmCntSol Q_SOL,C.DSmEst ESTADO,

	C.DSmFch FECHA_DESPACHO,C.DSmUsrReg USUARIO,C.DSmCntDes Q_DESPACHADA,C.DSmCntDev q_DEVUELTA, C.DSmUltCns CONSECUTIVO,C.DSCtvIn INGRESO,
	C.DsTipDes TIPO_DESPACHO, c1.DSmCnsMov as consecutivoDespacho, c1.DSmTpoTrn as tipo_trn
from  HOSVITAL.FRMSMNS A
--inner join HOSVITAL.FRMSMNS1 B on (B.HISTIPDOC=A.HISTIPDOC  and  B.HISCKEY=A.HISCKEY and B.HISCSEC  =A.HISCSEC )
inner join  HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=A.HISTIPDOC AND C.HISCKEY=A.HISCKEY AND C.HISCSEC= A.HISCSEC AND  C.MSRESO = A.FSMMSRESO)
left join hosvital.dspfrmc1 c1  ON (C1.HISTIPDOC=A.HISTIPDOC  AND  C1.HISCKEY=A.HISCKEY AND C1.HISCSEC=A.HISCSEC AND C1.MSRESO = A.FSMMSRESO)
WHERE A.FSMMSRESO= '0280J01C' AND A.HISCKEY  = '21107098' AND A.FSMFHRREG >= '2019-04-13 00:00:00'  
ORDER BY A.FSMFHRREG ;


SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY = '21107098' AND HISCSEC =  2548 AND FSMMSRESO= '0280J01C'; -- Aqui la formualcion
SELECT * FROM HOSVITAL.FRMSMNS1 WHERE HISCKEY = '21107098' AND HISCSEC =  2548 AND  MSCODI='J01C' AND MSPRAC='R01' AND MSFORM='72' AND CNCCD='40';  -- Aqui laplaneacion y la aplicacion
SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY = '21107098' AND HISCSEC =  2548 AND MSRESO= '0280J01C'; -- Aqui el despacho
SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY = '21107098' AND HISCSEC =  2548 AND MSRESO= '0280J01C'; -- Aqui  elmovimiento Y SI HAY DEVOLCVION


-- Super Query Detalle de movimientos

select fr.histipdoc,fr.hisckey,fr.hiscsec,fr.fsmmsreso,fr.hictvin as ingreso,fr.fsmmsreso as medicamento,m.msnomg as nombre_medicamento,dsp.dsmcntdsp as Qdesp_Bodega,dsp.dsmest as estado,dsp.dsmfch as fecha_despacho,dsp.DSmCntDev q_DEVUELTA, dsp1.DSmTpoTrn as tipo_trn,dsp1.DSmCnsMov as consecutivoDespacho,dsmcntmov as q_movimiento
from hosvital.frmsmns fr
left join hosvital.dspfrmc dsp on (dsp.histipdoc=fr.histipdoc and dsp.hisckey=fr.hisckey and dsp.hiscsec=fr.hiscsec and dsp.msreso = fr.fsmmsreso)
--left join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=fr.histipdoc and dsp1.hisckey=fr.hisckey and dsp1.hiscsec=fr.hiscsec and dsp1.msreso = fr.fsmmsreso )
inner join hosvital.maesum1 m on (m.msreso= fr.fsmmsreso)
where  fr.hisckey= '21107098' and  fr.hiscsec = 2548 and fr.fsmmsreso='0280J01C'
order by fr.hiscsec;

-- Segundo Query Movimientos de despachos-devoluciones totales

select fr.histipdoc as tipo_doc,fr.hisckey as documento,fr.hiscsec as folio,fr.hictvin as ingreso,fr.fsmmsreso as cod_med,m.msnomg as nombre_medicamento,dsp.dsmcntdsp as Qdesp_Bodega,dsp.dsmest as estado,dsp.dsmfch as fecha_despacho,
'DS' as tx1,
(select sum(dsp2.dsmcntmov)
from hosvital.dspfrmc1 dsp2
where dsp2.histipdoc=dsp.histipdoc and dsp2.hisckey=dsp.hisckey and dsp2.hiscsec=dsp.hiscsec and dsp2.msreso=dsp.msreso and dsp2.DSmTpoTrn='DS' ),
'DV' as tx2,
(select sum(dsp2.dsmcntmov)
from hosvital.dspfrmc1 dsp2
where dsp2.histipdoc=dsp.histipdoc and dsp2.hisckey=dsp.hisckey and dsp2.hiscsec=dsp.hiscsec and dsp2.msreso=dsp.msreso and dsp2.DSmTpoTrn='DV' )
from hosvital.frmsmns fr
left join hosvital.dspfrmc dsp on (dsp.histipdoc=fr.histipdoc and dsp.hisckey=fr.hisckey and dsp.hiscsec=fr.hiscsec and dsp.msreso = fr.fsmmsreso)
--left join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=fr.histipdoc and dsp1.hisckey=fr.hisckey and dsp1.hiscsec=fr.hiscsec and dsp1.msreso = fr.fsmmsreso )
inner join hosvital.maesum1 m on (m.msreso= fr.fsmmsreso)
where  fr.hisckey= '10225939'   and fr.FSMFHRREG >= '2019-04-01 00:00:00'  and fr.fsmmsreso='0018MQ25'  
order by fr.hiscsec;


SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY = '10225939' AND FSMMSRESO= '0018MQ25';  -- Aqui la formualcion
SELECT * FROM HOSVITAL.FRMSMNS1 WHERE HISCKEY = '21107098' AND HISCSEC =  2548 AND  MSCODI='J01C' AND MSPRAC='R01' AND MSFORM='72' AND CNCCD='40';  -- Aqui laplaneacion y la aplicacion
SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY = '10225939'  AND MSRESO= '0018MQ25';  -- Aqui  elmovimiento Y SI HAY DEVOLCVION
SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY = '10225939'  AND MSRESO= '0018MQ25'; 


-- tercer Query Movimientos de despachos-devoluciones totales VENTA DIRECTA

select dsp.histipdoc as tipo_doc,dsp.hisckey as documento,dsp.hiscsec as folio,dsp.dsctvin as ingreso,dsp.msreso as cod_med,m.msnomg as nombre_medicamento,dsp.dsmcntdsp as Qdesp_Bodega,dsp.dsmest as estado,dsp.dsmfch as fecha_despacho,
'DS' as tx1,
(select sum(dsp2.dsmcntmov)
from hosvital.dspfrmc1 dsp2
where dsp2.histipdoc=dsp.histipdoc and dsp2.hisckey=dsp.hisckey and dsp2.hiscsec=dsp.hiscsec and dsp2.msreso=dsp.msreso and dsp2.DSmTpoTrn='DS' ),
'DV' as tx2,
(select sum(dsp2.dsmcntmov)
from hosvital.dspfrmc1 dsp2
where dsp2.histipdoc=dsp.histipdoc and dsp2.hisckey=dsp.hisckey and dsp2.hiscsec=dsp.hiscsec and dsp2.msreso=dsp.msreso and dsp2.DSmTpoTrn='DV' )
from hosvital.dspfrmc dsp
left join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey and dsp1.hiscsec=dsp.hiscsec and dsp1.msreso = dsp.msreso )
inner join hosvital.maesum1 m on (m.msreso= dsp.msreso)
where  dsp.hisckey= '10225939'    and dsp.msreso='0018MQ25'   and dsp.hiscsec=333
group by dsp.histipdoc ,dsp.hisckey ,dsp.hiscsec ,dsp.dsctvin ,dsp.msreso,m.msnomg ,dsp.dsmcntdsp,dsp.dsmest ,dsp.dsmfch 
order by dsp.hiscsec;

SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY = '40355546'  AND MSRESO= '0312J01E' ORDER BY DSNUMDOC  ;   --AND DSNUMDOC ='1188708'; 
SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY = '40355546'  AND MSRESO= '0312J01E' AND HISCSEC= 275;
SELECT * FROM HOSVITAL.FRMSMNS WHERE HISCKEY = '40355546'   AND HISCSEC= 275 AND  FSMMSRESO= '0312J01E';
SELECT * FROM HOSVITAL.FRMSMNS1 WHERE HISCKEY = '40355546'   AND HISCSEC= 275 ;
-- Kardex, Karini, Lotesum, lotesum1 y movin4 

select * from hosvital.karini  where msreso = '0018MQ25';;
select * from hosvital.lotesum where msreso = '0018MQ25';
select * from hosvital.lotesum1 where msreso = '0018MQ25';
select * from hosvital.movinv4  where mvtodocpac= '10225939' ;

select * from hosvital.kardex where 