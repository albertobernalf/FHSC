select * from hojobl where hojnumobl IN ('2397015','2397016')  -- 1003844347  
select * from movcxc where mccnumobl  IN ('2397015','2397016')    -- 1003844347     
select * from admglo11 where mpnfac  = '2397016' -- Remisio Nro 61802
select * from maeate where mpnfac = 2397016  --1003844347      -- SANITASHU 08 
select * from terceros where trccod= '1003844347'  -- ANDRES FELIPE NIETO RIAÑO                                   
select * from terceros where trcrazsoc like ('%SANITA%')  -- 800251440      

SELECT * FROM TERCEROS WHERE TRCCOD='860002183'

BEGIN TRANSACTION;
UPDATE hojobl
SET CLICOD= '1003844347'  -- Estaba  1003844347
where hojnumobl = '2397016'
-- COMMIT;

BEGIN TRANSACTION;
UPDATE MOVCXC
SET CLICOD = '1003844347' -- 1003844347
where MCCNUMOBL  = '2397016'
-- COMMIT;

SELECT * FROM MAEATE WHERE FACFCH>= '2016-11-28'  ORDER BY MPNFAC

-- Como o radicda
-- La remision = parcialmete radicado
-- La facura REMITIDA



select * from admglo11 where mpnfac  = '2397016' -- Remisio Nro 61802
select * from admglo01 where AGlRemNr   =61802


begin transaction;
update admglo01
set aglradfc=null,aglremes='C' -- ESTABA EN D
where aglremnr in (61802 )
-- COMMIT

begin transaction;
update admglo11
set AGLFACES='R' ,AGLFRDFAC=NULL,AGLNRDFAC=''-- ESTABA EN D, REMITIDA LA REMISIOS
where aglremnr in (61802 )  AND MPNFac = 2397016
-- COMMIT
-- ROLLBACK

SELECT AGLFACES,* FROM ADMGLO11 WHERE aglremnr in (61802 ) 

BEGIN TRANSACTION;
UPDATE MAEATE
 SET MAESTF = '4'
 WHERE MPNFAC IN (2397016)
 -- COMMIT;

 SELECT * FROM HOJOBL WHERE HojNumObl= '2397016'

 BEGIN TRANSACTION;
 UPDATE HOJOBL
 SET HojNroRad=0,HOJFCHRAD='1753-01-01 00:00:00.00'
  WHERE HojNumObl= '2397016'
  -- COMMIT
