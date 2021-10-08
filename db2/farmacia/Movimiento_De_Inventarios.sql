select MSRESO,DOCTIP,DOCNRO,MOVFCH,MOVES,MOVCNT,MOVBOD,MOVSLD,TRANCOD,MOVCODPAC from hosvital.kardex1 where  bodega='01' AND MOVFCH >= '2019-08-12 00:00:50' AND msreso='0424N01A' ORDER BY MOVFCH;

-- El arereglo co sitiria en
/*
--UPDATE hosvital.kardex1 
--SET movsld=movsld+40
-- where  BODEGA='01' AND MOVFCH >= '2019-08-12 14:07:50' AND msreso='0424N01A';
*/

select * from hosvital.kardex1 where MOVCODPAC='4233672' order by movfch;

select  * from hosvital.kardex1 where doctip='AEN' and docnro in ('  433209', ' 433263');

select  * from hosvital.kardex1 where docnro=433209;
select  * from hosvital.kardex1 where bodega='01' and MOVFCH >= '2019-08-12 14:07:50' ; --   and doctip='AEN' order by movfch;

select doccod,docnro,msreso,fchmvt,mvtoes,mvtocnt,mvtosld,mvtodocpac from hosvital.movinv4 where fchmvt>= '2019-08-12 09:41:00' and msreso= '0424N01A' and (mvtobde ='01' or  mvtobds ='01') order by fchmvt ;  
select * from hosvital.movinv4 where fchmvt>= '2019-08-12 09:41:50' and msreso= '0424N01A' and (mvtobde ='01' or  mvtobds ='01') order by fchmvt ;  

update hosvital.movinv4 
set mvtosld=mvtosld+40
where fchmvt>= '2019-08-12 14:07:50' and msreso= '0424N01A' and (mvtobde ='01' or  mvtobds ='01') 

--insert into hosvital.kardex1
select EMPCOD,MVTOBDE,MSRESO,DOCCOD,DOCNRO,MVTOCSC,FCHMVT,MVTOES,MVTOCNT,MVTOVLU,MVTOVLR,MVTOBOD,MVTOSLD,'DEVASIS',
MVTONRAUT,MVTOREQN,MVTODOCPAC,MVTOSOLN,MVTOCNSRQ,MVTOTDOPAC,MVTONUMFA,MVTOTIPFA,MVTOCTVIN,MVTOFOLPA,MVTOREQEM,MVTOREQSE,MVTOREQDO
from hosvital.movinv4 where fchmvt>= '2019-08-12 14:07:50' and msreso= '0424N01A' and mvtobde ='01'  order by fchmvt ;  


--insert into hosvital.kardex1
--select EMPCOD,MVTOBDs,MSRESO,DOCCOD,DOCNRO,MVTOCSC,FCHMVT,MVTOES,MVTOCNT,MVTOVLU,MVTOVLR,MVTOBOD,MVTOSLD,
---MVTONRAUT,MVTOREQN,MVTODOCPAC,MVTOSOLN,MVTOCNSRQ,MVTOTDOPAC,MVTONUMFA,MVTOTIPFA,MVTOCTVIN,MVTOFOLPA,MVTOREQEM,MVTOREQSE,MVTOREQDO
--from hosvital.movinv4 where fchmvt>= '2019-08-12 14:07:50' and msreso= '0424N01A' and mvtobds ='01'  order by fchmvt ;  

select * from hosvital.kardex where  bodega='01' AND msreso='0424N01A';

update hosvital.kardex 
set  movsuni = movsuni+40
where  bodega='01' AND msreso='0424N01A';