SELECT * FROM HOSVITAL.NIMOVCON2 WHERE EMPCOD='03' AND DOCCOD='SIF';

SELECT * FROM HOSVITAL.MOVCONT2 WHERE EMPCOD='03' AND DOCCOD='SIF' AND MVCNRO=1;

UPDATE  HOSVITAL.MOVCONT2
SET CNUCOD='',CNUSUB='', CNCCOD='',CNTSUB=''  
WHERE EMPCOD='03' AND DOCCOD='SIF' AND MVCNRO =  1 ;

UPDATE  HOSVITAL.NIMOVCON2 
SET CNUCOD='',CNUSUB='', CNCCOD='',CNTSUB='', NIMC2RF2='', NIMC2RF3='', NIMC2BSE='',NIMC2INP=''
WHERE EMPCOD='03' AND DOCCOD='SIF' AND NIMCNRO=  1 AND NIMC2CSC=1;


SELECT * FROM HOSVITAL.RESMCUE WHERE  RSMEMPCOD='03' AND RSMANO=2019 AND RSMMES=1;

SELECT COUNT(*)  FROM HOSVITAL.RESMCUE WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1;  -- 460	

-- CREATE TABLE HOSVITAL.RESMCUE_ENE19  AS SELECT * FROM HOSVITAL.RESMCUE WHERE RSMANO=2019 AND RSMMES=1;

DELETE FROM HOSVITAL.RESMCUE WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1;

SELECT COUNT(*)  FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1;  -- 115
	
DELETE   FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1; 

SELECT *  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1; 
SELECT COUNT( * )  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1;  -- 357

DELETE  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1; 


SELECT *  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1; 
SELECT COUNT( * )  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1;  -- 90

DELETE  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1;


---------------------------------------------
-- Actualizacion masiva de saldos de enro 2019

SELECT * FROM HOSVITAL.RESMCUE WHERE  RSMEMPCOD='03' AND RSMANO=2019 AND RSMMES=1;
SELECT *  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1; 

select * from hosvital.movcont2 where doccod='SIF' and mvcnro = 1 and trccod='1141330127';
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro = 1   and trccod='1141330127';

-- 1141330127   prueba
-- 1000160713

SELECT 'Local',rsmctncon, rsmcre,rsmdeb,rsmsalact  FROM HOSVITAL.RESMCUE WHERE  RSMEMPCOD='03' AND RSMANO=2019 AND RSMMES=1  and trccod='1141330127'
union
SELECT 'Niif',nirccue,nircgcre, nircgdeb, nircgact FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1  and trccod='1141330127'; 

select cntcod,mvcnat,sum(mvcvlr) from hosvital.movcont2 where cntvig=2019 and mvcanio=2019 and mvcmes=1 and trccod='1141330127' group  by cntcod, mvcnat;
select nicntcod,nimc2nat,sum(nimc2vlr) from hosvital.nimovcon2 where nicntvig=2019 and nimc2anio=2019 and nimc2mes=1 and trccod='1141330127' group  by nicntcod,nimc2nat;

update HOSVITAL.NIRSMGEN  N1
set n1.nircgdeb = (select r1.rsmdeb
                                from hosvital.resmcue r1
	   where r1.rsmempcod=n1.nircemp and r1.rsmano=n1.nircanio and r1.rsmmes=n1.nircmes and r1.rsmctncon=n1.nirccue          and  r1.trccod=n1.trccod and r1.mcdpto=n1.mcdpto and r1.cnucod=n1.cnucod and r1.cnusub=n1.cnusub and r1.cnccod=n1.cnccod and
                                             r1.cntsub=n1.cntsub and r1.trccod=n1.trccod),
     n1.nircgcre= (select r1.rsmcre
                                from hosvital.resmcue r1
	   where r1.rsmempcod=n1.nircemp and r1.rsmano=n1.nircanio and r1.rsmmes=n1.nircmes and r1.rsmctncon=n1.nirccue          and  r1.trccod=n1.trccod and r1.mcdpto=n1.mcdpto and r1.cnucod=n1.cnucod and r1.cnusub=n1.cnusub and r1.cnccod=n1.cnccod and
                                             r1.cntsub=n1.cntsub and r1.trccod=n1.trccod),
    n1.nircgact =(select r1.rsmsalact
                                from hosvital.resmcue r1
	   where r1.rsmempcod=n1.nircemp and r1.rsmano=n1.nircanio and r1.rsmmes=n1.nircmes and  r1.rsmctncon=n1.nirccue          and r1.trccod=n1.trccod and r1.mcdpto=n1.mcdpto and r1.cnucod=n1.cnucod and r1.cnusub=n1.cnusub and r1.cnccod=n1.cnccod and
                                             r1.cntsub=n1.cntsub and r1.trccod=n1.trccod)
