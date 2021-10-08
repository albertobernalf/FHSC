select * from hosvital.movcont3 where empcod='02' and doccod='FV' and mvcnro=22;
select * from hosvital.movcont2 where empcod='02' and doccod='FV' and mvcnro=22;

select * from hosvital.movcxc where empcod='02' and doccod='FV' and mvcxcnro=22 and mccnumobl ='601';


select * from hosvital.hojobl where  empcod='02' and hojnumobl  in ('21411','601');

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and cntvig=2019;


UPDATE   hosvital.movcxc
set cntvig = 2018
 where doccod='FV' and  mccnumobl  in ('601');



UPDATE   hosvital.hojobl
set hojcnsing=0
 where doccod='FV' and  hojnumobl  in ('601');


select * from hosvital.movcxc where mccnumobl in ('21411','601');


       	

--delete from hosvital.hojobl where  empcod='02' and doccod='FV' and   hojnumobl  in ('601');

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and  cntvig=2019 and hojnumobl  in ('21411','601') and cntcod= '13050501' ;

/*
insert into hosvital.hojobl ( EMPCOD,HOJNUMOBL,CLICOD,cntvig,CNTCOD,MCDPTO,DOCCOD,MENNIT,CNUCOD,CNUSUB,'2019-06-10 00:00:00',HOJVLRCUO,HOJCUOINI,920598.00,HOJTOTCRE,920598.00,HOJTIPPAG,HOJTPPGDS,
HOJNUMCUO,HOJNROREM,HOJFCHREM,HOJNRORAD,HOJFCHRAD,HOJTIPGLO,HOJSTAGLO,HFCHRECGL,HJFCHRADGL,'0001-01-01',HOJVLRGLO,HOINDDEV,HONORADG,HOJMATIPD,HOJNROCAS,HOJCARRCH,
CONTIP,CONCOD,HOJFCHRCH,HOJUSRRCH,HOJINDFAC,HOJDOCRES,HOJNOMRES,HOJAPERES,HOJCNSING,HOJESTHOM,HOJINDREC,HOJPRF,HOJFCHRAR,HOJNUMRAR,HOJUSUINF,HOJFCHINF,HOJINDINF,HOJOBLCLU,
HOJOBLCLF,HOJOBLCLE)
select EMPCOD,601,'51614028',2019,CNTCOD,MCDPTO,DOCCOD,MENNIT,CNUCOD,CNUSUB,HOJFCHOBL,HOJVLRCUO,HOJCUOINI,HOJVLROBL,HOJTOTCRE,HOJTOTDEB,HOJTIPPAG,HOJTPPGDS,
HOJNUMCUO,HOJNROREM,HOJFCHREM,HOJNRORAD,HOJFCHRAD,HOJTIPGLO,HOJSTAGLO,HFCHRECGL,HJFCHRADGL,HJFCANOBL,HOJVLRGLO,HOINDDEV,HONORADG,HOJMATIPD,HOJNROCAS,HOJCARRCH,
CONTIP,CONCOD,HOJFCHRCH,HOJUSRRCH,HOJINDFAC,HOJDOCRES,HOJNOMRES,HOJAPERES,HOJCNSING,HOJESTHOM,HOJINDREC,HOJPRF,HOJFCHRAR,HOJNUMRAR,HOJUSUINF,HOJFCHINF,HOJINDINF,HOJOBLCLU,
HOJOBLCLF,HOJOBLCLE
from hosvital.hojobl
 where doccod='FV' and  hojnumobl  in ('21411') and cntcod= '13050501' ;

*/

select * from hosvital.movcont3 where empcod='02' and doccod='FV' and mvcnro=63;
select * from hosvital.movcont2 where empcod='02' and doccod='FV' and mvcnro=63;

select * from hosvital.movcont3 where empcod='02' and doccod='DR' and mvcnro=1619;
select * from hosvital.movcont2 where empcod='02' and doccod='DR' and mvcnro=1619;

-- Actualiza elsaldo

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('601') ;  -- and cntcod= '13050501' ;


UPDATE   hosvital.hojobl
set HOJTOTCRE= HOJTOTDEB
 where EMPCOD='03', doccod='FV' and  hojnumobl  in ('601');

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('26','57') ; 
select * from hosvital.MOVCXC where  empcod='02' and doccod='FV' and MCCNUMOBL  in ('2196','932') ; 


select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('24') ; 
select * from hosvital.MOVCXC where  empcod='02' and doccod='FV' and MCCNUMOBL  in ('809') ; 


