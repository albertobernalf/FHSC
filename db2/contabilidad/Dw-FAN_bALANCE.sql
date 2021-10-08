select * from hosvital.movcont2 where EMPCOD='03' AND doccod='SIF' AND MVCNRO=1 and mcdpto='003';



select * from hosvital.nimovcon2 where EMPCOD='03' AND doccod='SIF'   AND nimcnro=1;

select * from hosvital.movcont3 where EMPCOD='03' AND doccod='SIF' AND MVCNRO=1;


select * from hosvital.RSMAUX where rsmempcod='03' and rsmano = 2019  and rsmmes=1 ;
--delete  from hosvital.RSMAUX where rsmempcod='03' and rsmano = 2019  and rsmmes=1 ;

select * from hosvital.NIRSMAUX  where nircemp='03' and nircanio = 2019  and nircmes =1;
--delete  from hosvital.NIRSMAUX  where nircemp='03' and nircanio = 2019  and nircmes =1;
select * from hosvital.NIRSMGEN  where nircemp='03' and nircanio = 2019 and nircmes=1;
--delete from hosvital.NIRSMGEN  where nircemp='03' and nircanio = 2019 and nircmes=1;


select * from hosvital.RESMCUE where rsmempcod='03' and rsmano = 2019 and rsmmes=1;
--delete from hosvital.RESMCUE where rsmempcod='03' and rsmano = 2019 and rsmmes=1;


select * from hosvital.nicuentas;
select count(*) from hosvital.cuentas where empcod='03' and cntvig=2019 ; -- 806 toatal cuentas creadas en LOCAL

select cntcod from hosvital.cuentas where empcod='03' and cntvig=2019 group by cntcod having count(*) >1; -- no hay repetidas

select count(*) from hosvital.nicuentas where empcod='03' and nicntvig = 2019; -- 788  ,m Que opasa hay 11 cuentas cion algun tipo de problema

select count(*) from hosvital.nicuentas where empcod='03' and nicntvig = 2019 AND nicntcod not in (select cntcod from hosvital.cuentas where empcod='03' and cntvig=2019); -- 7  En nicuentas NIFF  que NO esta en cuentas LOCAL

select count(*) from hosvital.cuentas where empcod='03' and cntvig=2019  and cntcod not in (select nicntcod from hosvital.nicuentas where empcod='03' and nicntvig=2019);  -- 25  Estan el LOCAL y no en NIIF
select * from hosvital.cuentas where empcod='03' and cntvig=2019  and cntcod not in (select nicntcod from hosvital.nicuentas where empcod='03' and nicntvig=2019);  -- 25  Estan el LOCAL y no en NIIF

select * from hosvital.nimovcon2 where empcod='03'  and doccod='SIF' and nimcnro=1 and nicntcod='261025';  -- and


select * from hosvital.cuentas where empcod='03' and cntvig=2019  and cntcod not in (select nicntcod from hosvital.nicuentas where empcod='03' and nicntvig=2019);  -- 25

select count(*) from hosvital.nicuentas where empcod='03' and nicntvig = 2019 AND nicntcod  in (select cntcod from hosvital.cuentas where empcod='03' and cntvig=2019);  -- 781

select * from  hosvital.nimovcon2 where empcod='03' and doccod = 'SIF' and nimcnro=1 and nicntcod like ('%1592%');

select * from hosvital.nicuentas where empcod='03' and nicntvig = 2019 AND nicntcod not in (select cntcod from hosvital.cuentas where empcod='03' and cntvig=2019); -- 7

SELECT prcodi,count(*) from hosvital.maepro  group by prcodi order by prcodi;


-- Cuentas que no subieron a NIIf mayotizdas

select * from  hosvital.NIRSMAUX  where nircemp='03' and nircanio = 2019  and nircmes =1 and nirccue not in (select c.rsmctncon from hosvital.rsmaux c where  c.rsmempcod='03' and c.rsmano = 2019  and c.rsmmes=1);


-- Cuentas que no subieron a NIIf mayotizdas Ejemplo 01

select * from  hosvital.RSMAUX c where  c.rsmempcod='03' and c.rsmano = 2019  and c.rsmmes=1 and c.rsmctncon  not in (select  n.nirccue from hosvital.NIRSMAUX n where  n.nircemp='03' and n.nircanio = 2019  and n.nircmes =1);

