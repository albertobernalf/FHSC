select   SUM( p.HOJTOTDEB- p.HOJTOTCRE)
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = '830003564' AND p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302' )   and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
	(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )     when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)) <= 30;

select   *
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = '830003564' AND p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302' )   and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
	(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )     when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)) <= 30;


select   SUM( p.HOJTOTDEB- p.HOJTOTCRE)
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = '830003564' AND p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302' )   and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
	(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )     when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end))  between 31 and 60;

select   *
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = '830003564' AND p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302' )   and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and date(p.HOJFCHRAD) = t.aglfrdfac and
	(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )     when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end))  between 31 and 60
order by hojnumobl;

select * from hosvital.admglo11 where mpnfac = 462443 ;  -- la remision estya dos (2) veces
select * from hosvital.admglo11 where mpnfac = 504094   ; 
select  * from hosvital.hojobl where hojnumobl ='504094' ; 





SELECT  *
FROM HOSVITAL.HOJOBL
WHERE clicod = '830003564' AND cntvig=2019 and  substring (cntcod,1,4) in ('1302' ,'1303','1399') AND   ( HOJTOTDEB-HOJTOTCRE) >0 ;

-- 5638336695.49 / 5625855385.49	

SELECT    sum(hojtotdeb - hojtotcre)
FROM HOSVITAL.HOJOBL
WHERE clicod = '830003564' AND cntvig=2019 and  substring (cntcod,1,4) in ('1302' ,'1303','1399') AND   ( HOJTOTDEB-HOJTOTCRE) >0 and  HOJFCHRAD <= '2019-03-31 23:59:59' ;


SELECT    sum(hojtotdeb - hojtotcre)
FROM HOSVITAL.HOJOBL
WHERE clicod = '830003564' AND cntvig=2019 and  substring (cntcod,1,4) in ('1306') AND   ( HOJTOTDEB-HOJTOTCRE) >0  ; --and  HOJFCHRAD <= '2019-03-31 23:59:59' ;

select 
* from
hosvital.movcont2
where doccod='ire';

select  *  from hosvital.movcont2 ;

select  *  from hosvital.movcont2 
where doccod ='DRC'

-- Detalle de pagos

limit 100;

select * from hosvital.MOVCONT2
WHERE DOCCOD ='DRC' AND MVCCFCH >='2019-03-01';
 

SELECT * FROM HOSVITAL.MOVCXC WHERE CLICOD = '830003564' LIMIT 100;


	
