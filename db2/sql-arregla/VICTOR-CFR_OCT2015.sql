-- CONCLUSION RAZONES :

-- 1. El listado inicial de errores son facturas que NO debe TOMAR por que ? Creo No tienen saldo para subir la CFR
      -- se hace es un :   update ADMGLO11 set aglfchrad = '2015-11-01 23:59:59',AGLCONFEC= '2015-10-31 23:59:59' , AGLPERCER='' -- ESTABA 
      -- Crear query que identifique estas facturas, sacar copia de admglo11 antes

      create table admglo11_20151205 as select * from admglo11;
      select * from admglo11_20151205
      
	-- Facturas que No tienen saldop
	
      select * from admglo11 
      where AGLFRDFAC>= '2016-12-01' and AGLFRDFAC<= '2016-12-31' and cast(mpnfac as nvarchar) in 
      (select hojnumobl from hojobl where hojtotdeb=hojtotcre and cntcod = '13050501')

       -- ojo verificar y constatar-probra el resultado del query

	begin transaction;
	update ADMGLO11
	set aglfchrad = '2015-11-01 23:59:59',AGLCONFEC= '2015-10-31 23:59:59' , AGLPERCER=''-- estaba, ojo valores del sigte mes
        from admglo11 x
	where admglo11.mpnfac = x.mpnfac and x.AGLFRDFAC>= '2015-10-01' and x.AGLFRDFAC<= '2015-10-31' and cast(x.mpnfac as text) in 
       (select hojnumobl from hojobl where hojtotdeb=hojtotcre and cntcod = '13050501')
        -- commit
        -- rollback



-- 2 . No sube ciertos contratos especificos Quemados a los cuales hay que actualizar el campo  AGLPERCER='N', no se sabe por que no lo ACTUALIZA
       -- durante el mes...
       -- Son las facturas que tienen saldo no se ha generado CFR. de los contratos problema


	BEGIN TRANSACTION;
	UPDATE ADMGLO11
	SET AGLPERCER='N'
	FROM ADMGLO11 A , HOJOBL B , MAEATE C
	WHERE ADMGLO11.MPNFAC = A.MPNFAC AND
	A.AGLFRDFAC>= '2015-10-01 00:00:00' AND  A.AGLFRDFAC<= '2015-10-31 23:59:59'  AND
	B.HOJNUMOBL = cast (a.mpnfac as text) and b.cntcod='13050501' and
	b.mennit IN ('HOSP/UR/CX   ','SANITAS EMPR ','COMPLURG-HX-C','COMP POS AMB ','SANITAS AMB08','COMPL.AMB    ','FUNC. TELETON','COMP.HX-URG-C')
	and    A.AGLPERCER='' AND B.HOJTOTCRE <> B.HOJTOTDEB AND -- tienen saldo estas facturas de contratos problema
	C.MPNFAC = A.MPNFAC AND  --a.mpnfac = 2164575  AND
	B.HOJNUMOBL    NOT in (select x.hojnumobl from hojobl x where x.cntcod='13060501')  -- 
	-- ROLLBACK;
	-- COMMIT 
       

-- 3 No dberia existir mas , eso creop ...

-- el ULTIMO PASO ,es el de dejar las cueats del paso nro1 como estaban originalmente :


begin transaction;
update admglo11
set aglfchrad= x.aglfchrad,
    AGLCONFEC=x.AGLCONFEC,
    AGLPERCER=x.AGLPERCER
 from  admglo11 y, admglo11_20151106 x
 where admglo11.mpnfac = y.mpnfac and
       y.mpnfac = x.mpnfac and
 and   AGLFRDFAC>= '2015-10-01' and AGLFRDFAC<= '2015-10-31' and 
       cast(y.mpnfac as text) in 
      (select hojnumobl from hojobl where hojtotdeb=hojtotcre and cntcod = '13050501')

-- ROLLBACK
-- COMMIT

-- FIN ARREGLOS


select * from hojobl where hojnumobl in ('2154493', '2170584','2170615')

-- Este query salen todos las factuars que no tienen saldo y NO CFR

          SELECT A.MPNFAC ,B.HOJNUMOBL,B.CNTCOD,a.AGLFRDFAC,b.mennit,a.aglconfec,b.hjfcanobl,   b.hojtotcre,b.hojtotdeb,b.hojnrorem,a.aglremnr
          ,aglfchrad,A.AGLPERCER
 FROM ADMGLO11 A , HOJOBL B 
