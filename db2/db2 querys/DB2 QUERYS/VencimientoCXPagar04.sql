select  t1.empcod,t1.prvcod,t2.trcrazsoc,
T1.HOPTPPZ AS PLAZO,
(select SUM(hopvlrobl) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod   and x.hopfchobl >=  '2018-01-01 00:00:00 '  and x.HOPTPPZ = t1. HOPTPPZ    )    as  obligaciones,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod  and x.hopfchobl >=  '2018-01-01 00:00:00 ' and x.HOPTPPZ = t1. HOPTPPZ    )    as  saldo,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod  and x.hopfchobl >=  '2018-01-01 00:00:00 ' and x.HOPTPPZ = t1. HOPTPPZ    and  (days(current_date) - days( DATE(x.HOPFCHRAD)))  <=  t1.hoptppz )    as  XVencer,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where   x.empcod = t1.empcod and   x.prvcod= t1.prvcod  and x.hopfchobl >=  '2018-01-01 00:00:00 ' and x.HOPTPPZ = t1. HOPTPPZ   and  (days(current_date) -  days(DATE(x.HOPFCHRAD)))  >  t1.hoptppz )    as  vencidas,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod   and  x.HOPTPPZ = t1. HOPTPPZ and  year(date(x.hopfchobl)) = cntvig-1  and month(date(x.hopfchobl)) = 1 
 )  as Enero  
from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig='2019'  and t3.cntvig=t1.cntvig)
where   t1.prvcod='890101815' and t1.hopfchobl >=  '2018-01-01 00:00:00 ' and
t1.mcdpto='001'  
GROUP BY  t1.empcod,prvcod,trcrazsoc   , T1.HOPTPPZ
having
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.hopfchobl >=  '2018-01-01 00:00:00 '   and  x.HOPTPPZ = t1. HOPTPPZ    ) > 0
