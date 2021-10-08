--Muestra los registros con diferencia entre movcont2 y movcxp, solamente se visualizan registros que existan en movcont2 y movcxp
select m2.empcod, m2.doccod, m2.mvcnro, m2.mcdpto, m2.mvccsc, m2.MvCCFch, m2.cntcod, m2.trccod, m2.MvCDocRf1, m2.cntvig, m2.mvcvlr, mcp.MvCxPNuOb as ObligacionMovCxP, mcp.MvCxPVal as ValorMovCxP, mcp.MvCxPCsc
from movcont2 m2, movcxp mcp
where (m2.empcod = mcp.empcod) and (m2.doccod = mcp.doccod) and (m2.mvcnro = mcp.mvcxpnro) and (m2.mcdpto = mcp.mcdpto) and (m2.MvCCsc = mcp.MvCxPCsc) and (m2.cntvig = mcp.cntvig)
and m2.mvcvlr <> mcp.mvcxpval
ORDER BY M2.EMPCOD, M2.DOCCOD, M2.MVCNRO, M2.MCDPTO, M2.MVCCSC  -- 73 Registros

--Muestra los registros con diferencia entre movcont2 y movcxp
--las 11 primeras columnas corresponden a movcont2, si estas columnas estan vacias no hay registro en contabilidad
--las 7 ultimas columnas corresponden a movcxp
select m2.empcod, m2.doccod, m2.mvcnro, m2.mcdpto, m2.mvccsc, m2.MvCCFch, m2.cntcod, m2.trccod, m2.MvCDocRf1, m2.cntvig, m2.mvcvlr, mcp.empcod, mcp.doccod, mcp.MvCxPNro, mcp.mcdpto, mcp.MvCxPCsc, mcp.MvCxPNuOb as ObligacionMovCxP, mcp.MvCxPVal as ValorMovCxP
from movcont2 m2
right join movcxp mcp
on (m2.empcod = mcp.empcod) and (m2.doccod = mcp.doccod) and (m2.mvcnro = mcp.mvcxpnro) and (m2.mcdpto = mcp.mcdpto) and (m2.MvCCsc = mcp.MvCxPCsc) and (m2.cntvig = mcp.cntvig)
and m2.mvcvlr <> mcp.mvcxpval
ORDER BY M2.EMPCOD, M2.DOCCOD, M2.MVCNRO, M2.MCDPTO, M2.MVCCSC  -- 297595

-- La cnsuklta Dw, pero unida por la cuenta y el tercero
SELECT * FROM MOVCXP
select * from movcont2

--Muestra los registros con diferencia entre movcont2 y movcxp, solamente se visualizan registros que existan en movcont2 y movcxp
select m2.empcod, m2.doccod, m2.mvcnro, m2.mcdpto, m2.mvccsc, m2.MvCCFch, m2.cntcod, m2.trccod, m2.MvCDocRf1, m2.cntvig, m2.mvcvlr, mcp.MvCxPNuOb as ObligacionMovCxP, mcp.MvCxPVal as ValorMovCxP, mcp.MvCxPCsc
from movcont2 m2, movcxp mcp
where (m2.empcod = mcp.empcod) and (m2.doccod = mcp.doccod) and (m2.mvcnro = mcp.mvcxpnro) and (m2.mcdpto = mcp.mcdpto)  --(m2.MvCCsc = mcp.MvCxPCsc) 
and (m2.cntvig = mcp.cntvig) AND m2.CntCod=mcp.CntCod and mcp.MvCxPNat=m2.mvcnat AND mcp.prvcod= m2.trccod
and m2.mvcvlr <> mcp.mvcxpval
ORDER BY M2.EMPCOD, M2.DOCCOD, M2.MVCNRO, M2.MCDPTO, M2.MVCCSC  

select m2.empcod, m2.doccod, m2.mvcnro, m2.mcdpto, m2.mvccsc, m2.MvCCFch, m2.cntcod, m2.trccod, m2.MvCDocRf1, m2.cntvig, m2.mvcvlr, mcp.MvCxPNuOb as ObligacionMovCxP, mcp.MvCxPVal as ValorMovCxP, mcp.MvCxPCsc
from movcont2 m2, movcxp mcp
where (m2.empcod = mcp.empcod) and (m2.doccod = mcp.doccod) and (m2.mvcnro = mcp.mvcxpnro) and (m2.mcdpto = mcp.mcdpto)  --AND (m2.MvCCsc = mcp.MvCxPCsc) 
and (m2.cntvig = mcp.cntvig) AND m2.CntCod=mcp.CntCod and mcp.MvCxPNat=m2.mvcnat AND mcp.prvcod= m2.trccod   --and mcp.MvCxPNuOb= m2.MvCDocRf1
and m2.mvcvlr <> mcp.mvcxpval AND m2.CntVig=2016 AND m2.DOCCOD not in ('1') AND mcp.mvcxpvaL<> 0
ORDER BY M2.EMPCOD, M2.DOCCOD, M2.MVCNRO, M2.MCDPTO, M2.MVCCSC   -- ME DAN 11/3 CON CRUCE DO REFERENCIA / SIN EL DOC.REFERENCIA ME DAN 403/395 / CON TCE 120615 Registros