WHERE A.AGLFRDFAC>= '2015-10-01 00:00:00' AND  A.AGLFRDFAC<= '2015-10-31 23:59:59'  AND
   --A.MPNFAC = cast(B.HOJNUMOBL as int)
   B.HOJNUMOBL = cast (a.mpnfac as text) and b.cntcod='13050501' and
   b.hojtotcre=b.hojtotdeb and 
   --  a.mpnfac = 2167344 and
     B.HOJNUMOBL  not in (select x.hojnumobl from hojobl x where x.cntcod='13060501')
       ORDER BY A.MPNFAC  -- son del 16 y del 25 / HAY EN PRODUCCION 653

select * from admglo11
where mpnfac in ('2170584')



-- 1 CASO 1 DE OCTUBRE
-- 2170584

begin transaction;
update ADMGLO11
set aglfchrad = '2015-11-01 23:59:59',AGLCONFEC= '2015-10-31 23:59:59' , AGLPERCER=''-- ESTABA "2015-10-28 14:40:18"  , N  Y 000
where mpnfac in (2170584,2170047,2154493,2169179,2169170,2171705,2171696,2171431,2170955,2170021,2170615,2170845,2169999,
2169168,2168361,2174005,2169975,2169509,2169436,2169180,2174807,2174181,2175012,2175821,2175831,2176074,2176334,2176340,2176613,2176650,
2177971,2177974,2170992,2181475,2173596,2177462,2177952,2178991,2178973,2178967,2178629,2179575,2179580,2180486,2170248,2172682,
2172688,2173818,2173282,2173307,2173508,2173510,2174184,2184033,2168628,2168944,
2169760,2182459,2185106,2185121,2185143,2185397,2185398,2183981)
-- COMMIT;
-- rollback=



-- Reversar  ..


begin transaction;
update admglo11
set aglfchrad= x.aglfchrad,
    AGLCONFEC=x.AGLCONFEC,
    AGLPERCER=x.AGLPERCER
 from  admglo11 y, admglo11_20151106 x
 where admglo11.mpnfac = y.mpnfac and
       y.mpnfac = x.mpnfac and
        y.mpnfac in (2170584,2170047,2154493,2169179,2169170,2171705,2171696,2171431,2170955,2170021,2170615,2170845,2169999,
2169168,2168361,2174005,2169975,2169509,2169436,2169180,2174807,2174181,2175012,2175821,2175831,2176074,2176334,2176340,2176613,2176650,
2177971,2177974,2170992,2181475,2173596,2177462,2177952,2178991,2178973,2178967,2178629,2179575,2179580,2180486,2170248,2172682,
2172688,2173818,2173282,2173307,2173508,2173510,2174184,2184033,2168628,2168944,
2169760,2182459,2185106,2185121,2185143,2185397,2185398,2183981)
-- Validacion

select a.mpnfac , a.aglfchrad,b.aglfchrad,a.AGLCONFEC,b.AGLCONFEC,a.AGLPERCER,b.AGLPERCER
from admglo11 a, admglo11_20151106 b
where a.mpnfac = b.mpnfac and a.mpnfac in (2170584,2170047,2154493,2169179,2169170,2171705,2171696,2171431,2170955,2170021,2170615,2170845,2169999,
2169168,2168361,2174005,2169975,2169509,2169436,2169180,2174807,2174181,2175012,2175821,2175831,2176074,2176334,2176340,2176613,2176650,
2177971,2177974,2170992,2181475,2173596,2177462,2177952,2178991,2178973,2178967,2178629,2179575,2179580,2180486,2170248,2172682,
2172688,2173818,2173282,2173307,2173508,2173510,2174184,2184033,2168628,2168944,
2169760,2182459,2185106,2185121,2185143,2185397,2185398,2183981)
-- commit;
-- rollback

-- Validacion documentos CFR subidos ...

select * from movcxc
where mccfch >= '2015-10-01' and mccfch <= '2015-10-31' and doccod='CFR' -- 19498


select * from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-31'  AND AGLPERCER=''   -- HAY 1749 O SEA LASQUE NO TIENEN SALDO + LAS DE CONTRATOS PROBLEMA


select * from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-31'  AND AGLPERCER<>''   -- HAY 9532  TOTAL 11281

-- Umm no se exactamente que hace el query ..

SELECT *
FROM ADMGLO11 , HOJOBL 
WHERE AGLFRDFAC >= '2015-10-01' AND AGLFRDFAC <= '2015-10-31' AND -- MPNFAC =  2120257 AND
    CAST (MPNFAC AS TEXT)  = HOJNUMOBL AND  HOJTOTCRE <> HOJTOTDEB AND cntcod='13050501' and
CAST (MPNFAC AS TEXT) NOT  IN
 (SELECT MCCNUMOBL
  FROM MOVCXC
  WHERE DOCCOD='CFR' AND 
        MCCFCH >= '2015-10-01 00:00:00' AND MCCFCH <= '2015-10-31 23:59:59')  -- HAY 1468 Facturas .-

