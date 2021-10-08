select * from movcxp
select * from hojoblprv
select * from bkp.hojoblprv_act WHERE OBLIGACION ='-BT5 6432'


-- hAY 147 oBLIGACONES
select A.prvcod as prvcod, a.MvCxPNuOb as obligacion, SUM(a.mvcxpval) as total,B.hopvlrobl as valor_obliga, b.HOpTOTCRE as credito ,B.HOJBASDES as des, b.hopfchobl as fecha,b.HojFchCan as cancelacion
into bkp.hojoblprv_act

select A.prvcod as prvcod, a.MvCxPNuOb as obligacion, SUM(a.mvcxpval) as total,B.hopvlrobl as valor_obliga, b.HOpTOTCRE as credito ,B.HOJBASDES as des, b.hopfchobl as fecha,b.HojFchCan as cancelacion
from MOVCXP a, HOjOBLPRV b
where a.CntVig=2016 and a.MvCxPNuOb=b.HOPNoObl and a.MvCxPNat='C' AND-- a.CntVig=2016 AND 
A.PRVCOD=B.PRVCOD AND A.CntCod=b.CNTCOD AND
    a.CntVig=b.CNTVIG AND a.MvCxPVal<>0 AND  --a.MvCxPNuOB= '7665' and 
	b.HojFchCan= '1753-01-01 00:00:00.000'  -- AND  a.MvCxPNuOB= '860' 
group by a.PrvCod, a.MvCxPNuOb,B.hopvlrobl, b.HOpTOTCRE,B.HOJBASDES, b.hopfchobl,b.HojFchCan
having  SUM(a.mvcxpval) <> b.HOpTOTCRE  -- 147
order by  b.hopvlrobl

select @@VERSION
-- ver
-- SB-54777 
--C 14077      
-- 87933                  
-- -BT5 6387      
-- C 14236 
--FVC 58526             
-BT5 6432      
126602         
126602         
-BT5 6432      
E15033         


-- ESte seria el UPDATE GENERAL

BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=b.total, HOPTOTCRE=B.total,HOJBASDES=b.total
FROM HOJOBLPRV a,  bkp.hojoblprv_act  b
where a.prvcod= B.prvcod and a.HOPNoObl = b.obligacion and a.HOPVlrObl=valor_obliga  and   B.obligacion= 'E15033' 

  --	commit	
-- ROLLBACK;
-- Validacion :
select * from hojoblprv where PrvCod='900630118'  AND  hopnoobl= '315'  -- 78494761.00  /  -376  ,, YA ESTA ACTUALZIADA EN PRODUCCION
select * from hojoblprv where PrvCod='900630118'  AND  hopnoobl= '336'  -- 78494761.00  /  -376  ,, YA ESTA ACTUALZIADA EN PRODUCCION
select * from hojoblprv where PrvCod='900630118'  AND  hopnoobl= '311'  -- 78494761.00  /  -376  ,, YA ESTA ACTUALZIADA EN PRODUCCION
select * from hojoblprv where PrvCod='34566970'  AND  hopnoobl= '7'  -- 78494761.00  /  -376  ,, YA ESTA ACTUALZIADA EN PRODUCCION
select * from hojoblprv where hopnoobl= '-CV1-818428'  -- 78494761.00  /  -376
select * from hojoblprv where hopnoobl= 'FVT-297848'   -- 2374666.00  / -1 
select * from hojoblprv where hopnoobl= '1735'         -- 121429.00
select * from hojoblprv where hopnoobl= '0860'         -- 22524075.00 / 3335280.00
select * from hojoblprv where hopnoobl= 'MDX 29307'    --8932928.00  / 1232128.00
select * from hojoblprv where hopnoobl= 'FV/103212'   --3996058.00 / 533718.00


-- ROLLBACK;
-- COMMIT


-- SDO LOTE