select * from  hosvital.RSMAUX c where  c.rsmempcod='03' and c.rsmano = 2019  and c.rsmmes=1 and c.rsmctncon =  '11050501';  -- Esta cuenta esta creada tanto en Localcomo en NIIF
select * from  hosvital.NIRSMAUX n where n.nircemp='03' and n.nircanio = 2019  and n.nircmes =1 and n.nirccue =  '11050501';  -- Aqui No mayorizo

select * from hosvital.RESMCUE where rsmempcod='03' and rsmano = 2019 and rsmmes=1 and rsmctncon='11050501'; -- Aqui si esta la cuenta mayorizada
select * from hosvital.NIRSMGEN  where nircemp='03' and nircanio = 2019 and nircmes=1 and nirccue='11050501';  -- Aqui No esta m,ayorizada

select *  from hosvital.cuentas where empcod ='03' and cntvig=2019 and cntcod='11050501'
union
select * from hosvital.nicuentas where empcod ='03' and nicntvig=2019 and nicntcod='11050501';

-- veamos los sif
/*
select * from  hosvital.movcont2   where empcod='03' and mvcanio=2019 and mvcmes=1  and cntcod='11050501'
union
*/
select * from  hosvital.nimovcon2 where empcod='03' and nimc2anio=2019 and nimc2mes=1  and nicntcod ='11050501';
select * from  hosvital.nimovcon2 where empcod='03' and doccod='SIF' and nimcnro=1 ;
select * from  hosvital.movcont2 where empcod='03' and doccod='SIF' and mvcnro=1 ;

-- esta si estan mayorizadas pero con diferentes saldos Ejemplo 02

select * from  hosvital.RSMAUX c where  c.rsmempcod='03' and c.rsmano = 2019  and c.rsmmes=1 and c.rsmctncon =  '11200501';
select * from  hosvital.movcont2 where empcod='03' and doccod = 'SIF' and mvcnro=1 and cntcod like ('%11200501%');
select * from  hosvital.movcont2 where empcod='03' and cntcod like ('%11200501%');
select count(*) from  hosvital.movcont2 where empcod='03'  and mvcanio=2019 and mvcmes=1;  -- 817
select * from  hosvital.NIRSMAUX n where n.nircemp='03' and n.nircanio = 2019  and n.nircmes =1 and n.nirccue =  '11200501';  -- de donde saca el debito por 522.05	. en mio concpeto esta mayorizando MAL NIIF
select * from  hosvital.nimovcon2 where empcod='03' and doccod = 'SIF' and nimcnro=1 and nicntcod  =  '11200501';
select count(*) from  hosvital.nimovcon2 where empcod='03'and nimc2anio=2019 and nimc2mes=1 ; -- 817


select mvcnat, sum(mvcvlr)
from  hosvital.movcont2 
where empcod='03'  and mvcanio=2019 and mvcmes=1 and cntcod  =  '11200501' 
group by mvcnat;
/*
C	15252890.61	
D	15254158.04	

*/

select nimc2nat, sum(nimc2vlr)
from  hosvital.nimovcon2
where empcod='03'  and nimc2anio=2019 and nimc2mes=1 and nicntcod  =  '11200501' 
group by nimc2nat;

select * from  hosvital.nimovcon2 where empcod='03'  and nimc2anio=2019 and nimc2mes=1 and nicntcod  LIKE ('111005%') ;
select * from  hosvital.movcont2 where empcod='03'  and mvcanio=2019 and mvcmes=1 and cntcod    LIKE ('111005%') ;
/*
15252890.61	
15254158.04	

*/

update  hosvital.nimovcon2 
set nimc2rf2='',nimc2rf3='',nimc2bse=0.00,nimc2imp='', nimc2ajs='N',nimc2rf5='', nimc2prf=''
where empcod='03'  and nimc2anio=2019 and nimc2mes=1 and nicntcod  =  '11200501'  and nimc2csc=6;

select * from hosvital.nimovcon2  where empcod='03'  and nimc2anio=2019 and nimc2mes=1  order by doccod,nimcnro,nimc2nat,nimc2csc;
select * from hosvital.nimovcon2  where empcod='03'  and nimc2anio=2019 and nimc2mes=1  and ( nimc2rf2  IS NULL  or nimc2rf3  IS NULL  or  nimc2imp  IS NULL  or nimc2rf5  IS NULL  or nimc2prf  IS NULL ) order by doccod,nimcnro,
nimc2csc;

