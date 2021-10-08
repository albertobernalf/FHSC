SELECT * FROM HOSVITAL.NICUENTAS;  --EMPCOD, NINICNTVIG,NINIcntcod,NINIcntdsc, NINIcntnvl
SELECT * FROM HOSVITAL.NIRSMAUX;   -- NIRCEMP,NIRCCUE,NIRCANIO,NIRCMES,NIRCADEB,NIRCACRE,NIRCAANT,NIRCAACT

select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAANT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1)
))   as saldo_Aterior ,
sum((select
  sum((r.NIRCADEB)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1)
))   as Debitos ,
sum((select
  sum((r.NIRCACRE)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAACT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1)
))   as saldo_actual 

from hosvital.NICUENTAS c 
where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,1)>='0'   AND c.NIcntnvl=1
group by c.NIcntcod,c.NIcntdsc 
union
select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAANT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2)
))   as saldo_Aterior ,
sum((select
  sum((r.NIRCADEB)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2)
))   as Debitos ,
sum((select
  sum((r.NIRCACRE)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAACT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2)
))   as saldo_actual 

from hosvital.NICUENTAS c 
where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,2)>='00'   AND c.NIcntnvl=2
group by c.NIcntcod,c.NIcntdsc 
union
select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAANT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)
))   as saldo_Aterior ,
sum((select
  sum((r.NIRCADEB)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)
))   as Debitos ,
sum((select
  sum((r.NIRCACRE)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAACT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)
))   as saldo_actual 
from hosvital.NICUENTAS c 
where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,4)>='000'   AND c.NIcntnvl=3
group by c.NIcntcod,c.NIcntdsc 
union
select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAANT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6)
))   as saldo_Aterior ,
sum((select
  sum((r.NIRCADEB)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6)
))   as Debitos ,
sum((select
  sum((r.NIRCACRE)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAACT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6)
))   as saldo_actual 
from hosvital.NICUENTAS c 
where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,6)>='000000'   AND c.NIcntnvl=4
group by c.NIcntcod,c.NIcntdsc 
union
select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAANT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8)
))   as saldo_Aterior ,
sum((select
  sum((r.NIRCADEB)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8)
))   as Debitos ,
sum((select
  sum((r.NIRCACRE)) 
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.NIcntcod,1,1)='1' 	and   cc.NIcntnat='D' then  r.NIRCAACT
                when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT
   	 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT
               when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT
                 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual
  from hosvital.NICUENTAS cc
  inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8)
))   as saldo_actual 
from hosvital.NICUENTAS c 
where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,8)>='000000'   AND c.NIcntnvl=5
group by c.NIcntcod,c.NIcntdsc 
order by 1;


-- Acotado



select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='D' then r.NIRCAANT  when substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='C' then  -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='2' and cc.NIcntnat='C' then r.NIRCAANT  when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then -r.NIRCAANT  when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='C' then  r.NIRCAANT
when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='D' then -r.NIRCAANT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then r.NIRCAANT  when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='D' then  -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='D' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then -r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='D' then  r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='C' then -r.NIRCAANT END ) as saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod and r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) 
where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1) )) as saldo_Aterior ,Sum((select sum((r.NIRCADEB)) 
from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1))  where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1) ))   as Debitos ,sum((select sum((r.NIRCACRE))  from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) where cc.empcod=c.empcod and  cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1) ))   as Creditos ,sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='D' then r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='C' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and cc.NIcntnat='C' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='2' and cc.NIcntnat='D' then -r.NIRCAACT
when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='C' then r.NIRCAACT when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='D' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='C' then r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='D' then -r.NIRCAACT  when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='D' then r.NIRCAACT when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='C' then -r.NIRCAACT 
 when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='D' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='C' then -r.NIRCAACT END ) as saldo_actual from hosvital.NICUENTAS cc 
inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and r.NIRCANIO=2019 and r.NIRCMES>=? and r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,1)= substring(cc.NIcntcod,1,1)  and  substring(r.NIRCCUE,1,1)= substring(c.NIcntcod,1,1)  ) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,1) = substring(c.NIcntcod,1,1) 
))   as saldo_actual from hosvital.NICUENTAS c  where c.empcod='03' and c.NICNTVIG=2019 and substring(c.NIcntcod,1,1)>='0' AND c.NIcntnvl=1 group by c.NIcntcod,c.NIcntdsc union select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta, 
sum((select  sum(case when   substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='D' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='C' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT  when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then -r.NIRCAANT  when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT  when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='D' then  -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='C' then r.NIRCAANT  when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='D' then -r.NIRCAANT  when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='D' then  r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='C' then -r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='D' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='C' then  -r.NIRCAANT END ) as  saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)=  substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and  substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2) ))   as saldo_Aterior ,sum((select  sum((r.NIRCADEB)) from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019  and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) 
where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2) ))   as Debitos , sum((select sum((r.NIRCACRE))  from hosvital.NICUENTAS cc 
inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)=  substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2) 
)) as Creditos , sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' And  cc.NIcntnat='D' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='C' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and cc.NIcntnat='C' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT  when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual  from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and r.NIRCMES>=? and r.NIRCMES<=? and substring(r.NIRCCUE,1,4)=  substring(cc.NIcntcod,1,4) and  substring(r.NIRCCUE,1,2)= substring(cc.NIcntcod,1,2)  and  substring(r.NIRCCUE,1,2)= substring(c.NIcntcod,1,2)  ) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=3 and  substring(cc.NIcntcod,1,2) = substring(c.NIcntcod,1,2) ))   as saldo_actual  from hosvital.NICUENTAS c  where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,2)>='00'   AND c.NIcntnvl=2 group by c.NIcntcod,c.NIcntdsc 
union select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta, sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT  when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) 
where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4))) as saldo_Aterior ,sum((select sum((r.NIRCADEB)) from hosvital.NICUENTAS cc 
inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)=  substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4) 
)) as Debitos ,sum((select sum((r.NIRCACRE)) from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND  cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)))   as Creditos ,sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='D' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='C'  then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAACT  when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT 
 when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAACT END ) as saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6) and  substring(r.NIRCCUE,1,4)= substring(cc.NIcntcod,1,4)  and  substring(r.NIRCCUE,1,4)= substring(c.NIcntcod,1,4)  ) where cc.empcod=c.empcod and  cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=4 and substring(cc.NIcntcod,1,4) = substring(c.NIcntcod,1,4)))   as saldo_actual from hosvital.NICUENTAS c where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,4)>='000'   AND  c.NIcntnvl=3 group by c.NIcntcod,c.NIcntdsc union select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta,sum((select  sum(case when   substring(cc.NIcntcod,1,1)='1'and cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='1' 	and  cc.NIcntnat='C' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then  -r.NIRCAANT  when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D'  then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then  -r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then  -r.NIRCAANT END ) as saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)) where cc.empcod=c.empcod and  cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6) ))   as saldo_Aterior , sum((select sum((r.NIRCADEB)) from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6) )) as Debitos ,sum((select sum((r.NIRCACRE)) 
From hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) =  substring(c.NIcntcod,1,6) ))   as Creditos ,sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='D' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='1' and  cc.NIcntnat='C' then -r.NIRCAACT when  substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='C' then  r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='3' and  cc.NIcntnat='D' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='C' then r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='D' then  -r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='D' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='C' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='D' then  r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='6' and  cc.NIcntnat='C' then -r.NIRCAACT END ) as saldo_actual from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and   r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,6)= substring(cc.NIcntcod,1,6)  and  substring(r.NIRCCUE,1,6)= substring(c.NIcntcod,1,6)) 
where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,6) = substring(c.NIcntcod,1,6) )) as saldo_actual  from hosvital.NICUENTAS c  where c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,6)>='000000'   AND c.NIcntnvl=4 group by c.NIcntcod,c.NIcntdsc  union select c.NIcntcod cuenta,c.NIcntdsc descripcion_cuenta, sum((select  sum(case when substring(cc.NIcntcod,1,1)='1' and cc.NIcntnat='D' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAANT WHEN substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAANT when substring(cc.NIcntcod,1,1)='2' and cc.NIcntnat='D' then  -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='C' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='D' then -r.NIRCAANT when substring(cc.NIcntcod,1,1)='4' and  cc.NIcntnat='C' then r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='D' then -r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='D' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='5' and  cc.NIcntnat='C' then -r.NIRCAANT 
when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='D' then r.NIRCAANT when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='C' then -r.NIRCAANT END ) as saldo_actual from hosvital.NICUENTAS cc 
inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)=  substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8) 
)) as saldo_Aterior ,sum((select sum((r.NIRCADEB))  from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND  cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8) ))   as Debitos ,sum((select sum((r.NIRCACRE))  from hosvital.NICUENTAS cc inner join hosvital.NIRSMAUX r on (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8))  
 where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8) ))   as Creditos ,sum((select sum(case when   substring(cc.NIcntcod,1,1)='1' 	and cc.NIcntnat='D' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='1'	 and  cc.NIcntnat='C' then  -r.NIRCAACT when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='C' then  r.NIRCAACT  when substring(cc.NIcntcod,1,1)='2' and  cc.NIcntnat='D' then -r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='C' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='3' and cc.NIcntnat='D' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='C' then r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='4' and cc.NIcntnat='D' then -r.NIRCAACT when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='D' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='5' and cc.NIcntnat='C' then -r.NIRCAACT 
when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='D' then r.NIRCAACT  when substring(cc.NIcntcod,1,1)='6' and cc.NIcntnat='C' then -r.NIRCAACT END ) as saldo_actual from hosvital.NICUENTAS cc   inner join hosvital.NIRSMAUX r on  (r.NIRCEMP=c.empcod  and r.NIRCEMP=cc.empcod  and  r.NIRCANIO=2019 and  r.NIRCMES>=? and  r.NIRCMES<=? and substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8) and  substring(r.NIRCCUE,1,8)= substring(cc.NIcntcod,1,8)  and  substring(r.NIRCCUE,1,8)= substring(c.NIcntcod,1,8)  ) where cc.empcod=c.empcod and cc.NICNTVIG=c.NICNTVIG  AND cc.NIcntnvl=5 and substring(cc.NIcntcod,1,8) = substring(c.NIcntcod,1,8) ))  as saldo_actual from hosvital.NICUENTAS c where  c.empcod='03' and c.NICNTVIG=2019 and   substring(c.NIcntcod,1,8)>='000000' AND c.NIcntnvl=5 group by c.NIcntcod,c.NIcntdsc order by 1;