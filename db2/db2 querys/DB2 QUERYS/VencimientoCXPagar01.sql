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
 from hosvital.movcxp m, hosvital.hojoblprv s
where  m.empcod = t1.empcod and  m.prvcod= t1.prvcod and m.cntvig= (t1.cntvig-1)  and  month(date(m.mvcxpfch)) = 1 and

           s.empcod = t1.empcod and  s.prvcod= t1.prvcod and s.cntvig= (t1.cntvig-1)  and s.HOPTPPZ=t1.HOPTPPZ
 )  as Enero  ,


(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig-1  )      and month(date(x.HOPFCHRAD)) = 2)      as  Febrero,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and    year(date(x.HOPFCHRAD)) = (x.cntvig-1  ) and month(date(x.HOPFCHRAD)) = 3)      as  Marzo,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and     year(date(x.HOPFCHRAD)) = (x.cntvig-1  ) and month(date(x.HOPFCHRAD)) = 4)      as  Abril,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and    year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 5)      as  Mayo,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and    year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 6)      as  Junio,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and     year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 7)      as  Julio,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and     year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 8)      as  Agosto,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and      year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 9)      as  Septiembre,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 10)      as  Octubre,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig-1  )  and month(date(x.HOPFCHRAD)) = 11)      as  Noviembre,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ and   year(date(x.HOPFCHRAD)) = (x.cntvig-1  )   and month(date(x.HOPFCHRAD)) = 12)      as  Diciembre,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 1)    as  EneroActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 2)    as  FebreroActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 3)    as  MarzoActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 4)    as  AbrilActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 5)    as  MayoActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 6)    as  JunioActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 7)    as  JulioActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 8)    as  AgostoActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 9)    as  SepetiembreActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 10)    as  OctubreActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 11)    as  NoviembreActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  and   year(date(x.HOPFCHRAD)) = (x.cntvig  )           and month(date(x.HOPFCHRAD)) = 12)    as  DiciembreActual,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  )    as  ToalAcu,
(select SUM(hoptotcre-hoptotdeb) 
 from hosvital.hojoblprv x 
 where  x.empcod = t1.empcod and   x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.HOPTPPZ = t1. HOPTPPZ  ) /14  as  Promedio

from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig='2019'  and t3.cntvig=t1.cntvig)

GROUP BY  t1.empcod,T1.CNTVIG,prvcod,trcrazsoc   , T1.HOPTPPZ;
