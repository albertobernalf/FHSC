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
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 1 
 )  as Enero  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 2 
 )  as Febrero  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 3 
 )  as Marzo  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 4 
 )  as Abril  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 5 
 )  as Mayo  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 6 
 )  as Junio  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 7 
 )  as Julio  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 8 
 )  as Agosto  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) =9 
 )  as Septiembre  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 10
 )  as Octubre  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 11
 )  as Noviembre  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 12 
 )  as Diciembre  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 1
 )  as EneroActual  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 2
 )  as FebreroActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 3
 )  as MarzoActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 4
 )  as AbrilActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 5
 )  as MayoActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 6
 )  as JunioActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 7
 )  as JulioActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 8
 )  as AgostoActual  ,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 9
 )  as SeptiembreActual  ,


(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 10
 )  as OctubreActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 11
 )  as NoviembreActual  ,


(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig)  and  month(date(m.mvcxpfch)) = 12
 )  as DiciembreActual  ,

(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig>= (t1.cntvig-1))  As TotalAcu,
(
select   sum(case when m.mvcxpnat  = 'C' then - m.mvcxpval  when m.mvcxpnat  = 'D'  then m.mvcxpval end  )  
 from hosvital.movcxp m
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig>= (t1.cntvig-1)  
 )/14  as Promedio

from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig='2019'  and t3.cntvig=t1.cntvig)
where t1.cntvig='2019' and t1.prvcod='890101815' and t1.mcdpto='001'
GROUP BY  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc   , T1.HOPTPPZ;
