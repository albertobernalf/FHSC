select  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc,
T1.HOPTPPZ AS PLAZO,
SUM(hopvlrobl) OBLIGACIONES,
SUM(hoptotcre-hoptotdeb) saldo,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ    and  (days(current_date) - days( DATE(x.HOPFCHRAD)))  <=  t1.hoptppz )    as  XVencer,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where   x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ   and  (days(current_date) -  days(DATE(x.HOPFCHRAD)))  >  t1.hoptppz )    as  vencidas
from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig='2019'  and t3.cntvig=t1.cntvig)
where  t1.prvcod= '17068260' AND T1.CNTVIG IN ('2019') 
GROUP BY  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc   , T1.HOPTPPZ