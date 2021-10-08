select  prvcod,trcrazsoc,
T1.HOPTPPZ AS PLAZO,
hopnoobl factura,t1.cntcod , t3.cntdsc  concepto, hopfchobl as fecha_obligacion,
t1.cntvig, 
hopfchrad,hoptppz,
hopvlrobl,
hoptotcre as creditos,
hoptotdeb as debitos,
(hoptotcre-hoptotdeb) saldo,
t1.empcod sede,
CASE WHEN T1.HOPTPPZ <>'' THEN (date(T1.HOPFCHRAD)   +  cast(t1.HOPTPPZ as int) days )    WHEN T1.HOPTPPZ='' THEN date(T1.HOPFCHRAD) END AS FECHA_VENC ,
CURRENT_DATE HOY,
(days(CURRENT_DATE) - days(DATE(T1.HOPFCHRAD))) dias,
CASE WHEN (days(CURRENT_DATE) - days(DATE(T1.HOPFCHRAD)) )<  hoptppz  THEN 'X VENCER' ELSE 'VENCIDA' END AS FILTRO_VENCIDAS
from hosvital.hojoblprv t1
inner join   hosvital.terceros t2 on (t2.trccod=t1.prvcod)
inner join hosvital.cuentas t3 on (t3.cntcod=t1.cntcod and t3.cntvig=t1.cntvig and t3.empcod='01')
where t1.cntvig='2018' and t1.prvcod= '17068260'  
order by hopnoobl