SELECT * FROM DOCUCON WHERE DOCCOD='1'
SELECT * FROM MOVCXP WHERE MvCxPNuOb= '2013831478' -- Pregunta el cero es error si o nop
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=13262 AND CntCod= '23354501'


SELECT B.DOCCOD,b.mvcnro, SUM(b.mvcvlr), SUM(mvcxpvaL), ( SUM(b.mvcvlr) -  SUM(mvcxpvaL)) AS DIF
FROM MOVCXP A, MOVCONT2 B
WHERE A.empcod=B.empcod and A.doccod=B.doccod and A.mvcxpnro=B.mvcnro and A.mcdpto=B.mcdpto and A.cntvig= B.cntvig and
     A.MvCxPNat=B.MvCNat and A.MvCxPNat='C'
GROUP BY  B.DOCCOD,b.mvcnro
	  HAVING SUM(b.mvcvlr) <> SUM(mvcxpvaL)

SELECT  A.MvCxPNuOb, SUM(b.mvcvlr) AS CONTABLE, SUM(mvcxpvaL) AS CXP, ( SUM(b.mvcvlr) -  SUM(mvcxpvaL)) AS DIF
FROM MOVCXP A, MOVCONT2 B, CUENTAS c
WHERE A.empcod=B.empcod and A.doccod=B.doccod and A.mvcxpnro=B.mvcnro and A.mcdpto=B.mcdpto and A.cntvig= B.cntvig and
      A.MvCxPNat=B.MvCNat and A.MvCxPNat='C' AND   A.MvCxPNuOb= B.MvCDocRf1 and
	  A.CntCod=B.CntCod anD b.cntcod=c.cntcod and c.cntint='CXP' AND c.CntVig=2016 AND mvcxpval<>0
	  
GROUP BY   A.MvCxPNuOb
HAVING SUM(b.mvcvlr) <> SUM(mvcxpval) AND   ( SUM(b.mvcvlr) -  SUM(mvcxpvaL)) <> 0 -- CON EL DOC DIFEFERENCIA

-- veamos dcumentos

	 SELECT  A.MvCxPNuOb, SUM(b.mvcvlr), SUM(mvcxpvaL), ( SUM(b.mvcvlr) -  SUM(mvcxpvaL)) AS DIF
FROM MOVCXP A, MOVCONT2 B, CUENTAS c
WHERE A.empcod=B.empcod and A.doccod=B.doccod and A.mvcxpnro=B.mvcnro and A.mcdpto=B.mcdpto and A.cntvig= B.cntvig and
      A.MvCxPNat=B.MvCNat and A.MvCxPNat='D' AND   A.MvCxPNuOb= B.MvCDocRf1 and
	  A.CntCod=B.CntCod anD b.cntcod=c.cntcod and c.cntint='CXP' AND c.CntVig=2016 AND mvcxpval<>0
	--  AND DOCCOD='CXP' AND MvCNro=14329
GROUP BY   A.MvCxPNuOb
HAVING SUM(b.mvcvlr) <> SUM(mvcxpval)  AND   ( SUM(b.mvcvlr) -  SUM(mvcxpvaL)) <> 0-- CON EL DOC DDEFEFERENCIA


--1,AJN,AJP,AJT,CDC,CFA,CXP,TAC,TCM,TRC  -- E CREDITOS
-- 1,AJN,AJP,AJT,CCC, CXP,NC,CCE,TCM,TLA  -- EN DEBITOS
SELECT * FROM MOVCONT2 
SELECT * FROM MOVCXP

SELECT DOCCOD,MVCNRO 
FROM MOVCONT2 
WHERE CntVig=2016 AND DOCCOD='CFA' AND MvCNro= 28718 AND

 DOCCOD IN ('1','AJN','AJP','AJT','CDC','CFA','CXP','TAC','TCM','TRC') AND  (CONCAT(EMPCOD,'',DOCCOD,'',MVCNRO,'',CntVig,'',CNTCOD,'',MVCNAT))  NOT IN
                     (SELECT (CONCAT(EMPCOD,'',DOCCOD,'',MVCXPNRO,'',CntVig,'',CNTCOD,'',MVCXPNAT)) FROM MOVCXP )
GROUP BY DOCCOD,MVCNRO


SELECT CONCAT(EMPCOD,'',DOCCOD,'',MVCXPNRO,'',CntVig,'',CNTCOD,'',MVCXPNAT),* FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=28718
SELECT  (CONCAT(EMPCOD,'',DOCCOD,'',MVCNRO,'',CntVig,'',CNTCOD,'',MVCNAT)),* FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=28718
SELECT * FROM MOVCONT2  WHERE DOCCOD='CFA' AND MvCNro=28718