select * from hosvital.nimovcon2  where empcod='03' and doccod='SIF'  and nimc2anio=2019 and nimc2mes=1  and nimc2rf2  is  null  order by doccod,nimcnro,nimc2nat,nimc2csc;
select * from hosvital.nimovcon2  where empcod='03'  and nimc2anio=2019 and nimc2mes=1  AND  MVCDOCREF2  IS NULL   order by doccod,nimcnro,nimc2nat,nimc2csc;


update  hosvital.nimovcon2 
set nimc2bse=0.00
where empcod='03'  and doccod='SIF'  and nimcnro=1 and nimc2anio=2019 and nimc2mes=1  and MVCDOCRF2  is  null ;



create table hosvital.copia_nimovcon2_enero
 as ( select  EMPCOD,DOCCOD,NIMCNRO,MCDPTO,NIMC2CSC,NICNTVIG,NICNTCOD,CNUCOD,CNUSUB,CNCCOD,CNTSUB,TRCCOD,NIMC2RF1,NIMC2RF2,NIMC2RF3,NIMC2NAT,NIMC2VL,NIMC2VE,NIMC2CPT,NIMC2BSE,NIMC2VLR,NIMC2IMP,NIMC2FCH,NIMC2ANIO,NIMC2MES,NIMC2SO,NIMC2AJS,NIMC2RF4,NIMC2RF5,NIMC2PRF
from hosvital.nimovcon2  where empcod='03'  and nimc2anio=2019 and nimc2mes=1 ) with data;

select * from  hosvital.copia_nimovcon2_enero;

-- vALIDEMOS
select * from hosvital.rsmaux;


SELECT substring(rsmctncon,1,6) , sum(rsaxsant),sum(rsaxdeb) debito,sum(rsaxcre),  sum(rsaxsact) credito
from hosvital.rsmaux
where rsmempcod='03' and rsmano=2019 and rsmmes=1
group by substring(rsmctncon,1,6)
order by substring(rsmctncon,1,6);



select * from hosvital.NIRSMAUX;

SELECT substring(nirccue,1,6) , sum(nircadeb) debito,sum(nircacre),  sum(nircaact) credito
from hosvital.NIRSMAUX
where nircemp='03' and nircanio=2019 and nircmes=1
group by substring(nirccue,1,6)
order by substring(nirccue,1,6);

SELECT  sum(nircadeb) debito,  sum(nircacre) credito, sum(nircaact)
from hosvital.NIRSMAUX
where nircemp='03' and nircanio=2019 and nircmes=1;

-- 441303503.61	426049867.62	 234810678.11	

select * from hosvital.NIRSMGEN;

SELECT substring(nirccue,1,1) , sum(nircgdeb) debito,sum(nircgcre),  sum(nircgact) credito
from hosvital.NIRSMGEN
where nircemp='03' and nircanio=2019 and nircmes=1
group by substring(nirccue,1,1)
order by substring(nirccue,1,1);



-- Elaborar el query de totales desde la nimovcon2

SELECT * FROM HOSVITAL.NIMOVCON2 where empcod='03' and nimc2anio=2019 and nimc2mes=1;


SELECT DISTINCT SUBSTRING(N2.NICNTCOD,1,6),
(select sum(n3.nimc2vl)
 from hosvital.nimovcon2 n3
 where n3.empcod=n2.empcod and SUBSTRING(N3.NICNTCOD,1,6)=SUBSTRING(N2.NICNTCOD,1,6) and N3.NIMC2ANIO=N2.NIMC2ANIO and N3.NIMC2MES=N2.NIMC2MES and n3.nimc2nat='D'

)  AS DEBITOS,
(
select sum(n3.nimc2vl)
 from hosvital.nimovcon2 n3
 where n3.empcod=n2.empcod and SUBSTRING(N3.NICNTCOD,1,6)=SUBSTRING(N2.NICNTCOD,1,6) and N3.NIMC2ANIO=N2.NIMC2ANIO and N3.NIMC2MES=N2.NIMC2MES and n3.nimc2nat='C'

) AS CREDITOS
FROM HOSVITAL.NIMOVCON2 N2
WHERE  N2.EMPCOD='03' AND N2.NIMC2ANIO=2019 AND N2.NIMC2MES=1 
ORDER BY SUBSTRING(N2.NICNTCOD,1,6);