select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('22') ; 


-- SEGUNDO CASO :

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('679','601') ; 
select * from hosvital.MOVCXC where  empcod='02' and doccod='FV' and MCCNUMOBL  in ('679') ; 

-- Intentemos un INSERT A la Movcxc

select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('22') ; 

select * from hosvital.MOVCXC where  empcod='02' and doccod='FV' and MCCNUMOBL  in ('679') ; 

select * from hosvital.movcont2 where empcod='02' and doccod='FV' and mvcnro=22  AND MVCDOCRF1='679';
--DELETE FROM hosvital.movcxc where empcod='02' and doccod='FV' and MCCNUMOBL  in ('679')  ; 

--insert into hosvital.movcxc
--(EMPCOD,DOCCOD,MCDPTO,MVCXCNRO,MCCCSC,CNTVIG,MCCFCH,MVCXCMON,MVCXCTAS,MCCNUMOBL,CNTCOD,MCCNAT,clicod,MENNIT,mccvlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MCCCNC,
--MCCANU,MCCDOCFAC,MVCCLIRCL	,MVCCNTRCL,MOVPRF)
select EMPCOD,DOCCOD,MCDPTO,MVCXCNRO,738,CNTVIG,MCCFCH,MVCXCMON,MVCXCTAS,'679',CNTCOD,MCCNAT,'53116697',MENNIT,678740.00,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MCCCNC,
MCCANU,MCCDOCFAC,MVCCLIRCL,MVCCNTRCL,MOVPRF
from hosvital.movcxc
where empcod='02' and doccod='FV' and MCCNUMOBL  in ('601')  ; 

-- creamos una hojoblb con vigencia 2019


insert into hosvital.hojobl ( EMPCOD,HOJNUMOBL,CLICOD,cntvig,CNTCOD,MCDPTO,DOCCOD,MENNIT,CNUCOD,CNUSUB,hojfchobl,HOJVLRCUO,HOJCUOINI,hojvlrobl,HOJTOTCRE,hojtotdeb,HOJTIPPAG,HOJTPPGDS,
HOJNUMCUO,HOJNROREM,HOJFCHREM,HOJNRORAD,HOJFCHRAD,HOJTIPGLO,HOJSTAGLO,HFCHRECGL,HJFCHRADGL,hjfcanobl,HOJVLRGLO,HOINDDEV,HONORADG,HOJMATIPD,HOJNROCAS,HOJCARRCH,
CONTIP,CONCOD,HOJFCHRCH,HOJUSRRCH,HOJINDFAC,HOJDOCRES,HOJNOMRES,HOJAPERES,HOJCNSING,HOJESTHOM,HOJINDREC,HOJPRF,HOJFCHRAR,HOJNUMRAR,HOJUSUINF,HOJFCHINF,HOJINDINF,HOJOBLCLU,
HOJOBLCLF,HOJOBLCLE)

select EMPCOD,679,'53116697',2019,CNTCOD,MCDPTO,DOCCOD,MENNIT,CNUCOD,CNUSUB,'2019-06-10 00:00:00',HOJVLRCUO,HOJCUOINI,678740.00,0,678740.00,HOJTIPPAG,HOJTPPGDS,
HOJNUMCUO,HOJNROREM,HOJFCHREM,HOJNRORAD,HOJFCHRAD,HOJTIPGLO,HOJSTAGLO,HFCHRECGL,HJFCHRADGL,'0001-01-01',HOJVLRGLO,HOINDDEV,HONORADG,HOJMATIPD,HOJNROCAS,HOJCARRCH,
CONTIP,CONCOD,HOJFCHRCH,HOJUSRRCH,HOJINDFAC,HOJDOCRES,HOJNOMRES,HOJAPERES,HOJCNSING,HOJESTHOM,HOJINDREC,HOJPRF,HOJFCHRAR,HOJNUMRAR,HOJUSUINF,HOJFCHINF,HOJINDINF,HOJOBLCLU,
HOJOBLCLF,HOJOBLCLE
from hosvital.hojobl
 where empcod='02' and doccod='FV' and  hojnumobl  in ('601'); -- and cntcod= '13050501' and cntvig=2019 ;

select * from hosvital.MOVCXC where  empcod='02' and doccod='FV' and MCCNUMOBL  in ('679') ; 
select * from hosvital.hojobl where  empcod='02' and doccod='FV' and hojnumobl  in ('679') ; 


-- tercer caso 

