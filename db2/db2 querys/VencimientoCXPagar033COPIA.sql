select  t1.empcod,T1.CNTVIG,t1.prvcod,t2.trcrazsoc,cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) AS PLAZO,(select SUM(hopvlrobl) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and (x.cntvig= t1.cntvig ) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)) as obligaciones,(select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)) as saldo, (select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and (days(current_date)-days( DATE(x.HOPFCHRAD)))<=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) ) as  XVencer,(select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x  where x.empcod=t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and (days(current_date) - days(DATE(x.HOPFCHRAD)))>cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) )  as vencidas, (select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl))= (t1.cntvig-2)) as dosmildiezysiete ,(select  sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then else t1.hoptppz end)  as numeric)  and year(date(x.hopfchobl)) = (t1.cntvig-1)  and month(date(x.hopfchobl))=1) as Enero, (select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig=(t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 2 ) as Febrero,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) =3) as Marzo,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod=t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 4) as Abril,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and month(date(x.hopfchobl)) = 5) as Mayo, (select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl))= (t1.cntvig-1) and month(date(x.hopfchobl)) = 6 ) as Junio,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) =7) as Julio,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod=t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)  and year(date(x.hopfchobl))= (t1.cntvig-1) and month(date(x.hopfchobl)) =8) as Agosto,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) = 9 ) as Septiembre  ,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)  and year(date(x.hopfchobl)) = (t1.cntvig-1) and month(date(x.hopfchobl)) =10) as Octubre,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and  cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)  and year(date(x.hopfchobl))= (t1.cntvig-1) and month(date(x.hopfchobl)) = 11) as Noviembre,(select sum(hoptotcre-hoptotdeb  ) from hosvital.hojoblprv x where x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric)= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))= (t1.cntvig-1) and month(date(x.hopfchobl))=12) as Diciembre ,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl))=(t1.cntvig) and month(date(x.hopfchobl)) = 1) as EneroActual,(select   sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric)= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric)  and year(date(x.hopfchobl)) =(t1.cntvig) and month(date(x.hopfchobl))=2) as FebreroActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) =3) as MarzoActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig=(t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)   as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl))= (t1.cntvig) and month(date(x.hopfchobl)) =4) as AbrilActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig=(t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) = 5) as MayoActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig=(t1.cntvig) and  cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl))=6 ) as JunioActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv xwhere  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric) and year(date(x.hopfchobl))= (t1.cntvig) and month(date(x.hopfchobl)) =7) as JulioActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig)  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl))=8) as AgostoActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end)  as numeric) =cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) =9) as SeptiembreActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and  x.prvcod=t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))= (t1.cntvig) and month(date(x.hopfchobl))=10 ) as OctubreActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end)  as numeric)  and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) =11) as NoviembreActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod=t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) =cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl)) = (t1.cntvig) and month(date(x.hopfchobl)) =12) as DiciembreActual,(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig = t1.cntvig and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) =cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>=(t1.cntvig-2)) asTotal from hosvital.hojoblprv t1 inner join hosvital.terceros t2 on (t2.trccod=t1.prvcod) where t1.cntvig='2019' and t1.mcdpto='001' GROUP BY t1.empcod,T1.CNTVIG,prvcod,trcrazsoc, t1.hoptppz having (select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where  x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) ) > 0  order by trcrazsoc