select * from hosvital.movcont3 where doccod='CA' and mvcnro=8106;
select * from hosvital.movcont3 where doccod='CA' and mvcnro=8105;

select * from hosvital.movcont2 where doccod='CA' and mvcnro=8106;
select * from hosvital.movcont2 where doccod='FC' and mvcnro=609;



select * from hosvital.nimovcon1  where doccod='CA' and mvcnro=8106;
select * from hosvital.movcont2 where doccod='CA' and mvcnro=8105;

select * from hosvital.nimovcon2 where doccod='DRC' and nimcnro in (23269);

select * from hosvital.nimovcon1 where doccod='CA' and nimcnro in  (8105) ;
select * from hosvital.nimovcon1 where doccod='CA' and nimcnro in  (8106) ;


select * from hosvital.nimovcon2 where doccod='CA' and nimcnro in  (8105) ;
select * from hosvital.nimovcon2 where doccod='CA' and nimcnro in  (8106) ;


insert into
 hosvital.nimovcon1
select empcod,doccod,mvcnro,mcdpto,mvccpt,agccdg,tranapl,mvcfch,'PES',mvctascmb,mvcest,mvcusucre,mvcusuact,mvcfchact,mvcultcsc,mvcmpajs,mvfchsys,' ',mvcfchanu,' ',' ',0,' ',mvcfchemi,mvcfchaut,' ',' ','S','S',' ',' ',0,'  ',' ', ' ',' '
from hosvital.movcont3 
where doccod='CA' and mvcnro=8105;


insert into  hosvital.nimovcon1
select empcod,doccod,9707,mcdpto,'CAUSACIÓN FACTURA NO. 4128164560',agccdg,tranapl,'2019-10-25 00:00:00','PES',mvctascmb,'S',mvcusucre,mvcusuact,'2019-10-25 00:00:00',5,mvcmpajs,mvfchsys,' ',mvcfchanu,' ',' ',0,' ',mvcfchemi,mvcfchaut,' ',' ','S','S',' ',' ',0,'  ',' ', ' ',' '
from hosvital.movcont3 
where doccod='CA' and mvcnro=9512;


--delete from hosvital.nimovcon2 where   doccod='CA' and nimcnro in  (9351) ;
delete from hosvital.nimovcon2 where   doccod='CA' and nimcnro in  (9290) ;

select * from hosvital.nimovcon1 where doccod='CA' and nimcnro in  (9512) ;
select * from hosvital.nimovcon2 where doccod='CA' and nimcnro in  (9512) ;
select * from hosvital.nimovcon2 where doccod='CA' and nimcnro in  (9707) ;
select * from hosvital.nimovcon1 where doccod='CA' and nimcnro in  (9707) ;

select * from hosvital.movcont2 where doccod='CA' and mvcnro=9290;


select * from hosvital.movcont2 where doccod='RCM' and mvcnro=309 AND trccod='52129689';

select * from hosvital.movcont2 where doccod='RCM' and mvcnro=309;

SELECT * FROM hosvital.nimovcon1 WHERE DOCCOD='DRC' AND  NIMCNRO=23911;
SELECT * FROM hosvital.nimovcon2 WHERE DOCCOD='FC' AND  NIMCNRO=609;  --   AND TRCCOD = '86000737' ; -- HASTA LA 46

--DELETE FROM hosvital.nimovcon1 WHERE DOCCOD='CA' AND  NIMCNRO IN (10042,10043,10044,10045,10046);

DELETE FROM hosvital.nimovcon2 WHERE DOCCOD='CA' AND  NIMCNRO IN (10301);




insert into  hosvital.nimovcon1
select empcod,doccod,mvcnro,mcdpto,mvccpt,agccdg,tranapl,mvcfch,'PES',mvctascmb,mvcest,mvcusucre,mvcusuact,mvcfchact,mvcultcsc,mvcmpajs,mvfchsys,' ',mvcfchanu,' ',' ',0,' ',mvcfchemi,mvcfchaut,' ',' ','S','S',' ',' ',0,'  ',' ', ' ',' '
from hosvital.movcont3 
where doccod='DRC' and mvcnro=23911;


select * from hosvital.movcont2 where doccod='FC' and mvcnro=609;

SELECT * FROM hosvital.nimovcon2 WHERE DOCCOD='HON' AND  NIMCNRO=17051;  
UPDATE  hosvital.nimovcon2  SET NICNTCOD= '23353001' WHERE DOCCOD='CA' AND  NIMCNRO=11276 AND NIMC2CSC=4;  
-- DELETE FROM hosvital.nimovcon2 WHERE DOCCOD='HON' AND  NIMCNRO=17055;  



select  *  FROM hosvital.nimovcon1 WHERE DOCCOD='HON' AND  NIMCNRO=17055;  
select  *  FROM hosvital.movcont3 WHERE DOCCOD='HON' AND  mvcnro=17055;  

select  *  FROM hosvital.nimovcon2 WHERE DOCCOD='HON' AND  NIMCNRO=17055;  
select  *  FROM hosvital.movcont2 WHERE DOCCOD='PCP' AND  mvcnro=2306;  
select  *  FROM hosvital.movcont2 WHERE DOCCOD='PCP' AND  mvcnro=2306 AND MVCVLR IN (135155,391354,191485,115446,185326,148889) ORDER BY MVCVLR ;  

select  *  FROM hosvital.movcont2 WHERE DOCCOD='FCF' AND  mvcnro=453 ;  

select  *  FROM hosvital.NIMOVCON2 WHERE DOCCOD='FCF' AND  NIMCNRO=453  ;  

DELETE FROM   hosvital.nimovcon2 where EMPCOD = '03' AND doccod='FCF' and nimcnro in  (453 ) ;


insert into  hosvital.nimovcon2
select EMPCOD,DOCCOD,MVCNRO,MCDPTO,MVCCSC,CNTVIG,CNTCOD,CNUCOD,CNUSUB,CNCCOD,CNTSUB,TRCCOD,MVCDOCRF1,MVCDOCRF2,
MVCDOCRF3,MVCNAT,MVCVLRLC,MVCVLREX,MVCDET,MVCBSE,MVCVLR,MVCIMPCOD,MVCCFCH   ,MVCANIO,        MVCMES,          MVCSEDORG,MVCCMPAJ,
MVCDOCRF4,' ', MOVCNTPRF
from  hosvital.movcont2 
where EMPCOD='03' AND doccod='FCF' and mvcnro in  (453)        ;  
          