where   n1.NIRCEMP='03'  and n1.mcdpto='003' AND  n1.NIRCANIO=2019 AND n1.NIRCMES=1 ;  -- and  n1.trccod='1141330127';

-- SDO QUERY

SELECT *  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1 and   nirccue='13050501'; 
SELECT *  FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon ='13050501';  



UPDATE HOSVITAL.NIRSMAUX N1
SET (N1.NIRCADEB, n1.nIRCACRE, n1.NIRCAACT) = (select r1.rsaxdeb,r1.rsaxcre,r1.rsaxsact
	                                from hosvital.rSMAUX r1
		   where r1.rsmempcod=n1.nircemp and r1.rsmctncon = n1.nirccue and  r1.rsmano=n1.nircanio and r1.rsmmes=n1.nircmes)
where   n1.NIRCEMP='03'  and   n1.NIRCANIO=2019 AND n1.NIRCMES=1 ;  -- and    n1.nirccue='13050501'; 

-- Validacion
select * from hosvital.rsmaux;

SELECT nirccue, nircadeb, nircacre,nircaant,nircaact  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1  -- and   nirccue='13050501';
union
SELECT rsmctncon, rsaxdeb,rsaxcre,rsaxsant,rsaxsact  FROM HOSVITAL.rsmaux  WHERE rsmempcod='03' AND  rsmano=2019 AND rsmmes=1  -- and   rsmctncon='13050501'
order by 1
; 


SELECT *  FROM HOSVITAL.NIRSMGEN WHERE nircemp='03' AND  nircanio=2019 AND nircmes=1 and  nirccue ='13050501';


SELECT *  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1 and   nirccue='15040501'; 
SELECT *  FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon ='15040501';  

select * from hosvital.nicuentas where nicntcod='15040501' and nicntvig=2019;

-- Cuales no existe,, hay 30 cuentas

select * from hosvital.movcont2 where doccod='SIF' and mvcnro=1 and cntcod='11050501'
union
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod='11050501';

select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod='11050501';

SELECT *  FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon not in (select  nirccue  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1);
-- select * from hosvital.nicuentas;

select * from hosvital.cuentas where empcod='03' and cntvig=2019 and cntcod='11050501' union
select * from hosvital.nicuentas where empcod='03' and nicntvig=2019 and nicntcod='11050501' ;  -- dierencias en parametrizacion :12450501
						-- no existe niiof 11100501   
       						-- estan como iguales 11050501            	
         	
SELECT *  FROM HOSVITAL.RSMAUX ;


--INSERT INTO HOSVITAL.NIRSMAUX (nircidx,NIRCEMP,NIRCCUE,NIRCANIO,NIRCMES,NIRCANIV,NIRCADEB,NIRCACRE,NIRCAANT,NIRCAACT)
SELECT  rsmidx,RSMEMPCOD,RSMCTNCON,RSMANO,RSMMES,RSMNIV,RSAXDEB,RSAXCRE,0,RSAXSACT
FROM HOSVITAL.RSMAUX WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon not in (select  nirccue  FROM HOSVITAL.NIRSMAUX  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1);-- 

-- Y los generales

select * from hosvital.resmcue;
SELECT *  FROM HOSVITAL.Resmcue WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon not in (select  nirccue  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1);

INSERT into  HOSVITAL.NIRSMGEN (nircidn,NIRCEMP,NIRCCUE,MCDPTO,CNUCOD,CNUSUB,CNCCOD,CNTSUB,TRCCOD,NIRCANIO,NIRCMES,NIRCGNIV,NIRCGCRE,NIRCGDEB,NIRCGACT,NIRCGANT,NIRCGIND,NIRCGACTE,NIRCGANTE)
select rsmidn,RSMEMPCOD,RSMCTNCON,MCDPTO,CNUCOD,CNUSUB,CNCCOD,CNTSUB,TRCCOD,RSMANO,RSMMES,RSMNVL,RSMCRE,RSMDEB,RSMSALACT,0,RSMIND,RSSLACTEX,RSSLANTEX
from HOSVITAL.Resmcue WHERE RSMEMPCOD='03' AND  RSMANO=2019 AND RSMMES=1 and  rsmctncon not in (select  nirccue  FROM HOSVITAL.NIRSMGEN  WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1);

--UPDATE AL SALDO ACTUAL
-- Esto noes necesario ...


