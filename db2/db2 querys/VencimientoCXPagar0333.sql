select  t1.empcod,T1.CNTVIG,t1.prvcod,t2.trcrazsoc,
    (case when  t1.hoptppz  != '' then TRIM(LEADING '0' FROM t1.hoptppz) else 0 end)  AS PLAZO,
(select SUM(hopvlrobl) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and (x.cntvig= t1.cntvig )  and   (case when  x.hoptppz  != '' then TRIM(LEADING '0' FROM x.hoptppz) else 0 end)  =   (case when  t1.hoptppz  != '' then TRIM(LEADING '0' FROM t1.hoptppz) else 0 end)  )    as  obligaciones
from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
where t1.cntvig='2019' and  t1.mcdpto='001'  and t1.prvcod = '1079033625' 
GROUP BY  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc ,     (case when  t1.hoptppz != '' then TRIM(LEADING '0' FROM t1.hoptppz) else 0 end)
having
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig   and   (case when  x.hoptppz  != '' then TRIM(LEADING '0' FROM x.hoptppz) else 0 end)  =   (case when  t1.hoptppz  != '' then TRIM(LEADING '0' FROM t1.hoptppz) else 0 end) ) > 0  
order by trcrazsoc;

