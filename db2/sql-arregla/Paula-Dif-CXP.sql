-- Obligacines con valores de obligaciones NEGATIVAS :
SELECT * FROM  HOJOBLPRV WHERE HOPVLROBL <0 AND CntVig <= 2016
--a�o 2016

-- La Obligacion

SELECT * FROM  HOJOBLPRV WHERE HOPNOOBL= '089' AND PrvCod= '52386184'

-- veamos el query completo con la Hojoblprv

select A.MVCXPNUOB AS OBLIGACION,A.DOCCOD AS TIPO_DOC,A.MVCXPNRO AS DOC_NRO,A.CNTCOD AS CUENTA,B.CNTCOD AS CUENTA,A.MVCXPVAL AS VALOR_MOVCXP,B.MVCVLR AS VALOR_MOVCONT2,
A.PRVCOD AS PROVEEDOR,C.HOPVlrObl AS VALOR_HOPVLROBL,C.HOPTotCre AS VALOR_CREDITOS,C.HOPTOTDEB AS VALOR_DEBITOS,C.HOPFchObl AS FECHA_HOPOBLPRV,C.CntCod AS CUENTA_HOJOBLPRV
from movcXp a , MOVCONT2 B, HOJOBLPRV C
WHERE A.EMPCOD = B.EMPCOD AND A.DOCCOD=B.DOCCOD AND A.MCDPTO=B.MCDPTO AND
     a.DOCCOD='CXP' AND A.MVCXPNRO=B.MVCNRO AND A.CNTCOD=B.CNTCOD AND A.CNTVIG=2016  AND 
	 A.MVCXPVAL<>B.MVCVLR AND  C.PrvCod=a.PRVCOD AND  C.HOPNoObl= A.MVCXPNUOB
	 ORDER BY A.MVCXPNUOB

select A.MVCXPNUOB AS OBLIGACION,A.DOCCOD AS TIPO_DOC,A.MVCXPNRO AS DOC_NRO,A.CNTCOD AS CUENTA,B.CNTCOD AS CUENTA,A.MVCXPVAL AS VALOR_MOVCXP,B.MVCVLR AS VALOR_MOVCONT2,
A.PRVCOD AS PROVEEDOR,C.HOPVlrObl AS VALOR_HOPVLROBL,C.HOPTotCre AS VALOR_CREDITOS,C.HOPTOTDEB AS VALOR_DEBITOS,C.HOPFchObl AS FECHA_HOPOBLPRV,C.CntCod AS CUENTA_HOJOBLPRV
from movcXp a , MOVCONT2 B, HOJOBLPRV C
WHERE A.EMPCOD = B.EMPCOD AND A.DOCCOD=B.DOCCOD AND A.MCDPTO=B.MCDPTO AND
     a.DOCCOD='CFA' AND A.MVCXPNRO=B.MVCNRO AND A.CNTCOD=B.CNTCOD AND A.CNTVIG=2016  AND 
	 A.MVCXPVAL<>B.MVCVLR AND  C.PrvCod=a.PRVCOD AND  C.HOPNoObl= A.MVCXPNUOB
-- jm 681936

-- Caso Jhonson y Jhonson
-- Esta Re-Mal

SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'JM 681936'  -- Por ue sale NEGATIVO
SELECT * FROM MOVCXP WHERE MVCXPNUOB = 'JM 681936' -- 591853.00
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro= 31433 AND MvCNat='C'  -- 591853.00

	 -- Vaidacion
	   --CXP
SELECT * FROM MOVCXP WHERE MVCXPNUOB= '919' AND PrvCod='830001458'  -- CXP 14587  -- $3074992.29
SELECT * FROM HOJOBLPRV WHERE HOPNoObl= '919' AND PrvCod= '830001458' -- (2) Cuentas contables Credito
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro= 14587 -- Valores en ceros, Un solo credito
SELECT * FROM MOVCONT3 WHERE DOCCOD='CXP' AND MvCNro= 14587


-- Casos de Tatiana


SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MVCXPNRO=31691  -- CAUSACION 1422495.00
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro = 31691  -- 1422495.00
SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'E14761'  -- 1422495

SELECT * FROM IMPUEST WHERE IMPCOD='IVACOMP8'
SELECT * FROM IMPUESTOS WHERE IMPCOD='IVACOMP8'
SELECT * FROM IMPUESTOS WHERE IMPCOD='IVACOMP9'
SELECT * FROM sys.tables WHERE NAME LIKE ('%IMPUEST%')

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- Casos de Tatikana EN PRUEBAS


SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MVCXPNRO=31691  -- CAUSACION 1422495.00
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro = 31691  -- 1422495.00
SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'E14761'  -- 1422495



