select  t1.empcod,T1.CNTVIG,t1.prvcod,t2.trcrazsoc,
T1.HOPTPPZ AS PLAZO,
(select SUM(hopvlrobl) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and (x.cntvig= t1.cntvig )  and x.HOPTPPZ = t1. HOPTPPZ    )    as  obligaciones,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ    )    as  saldo,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ    and  (days(current_date) - days( DATE(x.HOPFCHRAD)))  <=  t1.hoptppz )    as  XVencer,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where   x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ   and  (days(current_date) -  days(DATE(x.HOPFCHRAD)))  >  t1.hoptppz )    as  vencidas,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-2)   
 )  as dosmildiezysiete  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1)  and month(date(x.hopfchobl)) = 1 
 )  as Enero  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 2 
 )  as Febrero  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 3 
 )  as Marzo  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 4 
 )  as Abril  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and month(date(x.hopfchobl)) = 5 
 )  as Mayo  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 6 
 )  as Junio  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 7 
 )  as Julio  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 8 
 )  as Agosto  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 9 
 )  as Septiembre  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 10 
 )  as Octubre  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 11 
 )  as Npviembre  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 12 
 )  as Diciembre  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 1 
 )  as EneroActual  ,

(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 2 
 )  as FebreroActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 3 
 )  as MarzoActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 4 
 )  as AbrilActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 5 
 )  as MayoActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 6 
 )  as JunioActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 7 
 )  as JulioActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 8 
 )  as AgostoActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 9 
 )  as SeptiembreActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 10
 )  as OctubreActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ  and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 11 
 )  as NoviembreActual  ,
(
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 12
 )  as DiciembreActual  ,
( 
select   sum(hoptotcre-hoptotdeb  )  
 from hosvital.hojoblprv x
where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig = t1.cntvig  and  x.HOPTPPZ = t1. HOPTPPZ and year(date(x.hopfchobl)) >= (t1.cntvig-2) 
 )  as Total  

from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig='2019'  and t3.cntvig=t1.cntvig)
where t1.cntvig='2019' and  -- t1.prvcod='890101815' and 
t1.mcdpto='001'  
GROUP BY  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc   , T1.HOPTPPZ
having
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ    ) >0
order by trcrazsoc