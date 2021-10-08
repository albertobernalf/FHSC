select x.fec1, x.fec2,x.fecha
from
(
select  t.aglfrdfac as fec1, p.HOJFCHRAD as fec2,		case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac          + 30 DAYS )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) + 30 DAYS)  end as fecha
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod in ( '830003564','900156264')    and p.cntvig=2019 and  substring (p.cntcod,1,6) = '130205' and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer) and t.mpnfac = 490296 and (p.hojtotdeb - p.hojtotcre )<> 0 
) x;

 
select * from hosvital.hojobl where hojnumobl = '490296' and cntvig=2019;

select mpnfac,aglfrdfac,  aglfrdfac+  30 DAYS, current_date, (days(current_date) - days( (aglfrdfac+  30 DAYS)  ))
from hosvital.admglo11 t
where t.mpnfac = 490296;

select  x.clicod,x.total
from
(
select  p.clicod as clicod,  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod in ( '830003564','900156264')    and p.cntvig=2019 and  substring (p.cntcod,1,6) = '130205' and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer) and t.mpnfac = 490296 and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  >= 450
group by p.clicod
) x;	

(
select    sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod in ( '830003564','900156264')    and p.cntvig=2019 and  substring (p.cntcod,1,6) = '130205' and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer) and t.mpnfac = 490296 and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  >= 450

);

select clicod,sum(hojtotdeb - hojtotcre)
from hosvital.hojobl
where cntvig= 2019 and  clicod in ( '830003564','900156264') and  substring (cntcod,1,6) = '130205' and( hojtotdeb - hojtotcre) >0
group by clicod;

select * from hosvital.docucon;


select a.doccod, b.docdsc,count(*)
from hosvital.movcxc a, hosvital.docucon b
where a.doccod = b.doccod
group by a.doccod, b.docdsc; -- RCC = Recibos de caja

-- DRC	DETALLE RECIBOS CAJA CARTERA                                	


select * from hosvital.movban1 where doccod = 'DRC'  limit 100;


select * from hosvital.movcxc 
where doccod='DRC' and mccfch between  '2019-03-01 00:00:00' and  '2019-03-31 23:59:59' limit 1000;
