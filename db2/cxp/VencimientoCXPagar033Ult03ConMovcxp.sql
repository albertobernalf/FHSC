select * from hosvital.hojoblprv  -- limit 10;
where prvcod ='860050906' and hopnoobl ='FC15528';

select mvcxpnat, sum(mvcxpval) 
 from hosvital.movcxp
where prvcod ='860050906' and mvcxpnuob ='FC15528'
group by mvcxpnat;

select * from  hosvital.movcxp where prvcod ='860050906' and mvcxpnuob ='FC15528';

select * from hosvital.docucon where doccod in ('CEG','CHA');





select t1.empcod,T1.CNTVIG,T1.CNTCOD,t1.prvcod,t2.trcrazsoc,cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) AS PLAZO,


(select                    SUM(hopvlrobl) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod=t1.prvcod and (x.cntvig= t1.cntvig) and x.cntcod = t1.cntcod and  (x.hoptotcre -  x.hoptotdeb) > 0  and cast((case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric)  and year(date(x.hopfchobl))>= (t1.cntvig-2)) as obligaciones,


(select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod= t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.cntcod = t1.cntcod  and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as saldo,

(select SUM (hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.cntcod = t1.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and (days(current_date) - days( DATE(x.HOPFCHRAD)))<= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as XVencer, 

(select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig and x.cntcod = t1.cntcod and cast((case when x.hoptppz='' then 0 else  x.hoptppz end) as numeric)= cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and (days(current_date) -days (DATE (x.HOPFCHRAD)))> cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as vencidas,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and  (x.hoptotcre -  x.hoptotdeb) > 0  and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-2) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Ano_2017,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =1 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Ene_2018,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =2 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Feb_2018,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =3 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Mar_2018,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =4 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Abr_2018,



(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =5 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as May_2018,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =6 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Jun_2018,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =7 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Jul_2018,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =8 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Ago_2018,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =9 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Sep_2018,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =10 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Oct_2018,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =11 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Nov_2018,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod  and  (x.hoptotcre -  x.hoptotdeb) > 0  and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig-1) and month(date(y.mvcxpfch)) =12 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Dic_2018,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob   and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =1 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Ene_2019,



(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig   and (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =2 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Feb_2019,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig  and (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =3 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Mar_2019,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and  cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig  and (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =4 and year(date(x.hopfchobl))>= (t1.cntvig-2) ) as Abr_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =5 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as May_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =6 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Jun_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig  and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =7 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Jul_2019,
(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =8 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Ago_2019,

(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =9 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Sep_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0  and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =10 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Oct_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0 and x.hopnoobl = y. mvcxpnuob  and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =11 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Nov_2019,


(select  sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
  from hosvital.hojoblprv x ,  hosvital.movcxp y where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig= (t1.cntvig) and x.cntcod = t1.cntcod and t1.cntcod= y.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric) = cast( (case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and x.empcod=y.empcod and  x.prvcod=y.prvcod and x.cntvig=y.cntvig and  (x.hoptotcre -  x.hoptotdeb) > 0   and x.hopnoobl = y. mvcxpnuob and  year(date(y.mvcxpfch)) = (t1.cntvig) and month(date(y.mvcxpfch)) =12 and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Dic_2019,



(select sum(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod = t1.empcod and x.prvcod= t1.prvcod and x.cntvig=t1.cntvig and x.cntcod = t1.cntcod and cast( (case when x.hoptppz='' then 0 else x.hoptppz end) as numeric)=cast((case when t1.hoptppz='' then 0 else t1.hoptppz end) as numeric) and year(date(x.hopfchobl))>= (t1.cntvig-2)) as Total

from hosvital.hojoblprv t1 inner join hosvital.terceros t2 on (t2.trccod=t1.prvcod) 
inner join hosvital.proveedor1 x on (x.prvcod=t1.prvcod)
where t1.cntvig='2019' and  t1.mcdpto='001'   and x.PRVCON<>''
 -- and t2.trccod in ('700164717') 
GROUP BY t1.empcod,T1.CNTVIG,T1.CNTCOD,t1.prvcod,t2.trcrazsoc ,t1.hoptppz having (select SUM(hoptotcre-hoptotdeb) from hosvital.hojoblprv x where x.empcod=t1.empcod and x.prvcod= t1.prvcod and x.cntvig= t1.cntvig)>0 order by T1.CNTCOD,trcrazsoc