select A.prvcod as prvcod, a.MvCxPNuOb as obligacion, SUM(a.mvcxpval) as total,B.hopvlrobl as valor_obliga, b.HOpTOTCRE as credito ,B.HOJBASDES as des, b.hopfchobl as fecha,b.HojFchCan as cancelacion
INTO BKP.HOJOBLPRV_ACT_2
from MOVCXP a, HOjOBLPRV b
where a.CntVig=2016 and a.MvCxPNuOb=b.HOPNoObl and a.MvCxPNat='C' AND-- a.CntVig=2016 AND 
A.PRVCOD=B.PRVCOD AND A.CntCod=b.CNTCOD AND
    a.CntVig=b.CNTVIG AND a.MvCxPVal<>0 AND  --a.MvCxPNuOB= '7665' and 
	b.HojFchCan= '1753-01-01 00:00:00.000'  -- AND  a.MvCxPNuOB= '860' 
group by a.PrvCod, a.MvCxPNuOb,B.hopvlrobl, b.HOpTOTCRE,B.HOJBASDES, b.hopfchobl,b.HojFchCan
having  SUM(a.mvcxpval) <> b.HOpTOTCRE  -- 147
order by  b.hopvlrobl

-- Este es el INSERT


INSERT 
INTO BKP.HOJOBLPRV_ACT_2
select A.prvcod as prvcod, a.MvCxPNuOb as obligacion, SUM(a.mvcxpval) as total,B.hopvlrobl as valor_obliga, b.HOpTOTCRE as credito ,B.HOJBASDES as des, b.hopfchobl as fecha,b.HojFchCan as cancelacion
from MOVCXP a, HOjOBLPRV b
where a.CntVig=2016 and a.MvCxPNuOb=b.HOPNoObl and a.MvCxPNat='C' AND-- a.CntVig=2016 AND 
A.PRVCOD=B.PRVCOD AND A.CntCod=b.CNTCOD AND
    a.CntVig=b.CNTVIG AND a.MvCxPVal<>0 AND  --a.MvCxPNuOB= '7665' and 
	b.HojFchCan= '1753-01-01 00:00:00.000'  -- AND  a.MvCxPNuOB= '860' 
group by a.PrvCod, a.MvCxPNuOb,B.hopvlrobl, b.HOpTOTCRE,B.HOJBASDES, b.hopfchobl,b.HojFchCan
having  SUM(a.mvcxpval) <> b.HOpTOTCRE  -- 147
order by  b.hopvlrobl

--------------------------
--0 = Unspecified
 1 = ReadUncomitted
 2 = ReadCommitted
 3 = Repeatable
 4 = Serializable
 5 = Snapshot
 Is not nullable.
 --------------------------

select @@spid
SELECT transaction_isolation_level,* FROM sys.dm_exec_sessions where session_id=556 -- 2 
SELECT * FROM  BKP.HOJOBLPRV_ACT_2
JM 681936  
795
    1987


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=b.total, HOPTOTCRE=B.total,HOJBASDES=b.total
FROM HOJOBLPRV a,  BKP.HOJOBLPRV_ACT_2  b
where a.prvcod= B.prvcod and a.HOPNoObl = b.obligacion and a.HOPVlrObl=valor_obliga  and   B.obligacion= 'C-9379         '
  --	commit	
-- ROLLBACK;
DBCC USEROPTIONS
5327           
          
SELECT * FROM BKP.HOJOBLPRV_ACT_2 WHERE obligacion IN ('-CV1-818428',    
'-CV1-818429'    ,
'FVC 58164'      ,
'4094'           ,
'0795'           )

select * from BKP.HOJOBLPRV_ACT    -- 147
select * from BKP.HOJOBLPRV_ACT_2  --  89
                                     ---
									   236  - 53 =  183

select * from BKP.HOJOBLPRV_ACT  where obligacion in (select obligacion from BKP.HOJOBLPRV_ACT_2) -- 53