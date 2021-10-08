select * from hosvital.hojoblprv where cntvig='2019';
select * from hosvital.proveedor1; -- tippcod 



select t1.empcod,T1.CNTVIG,T1.CNTCOD,t1.prvcod,t2.trcrazsoc,cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) AS PLAZO,


(select                    SUM(hopvlrobl) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod=t1.prvcod and (x.cntvig= t1.cntvig) and x.cntcod = t1.cntcod and  (x.hoptotcre -  x.hoptotdeb) > 0  and cast((case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric)  and year(date(x.hopfchobl))>= (t1.cntvig-2)) as obligaciones,
(select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod= t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.cntcod = t1.cntcod  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as saldo,
(select SUM (hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.cntcod = t1.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and (days(current_date) - days( DATE(x.HOPFCHRAD)))<= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as    
  XVenTotal, 
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 1 and  p2.tippcod <=30 
) as av,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 31 and  p2.tippcod <=60 
) as atreintasias
from hosvital.hojoblprv t1 
inner join hosvital.terceros t2 on (t2.trccod=t1.prvcod) 
inner join hosvital.proveedor1 x on (x.prvcod=t1.prvcod)
where t1.empcod= '01' and  t1.cntvig='2019' and  t1.mcdpto='001'   and x.PRVCON<>''  --  and t2.trccod ='860034594'

GROUP BY t1.empcod,T1.CNTVIG,T1.CNTCOD,t1.prvcod,t2.trcrazsoc ,t1.hoptppz having (select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod=t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig)>0 order by T1.CNTCOD,trcrazsoc;



select  sum(y.hoptotcre - y.hoptotdeb) as total
from hosvital.hojoblprv y, hosvital.proveedor1 p2
where  y.empcod='01' and y.mcdpto='001' and y.prvcod='860034594' and y.cntvig=2019  and y.empcod=p2.empcod and y.prvcod=p2.prvcod and p2.tippcod between 1 and 360;

select sum(hoptotcre - hoptotdeb) as total  from hosvital.hojoblprv where prvcod= '860034594' and cntvig=2019;
select *  from hosvital.hojoblprv where prvcod= '860034594' and cntvig=2019;
select * from hosvital.proveedor1 where prvcod= '860034594' ;

-- desde aquip
, 
(
select  sum(y.hoptotdeb - y.hoptotcre)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.empcod=p2.empcod  and
	 y.prvcod=p2.prvcod  and  p2.empcod=x.empcod and  p2.prvcod=x.prvcod and p2.prvcod= t2.trccod and  p2.tippcod= x.tippcod and p2.tippcod >= 1 and  p2.tippcod <=60 
) as asesentadias

---- desde aqiop

,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 61 and  p2.tippcod <=90 
) as xVencer_60,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 61 and  p2.tippcod <=90 
) as xVencer_90,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 91 and  p2.tippcod <=180 
) as xVencer_180,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 91 and  p2.tippcod <=360 
) as xVencer_360,
(
select  sum(y.hoptotcre - y.hoptotdeb)   
from hosvital.hojoblprv y , hosvital.proveedor1 p2
where  y.empcod=t1.empcod  and y.prvcod=t1.prvcod  and y.cntcod=t1.cntcod  and y.cntvig=t1.cntvig and  y.hoptppz=t1.hoptppz and y.prvcod=p2.prvcod and p2.tippcod >= 361
) as xVencer_Ms360


--