/*
update HOSVITAL.NIRSMAUX
set  NIRCAACT= NIRCAANT +  NIRCADEB - NIRCACRE
WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1;


update HOSVITAL.NIRSMGEN
set  NIRCGACT= NIRCAANT +  NIRCGDEB - NIRCGCRE
WHERE NIRCEMP='03' AND  NIRCANIO=2019 AND NIRCMES=1;
*/
select * from hosvital.cuentas WHERE empcod='03' and cntcod like('%2610%');  -- Si estan creadad LOCAL
select * from hosvital.nirsmaux  where nircemp='03' and nircanio=2019 and nircmes=1 and nirccue = '2610';
select * from hosvital.nirsmaux  where nircemp='03' and nircanio=2019 and nircmes=1 and nirccue = '261010';
select * from hosvital.rsmaux  where rsmempcod='03' and rsmano=2019 and rsmmes=1 and rsmctncon = '261010';
select * from hosvital.rsmaux  where rsmempcod='03' and rsmano=2019 and rsmmes=1 and rsmctncon = '261010'; --como puede salir en local??


select * from hosvital.nirsmaux where nircemp='03' and nircanio=2019 and nirccue='11050501';
select * from hosvital.nicuentas where nicntcod='2610' and nicntvig=2019 ; -- noestan en nicuentas NIIF
select * from hosvital.nicuentas where nicntcod='261010' and nicntvig=2019 ; -- no estan en nicuentas

-- Dos diferencias

select * from hosvital.cuentas where empcod='03' and cntcod like ('1592%') and cntvig=2019 ;   -- Esta  creada lacunta en Local
select * from hosvital.nicuentas where empcod='03' and nicntcod like ('1592%') and nicntvig=2019 ; -- No esta cread ala cuenta contable en NIIF
select * from hosvital.rsmaux  where rsmempcod='03' and rsmano=2019 and rsmmes=1 and rsmctncon like ('1592%'); -- Si hay movimiento LOCAL
select * from hosvital.nirsmaux  where nircemp='03' and nircanio=2019 and nircmes=1 and nirccue = '1592'; -- No hay movimiento NIF


-- 15 propiedad planta u equipo
-- 1592 deprecIACION ACUMULADA (CR) 0,00 405.509.865,35



--405.509.865,35
--   2.146.147,32

-- 26    pasivos estimnados y provisiones         2.146.147,320,00  C
--   PARA OBLIGACIONES LABORALES 0,00 2.146.147,322610 2.146.147,320


select * from hosvital.movcont2 where doccod='SIF' and mvcnro = 1 and cntcod like ('1592%');   -- Si hay cargue de archivos LOCAL
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod like ('1592%');  --Si hay cargue de archivos NIIF
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod like ('15921605%');  --Si hay cargue de archivos NIIF
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod like ('15160102%');  
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod like ('15%') order by nicntcod; 

update  hosvital.nimovcon2 
set nicntcod = '15160102'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15921605%'); 

update  hosvital.nimovcon2 
set nicntcod = '15200502'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15922005%'); 

update  hosvital.nimovcon2 
set nicntcod = '15240502'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15922405%'); 

update  hosvital.nimovcon2 
set nicntcod = '15280502'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15922805%'); 



update  hosvital.nimovcon2 
set nicntcod = '15360502'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15923605%'); 

update  hosvital.nimovcon2 
set nicntcod = '15400502'
where doccod='SIF' and nimcnro=1 and nicntcod like ('15924005%'); 







select * from hosvital.nicuentas where empcod='03' and nicntcod like ('1592%') and nicntvig=2019 ;--  No esta creada la cuenta contable NIIF
select * from hosvital.nirsmaux  where nircemp='03' and nircanio=2019 and nircmes=1 and nirccue  like ('1592%');  -- No hay movimientoen NIIF

select * from hosvital.movcont2 where doccod='SIF' and mvcnro = 1 and cntcod like ('2610%'); --      Nohay cargue LOCAL
select * from hosvital.nimovcon2 where doccod='SIF' and nimcnro=1 and nicntcod like ('2610%'); -- No hay Cargue NIIF

select * from hosvital.nimovcon2 where empcod='03' and nimc2anio=2019 and nimc2mes= 1  and nicntcod like ('2610%'); 

select * from hosvital.movcont2 where empcod='03' and mvcanio=2019 and mvcmes=1 and cntcod like ('2610%'); -- estos documentos No estan SINCRONIZADOS
 
select * from hosvital.cuentas where empcod='03' and cntcod like ('2610%') and cntvig=2019 ;  -- Si esta creada la cuenta contable LOCAL
select * from hosvital.rsmaux  where rsmempcod='03' and rsmano=2019 and rsmmes=1 and rsmctncon like ('2610%'); -- Si hay movimiento LOCAL
select * from hosvital.nicuentas where empcod='03' and nicntcod like ('2610%') and nicntvig=2019 ;   -- No esta creada la cuenta contable NIIF
select * from hosvital.nirsmaux  where nircemp='03' and nircanio=2019 and nircmes=1 and nirccue  like ('2610%');  -- No hay movimientoen NIIF

-- la cuenta 15

select * from hosvital.nicuentas where empcod='03' and nicntcod like ('15%') and nicntvig=2019 ;