('HOSP/UR/CX   ','SANITAS EMPR ','COMPLURG-HX-C','COMP POS AMB ','SANITAS AMB08','COMPL.AMB    ','FUNC. TELETON','COMP.HX-URG-C')



-- Verificar con otro Query:


select * 
 FROM ADMGLO11 A , HOJOBL B , MAEATE C
WHERE ADMGLO11.MPNFAC = A.MPNFAC AND
A.AGLFRDFAC>= '2015-10-01 00:00:00' AND  A.AGLFRDFAC<= '2015-10-31 23:59:59'  AND
   B.HOJNUMOBL = cast (a.mpnfac as text) and b.cntcod='13050501' and
  b.mennit IN ('HOSP/UR/CX   ','SANITAS EMPR ','COMPLURG-HX-C','COMP POS AMB ','SANITAS AMB08','COMPL.AMB    ','FUNC. TELETON','COMP.HX-URG-C')
   and   B.HOJTOTCRE <> B.HOJTOTDEB AND    A.AGLPERCER='' AND
  C.MPNFAC = A.MPNFAC AND
 --a.mpnfac = 2164575  AND-- ES DEL 23 DE OCTUBREand
     B.HOJNUMOBL    NOT in (select x.hojnumobl from hojobl x where x.cntcod='13060501')  -- 1466,, SE PASO 1749-1468=    281 Facturas Pasado


-- Query que actualiza :

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLPERCER='N'
 FROM ADMGLO11 A , HOJOBL B , MAEATE C
WHERE ADMGLO11.MPNFAC = A.MPNFAC AND
A.AGLFRDFAC>= '2015-10-01 00:00:00' AND  A.AGLFRDFAC<= '2015-10-31 23:59:59'  AND
   B.HOJNUMOBL = cast (a.mpnfac as text) and b.cntcod='13050501' and
  b.mennit IN ('HOSP/UR/CX   ','SANITAS EMPR ','COMPLURG-HX-C','COMP POS AMB ','SANITAS AMB08','COMPL.AMB    ','FUNC. TELETON','COMP.HX-URG-C')
   and    A.AGLPERCER='' AND B.HOJTOTCRE <> B.HOJTOTDEB AND
  C.MPNFAC = A.MPNFAC AND  --a.mpnfac = 2164575  AND
     B.HOJNUMOBL    NOT in (select x.hojnumobl from hojobl x where x.cntcod='13060501')  -- 
-- ROLLBACK;
-- COMMIT; .. DEBEN HABER  1465

SELECT * FROM ADMGLO11 WHERE MPNFAC =2164575
SELECT * FROM MOVCXC WHERE MCCNUMOBL = '2164575'
SELECT * FROM HOJOBL WHERE HOJNUMOBL = '2164575'

-- validacion global

select count(*) from movcxc --limit 100
where mccfch >= '2015-10-01' and mccfch <= '2015-10-31' and doccod='CFR'   --hay 19498
DBCC USEROPTIONS
 SELECT @@SPID
-- Validacion global por dia

SELECT @@SPID
DBCC USEROPTIONS
-- isolation level	read committed

select datepart(DD,mccfch),count(*) 
from movcxc --limit 100
where mccfch >= '2016-12-01' and mccfch <= '2016-12-31' and doccod='CFR'   --hay 16568
group by  datepart(dd,mccfch)
order by  datepart(DD,mccfch)

-- 1	5628


-- Para el cierre CONFIRMAR estop....??? LA VERDAD NO SE,, AVERIGUAR
-- Para el cierre CONFIRMAR estop....??? LA VERDAD NO SE,, AVERIGUAR
-- Para el cierre CONFIRMAR estop....??? LA VERDAD NO SE,,  AVERIGUAR


select AGLPERCER,COUNT(*)
FROM ADMGLO11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-31'  --AND AGLPERCER<>''  -- 11281 /10998
GROUP BY AGLPERCER

-- Se saca copia de la tabla

CREATE TABLE ADMGLO11_20151124 AS SELECT * FROM ADMGLO11

select * from admglo11 where  aglfrdfac >= '2015-10-01 00:00:00' and aglfrdfac <= '2015-10-01 23:59:59' and AGlConNro=0 
select * from hojobl where hojnumobl = '2171600'
select * from movcxc where mccnumobl = '2171600'  -- "SANITAS AMB08"

select * from admglo11 where  aglfrdfac >= '2015-09-01 00:00:00' and aglfrdfac <= '2015-09-30 23:59:59' and AGlConNro=0 
select * from hojobl where  hojfchobl>= '2015-09-01' and hojfchobl <= '2015-09-30' and mennit = 'SANITAS AMB08'