select * from COMPCAB where DOCCOD='COC' AND OrdeNro=25385  --900194910   
select * from COMPCAB2 where DOCCOD='COC' AND OrdeNro=25385    

SELECT * FROM ENTRALM WHERE EntAFact='E14761' -- hay (2) Entradas de almacen, hay una ANULADA

CEC  46949  ANULADA
CEC  46955  ACTIVA

SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro =31591  -- AUNQUE COLOCO BIEN AL A�O , MES-- ESta causando mal para contabilidad
SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MVCXPNRO=31591   -- Ops Si la creo  -- 1203168.00
SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'E14761'             -- pero si creo la obligacion   -- 1203168.00



------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- Voy a causa otra en pruebas pero sin entrada de almacen anulada del mismo proveedor
-- CON LA COC 25036
-- OC NRo 25036 DE NOVIEMBRE
SELECT * FROM ENTRALM WHERE EntAFact='E14613'  -- No esta duplicada ..Proveedor : 900194910
SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'E14613'  
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro =31608  -- me saco del programa .-

-- dEfinitivamente esta causando Descuadradamente
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


-- Caso de Diferencia por $1
-- Solo hay 5 Obligaciones con esta diferencia

SELECT * FROM HOJOBLPRV WHERE HOPTOTCRE-HOPTOTDEB=1

-- veamos esta :
SELECT * FROM HOJOBLPRV WHERE HOPNOOBL='JM 683054'  -- 1.00
SELECT * FROM MOVCXP WHERE MvCxPNuOb ='JM 683054'  -- 3181620.00
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31419
 







-- Sondeo de cuantas causaciones van en Diciembre

SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPFch>= '2016-12-01'  ORDER BY MVCXPNRO -- 203 Casusaciones

 
SELECT DOCCOD,MVCNRO,MVCNAT,SUM(MVCVLR)
FROM MOVCONT2
WHERE DOCCOD='CFA' AND MVCCFCH>= '2016-12-01'
GROUP BY DOCCOD,MVCNRO,MVCNAT
ORDER BY DOCCOD,MVCNRO,MVCNAT


SELECT DOCCOD,MVCNRO,MVCNAT,
SUM(CASE WHEN MvCNat='D' THEN MVCVLR ELSE 0 END),
SUM(CASE WHEN MvCNat='C' THEN MVCVLR ELSE 0 END)
FROM MOVCONT2
WHERE DOCCOD='CFA' AND MVCCFCH>= '2016-12-01'
GROUP BY DOCCOD,MVCNRO,MVCNAT
ORDER BY DOCCOD,MVCNRO,MVCNAT

SELECT MVCNAT,SUM(MVCVLR)  -- Mas sin embargo esta descuadrado ...
FROM MOVCONT2
WHERE DOCCOD='CFA' AND MVCCFCH>= '2016-12-01'
GROUP BY MVCNAT -- Dif  -1067437


-- Como saco las diferencias :
SELECT A.DOCCOD,A.MVCNRO,A.MVCNAT,SUM(MVCVLR)
FROM MOVCONT2 A
WHERE A.DOCCOD='CFA' AND A.MVCCFCH>= '2016-12-01' AND A.MvCNat='D'
 GROUP BY A.DOCCOD,A.MVCNRO,A.MVCNAT
      HAVING SUM(MVCVLR) <> (SELECT SUM(X.MVCVLR)
	                         FROM MOVCONT2 X
							 WHERE X.DOCCOD=A.DOCCOD AND X.MVCNRO=A.MVCNRO AND X.MVCNAT='C')

ORDER BY A.DOCCOD,A.MVCNRO,A.MVCNAT

-- Documento Diferente
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro = 31702  -- Dif 1067437


-- Obligaciones que esten en la Hojoblprv y no En la Movcxp

SeLECT * FROM HOJOBLPRV
WHERE -- CNTVIG=2016 AND
 HOPNOOBL NOT IN (SELECT  MvCxPNuOb FROM MOVCXP)

800053110      	BTA-392        
800149695      	104-35077187   
830038274      	DH-16-004      
830041655      	78088          
830068653      	AC-10998       
830072846      	FC-2025        
830072846      	FC-2025        
830116846      	5344           
860026182      	022005018      
860520610      	23996          
890704196      	ZLWPRJ         
900726527      	CR 409    

-- Visceversa : Obligaciones en la movcxp pero no en la Hojoblprv

SELECT * FROM MOVCXP 
WHERE   CNTVIG=2016 AND MvCxPNuOb  NOT IN (SELECT HOPNOOBL FROM  HOJOBLPRV) -- Aquip no  hay ningua
     




