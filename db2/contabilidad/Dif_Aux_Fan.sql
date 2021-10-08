SELECT * FROM hosvipru.RSMAUX WHERE  RSMANO=2019 AND RSMEMPCOD='03' AND RSMCTNCON LIKE('11200502%');
SELECT * FROM hosvipru.RESMCUE WHERE  RSMANO=2019 AND rsmmes=1 and RSMEMPCOD='03' AND RSMCTNCON LIKE('11200502%') ;  -- AND TRCCOD='860048608';

SELECT * FROM hosvipru.NIRSMAUX WHERE  NIRCANIO=2019 AND nircmes=1 and NIRCEMP='03'   AND NIRCCUE LIKE('11200502%');
SELECT * FROM hosvipru.NIRSMgen WHERE  NIRCANIO=2019 AND nircmes= 1 and NIRCEMP='03'  aND NIRCCUE LIKE('11200502%') ;  --AND TRCCOD='860048608';


select * from  hosvipru.nimovcon2 ;

select * from  hosvipru.nimovcon1 ;

select  nimc2nat,sum(nimc2vlr)
from hosvipru.nimovcon2 
where  empcod='03' and nimc2anio=2019 and nimc2mes=1
group  by nimc2nat;



select  nimc2nat,sum(nimc2vlr)
from hosvipru.nimovcon2 
where  empcod='03' and nimc2anio=2019 and nimc2mes=1 and  (doccod,nimcnro) in (select doccod,nimcnro from hosvipru.nimovcon1 where  nimc1fch >= '2019-01-01 00:00:00' and  nimc1fch <= '2019-01-31 23:59:59')
group  by nimc2nat;




select  * from hosvipru.nimovcon2 where  empcod='03' and nimc2anio=2019 and nimc2mes=1 and nimc2vlr=561589;

SELECT * FROM hosvipru.NIRSMgen WHERE  NIRCANIO=2019 AND nircmes= 1 and NIRCEMP='01'  AND NIRCCUE LIKE('11200502%') ; 

-- Pruebas
create table hosvipru.nirsmaux_ene2019 as (select * from hosvipru.nirsmaux where NIRCANIO=2019 AND nircmes=1 and NIRCEMP='03') with data;

create table hosvipru.nirsmGEN_ene2019 as (select * from hosvipru.nirsmgen where NIRCANIO=2019 AND nircmes=1 and NIRCEMP='03') with data;


delete from hosvipru.nirsmaux where NIRCANIO=2019 AND nircmes=1 and NIRCEMP='03';

delete from hosvipru.nirsmgen where NIRCANIO=2019 AND nircmes=1 and NIRCEMP='03';

-- junio
SELECT * FROM hosvipru.NIRSMAUX WHERE  NIRCANIO=2019 AND nircmes=1  and NIRCEMP='03';
SELECT * FROM hosvipru.NIRSMAUX WHERE  NIRCANIO=2019 AND nircmes=1  and NIRCEMP='03'   AND NIRCCUE LIKE('11200502%');
SELECT * FROM hosvipru.NIRSMgen WHERE  NIRCANIO=2019 AND nircmes= 1 and NIRCEMP='03'  aND NIRCCUE LIKE('11200502%') ;  --AND TRCCOD='860048608';

create table hosvipru.nirsmaux_copia_03  as (select * from hosvipru.nirsmaux where  NIRCEMP='03') with data;

create table hosvipru.nirsmGEN_copia_03 as (select * from hosvipru.nirsmgen where  NIRCEMP='03') with data;

select * from hosvipru.nirsmaux_copia_03 ORDER BY NIRCANIO,NIRCMES, NIRCCUE;

SELECT * FROM  hosvipru.nirsmaux_ene2019;

/*

INSERT INTO  hosvipru.nirsmaux_copia_03
select * from hosvipru.nirsmaux_ene2019;



INSERT INTO hosvipru.nirsmGEN_copia_03
select * from hosvipru.nirsmGEN_ene2019 ;

*/

--delete from hosvipru.NIRSMAUX    where  NIRCEMP='03';
--delete from hosvipru.NIRSMgen    where  NIRCEMP='03';

select * from hosvipru.nimovcon1 where  empcod='03' and nimc1fch >= '2019-01-01 00:00:00';


SELECT NIRCEMP , COUNT(*) FROM hosvipru.NIRSMAUX  GROUP BY NIRCEMP;
SELECT NIRCEMP , COUNT(*) FROM hosvipru.NIRSMGEN  GROUP BY NIRCEMP;
SELECT * FROM hosvipru.NIRSMgen WHERE  NIRCEMP = '01';

SELECT * FROM hosvipru.nirsmaux_copia_03  ORDER BY NIRCANIO,NIRCMES, NIRCCUE;


CREATE TABLE hosvipru.nirsmaux_COPIA_ORIGINAL
AS
(
SELECT NIRCIDX,NIRCEMP,NIRCCUE,NIRCANIO,NIRCMES,NIRCANIV,NIRCADEB,NIRCACRE,NIRCAANT,NIRCAACT
FROM hosvipru.nirsmaux_copia_03
GROUP BY  NIRCIDX,NIRCEMP,NIRCCUE,NIRCANIO,NIRCMES,NIRCANIV,NIRCADEB,NIRCACRE,NIRCAANT,NIRCAACT)
WITH DATA;

SELECT * FROM hosvipru.nirsmaux_COPIA_ORIGINAL ORDER BY NIRCANIO,NIRCMES,NIRCCUE;
SELECT * FROM hosvipru.nirsmaux_COPIA_ORIGINAL ORDER BY  NIRCANIO,NIRCMES,NIRCCUE ;

--Las tablas copia son :
-- hosvipru.nirsmaux_COPIA_ORIGINAL
--  hosvipru.nirsmGEN_copia_03 

SELECT * FROM hosvipru.nirsmaux_COPIA_ORIGINAL;
SELECT * FROM  hosvipru.nirsmGEN_copia_03 ;



INSERT INTO 	hosvipru.nirsmaux SELECT * FROM  hosvipru.nirsmaux_COPIA_ORIGINAL;
INSERT INTO 	hosvipru.nirsmGEN SELECT * FROM  hosvipru.nirsmGEN_copia_03 ;