select * from movcxc where mccfch >= '2015-09-01' and mccfch <= '2015-09-30' and doccod='CFR' AND MENNIT = 'SANITAS AMB08'
select * from movcxc where mccfch >= '2015-10-01' and mccfch <= '2015-10-30' and doccod='CFR' AND MENNIT = 'SANITAS AMB08' and mccnumobl ='2171600'
select * from hojobl where hojnumobl = '2171600'
select * from movcxc where mccnumobl = '2171600'

SELECT DOCCOD,mvcxcnro,DATEPART(DD,MCCFCH),COUNT(*)
FROM MOVCXC
WHERE MCCFCH>= '2016-12-01' AND DOCCOD='CFR'
GROUP BY DOCCOD,mvcxcnro,DATEPART(DD,MCCFCH)
ORDER BY DATEPART(DD,MCCFCH)

select * from



--------------------------------------------------------------
--------------------------------------------------------------


-- ARREGLO PROPUESTO POR DIGITALWARE


select mpnfac,aglcondoc,aglconnro,aglconfec,aglpercer,aglconfec from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30' and aglconnro is null -- 1236
order by mpnfac

-- se saca copia de lo que voy a modificar

create table admglo11_20151126 as  select * from adglosas;
create table admglo11_20151126_son as select *  from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30' and aglconnro is null


select * from admglo11 where aglconfec>='2015-12-27'  -- 1236/1247

-- El arreglo Paaso No 1 -- Se coloca fecha de contabilizacion a la factura radicada de las facturas que No sejan cerrar el MES

BEGIN TRANSACTION;
UPDATE admglo11
SET aglconfec='2015-12-27'
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30' and aglconnro is null -- deben ser 1236
-- COMMIT;
-- ROLLBACK;


  -- Esto para 1as 11 Facturas que aun no dejan cerrar el mes
  
BEGIN TRANSACTION;
UPDATE admglo11
SET aglconfec='2015-12-27'--,aglpercer='S'
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981) -- deben ser 11
-- COMMIT;
-- ROLLBACK;



-- Para devolver, NOTA : El campo aglpercer permanece intacto, no se devuelve ...

BEGIN TRANSACTION;
UPDATE admglo11
SET aglconfec=a.aglconfec-- , aglpercer=a.aglpercer
FROM admglo11_20151126_son a
WHERE ADMGLO11.MPNFAC = A.MPNFAC -- tienen que ser 1236 factus y debe quedar el campo en '0001-01-01 00:00:01'

-- VALIDACION

select * from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30'  and  aglconfec='2015-12-27' -- 11281 REGISTROS

-- COMMIT
-- ROLLBACK;

-- Para devolverse para atras de las 11 Facturas

BEGIN TRANSACTION;
UPDATE ADMGLO11
SET aglpercer='N'
WHERE mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)
-- COMMIT

-- faltan


select * from admglo11 
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30' and aglconnro=0

select * from admglo11 --where mpnfac in (2184033
where aglfrdfac>= '2015-10-01' and aglfrdfac<= '2015-10-30'  and mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)


select * from admglo11_20151126_son
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)

select * from ADMGLO11
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)

begin transaction;
insert into admglo11_20151126_son
select * from admglo11
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)
-- commit;

SELECT * FROM admglo11_20151126_son
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)



SELECT * FROM admglo11
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981)

-- la reversa de las 11 facuras

BEGIN TRANSACTION;
UPDATE admglo11
SET aglconfec='0001-01-01 00:00:00'--,aglpercer='S'
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981) -- deben ser 11
-- COMMIT;
-- ROLLBACK;

-- ULTIMA ACT DW

BEGIN TRANSACTION;
UPDATE admglo11
SET aglconfec='0001-01-01 00:00:00'--,aglpercer='S'
where mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981) -- deben ser 11
-- COMMIT;
-- ROLLBACK;

--- SOLUCION - SOLUCION

-- Esta es la solucion del proveedor, se coloca eltipo de documento CFR y el numero del documento CFR del dia a aquellas factuars faltantes
SELECT * FROM ADMGLO11
WHERE  mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981) 

SELECT * FROM ADMGLO11
WHERE  AGLFRDFAC >= '2015-10-01'
ORDER BY AGLFRDFAC  -- 702


BEGIN TRANSACTION;
UPDATE ADMGLO11
SET AGLCONDOC='CFR',AGLCONNRO= 702
WHERE  mpnfac in (2184033,2168628,2168944,2169760,2182459,2185106,2185121,2185143,2185397,
2185398,2183981) 
-- COMMIT;
-- OK
