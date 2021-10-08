select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,
sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos, sum (r.rsaxsact) saldo_actual 
from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) 
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=1 and substring (c.cntcod,1,1)>='0' group by c.cntcod,c.cntdsc 
union 
select c.cntcod cuenta,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterior, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos,sum(r.rsaxsact) saldo_actual from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=2 and substring(c.cntcod,1,2)>='00' 
group by c.cntcod,c.cntdsc 
union 
select c.cntcod cuenta,c.cntdsc descripcion_cuenta,sum(r.rsaxsant) saldo_anterior, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual from hosvital.cuentas c
 inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,4)= substring (c.cntcod,1,4)) 
where c.empcod='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=3 and substring (c.cntcod,1,4)>='000' 
group by c.cntcod,c.cntdsc 
union 
select c.cntcod cuenta,c.cntdsc descripcion_cuenta,sum(r.rsaxsant) saldo_anterior, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos,sum(r.rsaxsact) saldo_actual from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) 
where c.empcod='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=4 and substring(c.cntcod,1,6)>='000000' 
group by c.cntcod,c.cntdsc 
union 
select c.cntcod cuenta,c.cntdsc descripcion_cuenta,sum(r.rsaxsant) saldo_anterior, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,8)= substring (c.cntcod,1,8)) where c.empcod ='03'  and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=5 and substring (c.cntcod,1,8)>='00000000' 
group by c.cntcod,c.cntdsc 
order by 1;

-- Veamos el nivel 1

select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,
sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb) debitos,sum(r.rsaxcre) creditos, sum (r.rsaxsact) saldo_actual 
from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) 
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=1 and substring (c.cntcod,1,1)>='0' 
group by c.cntcod,c.cntdsc ;

select *
from hosvital.cuentas c 
inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) 
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=7 AND c.cntnvl=1 and substring (c.cntcod,1,1)>='0' 
order by  c.cntcod,c.cntdsc ;

-- la cuenta 1592
select * from hosvital.rsmaux where rsmempcod='03' and rsmctncon like ('159216%')  and rsmano=2019 and rsmmes=7;
select * from hosvital.resmcue  where rsmempcod='03' and rsmctncon like ('159216%')  and rsmano=2019 and rsmmes=7;  

select * from hosvital.movcont2 where  empcod='03' and mvcanio=2019 and mvcmes=1 and cntcod  like ('159216%');
select * from hosvital.movcont3 where  empcod='03' and doccod='DPF' AND MVCNRO = 1;

select * from hosvital.movcont3 where  empcod='03' and doccod='SIF' AND MVCNRO = 1;


/*
UPDATE  hosvital.movcont3 
SET  MVFCHSYS='2019-01-01 00:00:00'
where  empcod='03' and doccod='DPF' AND MVCNRO = 1;

*/

-- Diferencia Julio ; 859336560



-- 1 ACTIVO : DEBITO SE SUMA  CREDITO SE RESTA
-- 2 PASIVO  SI ES CREDITO SUMA  DEBITO RESTA
-- 3 PARA PATRIMNIO CREDITO SUMA / DEBITO RESTA
-- 4.INGRESOS   CREDITO SUMA / DEBITORESTA
-- 5. GASTOS DEBITIO SUMA / CREDITO RESTA
-- 6.COSTOSDEBITO SUMA / CREDITO RESTA


-- Nivel 2

select * from hosvital.cuentas where empcod='03' and cntnvl = 2 order by cntcod;


select c.cntcod cuenta,c.cntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsant
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsant
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsant END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2) and  substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1)  and  substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=2 and substring(cc.cntcod,1,1) = substring(c.cntcod,1,1)
))   as saldo_Aterior ,
sum((select
  sum((r.rsaxdeb)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2) and  substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1)  and  substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=2 and substring(cc.cntcod,1,1) = substring(c.cntcod,1,1)
))   as Debitos ,
sum((select
  sum((r.rsaxcre)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2) and  substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1)  and  substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=2 and substring(cc.cntcod,1,1) = substring(c.cntcod,1,1)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsact
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsact
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsact END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2) and  substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1)  and  substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=2 and substring(cc.cntcod,1,1) = substring(c.cntcod,1,1)
))   as saldo_actual 

from hosvital.cuentas c 
where c.empcod='03' and c.cntvig=2019 and   substring(c.cntcod,1,1)>='0'   AND c.cntnvl=1
group by c.cntcod,c.cntdsc 
--order by  c.cntcod,c.cntdsc ;


union



-- Nivel 3
--select * from hosvital.cuentas where empcod='03' and cntnvl = 3 order by cntcod;


select c.cntcod cuenta,c.cntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsant
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsant
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsant END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and  substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2)  and  substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2)
))   as saldo_Aterior ,
sum((select
  sum((r.rsaxdeb)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and  substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2)  and  substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2)
))   as Debitos ,
sum((select
  sum((r.rsaxcre)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and  substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2)  and  substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsact
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsact
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsact END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and  substring(r.rsmctncon,1,2)= substring(cc.cntcod,1,2)  and  substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2)
))   as saldo_actual 

from hosvital.cuentas c 
where c.empcod='03' and c.cntvig=2019 and   substring(c.cntcod,1,2)>='00'   AND c.cntnvl=2
group by c.cntcod,c.cntdsc 
--order by  c.cntcod,c.cntdsc ;


union

-- Nivel 4
--select * from hosvital.cuentas where empcod='03' and cntnvl = 4 order by cntcod;

select c.cntcod cuenta,c.cntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsant
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsant
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsant END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and  substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4)  and  substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring(c.cntcod,1,4)
))   as saldo_Aterior ,
sum((select
  sum((r.rsaxdeb)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and  substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4)  and  substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring(c.cntcod,1,4)
))   as Debitos ,
sum((select
  sum((r.rsaxcre)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and  substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4)  and  substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring(c.cntcod,1,4)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsact
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsact
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsact END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and  substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4)  and  substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring(c.cntcod,1,4)
))   as saldo_actual 
from hosvital.cuentas c 
where c.empcod='03' and c.cntvig=2019 and   substring(c.cntcod,1,4)>='000'   AND c.cntnvl=3
group by c.cntcod,c.cntdsc 
--order by  c.cntcod,c.cntdsc ;
union
--Nivel 5

-- select * from hosvital.cuentas where empcod='03' and cntnvl = 4 order by cntcod;

select c.cntcod cuenta,c.cntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsant
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsant
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsant END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6)  and  substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6)
))   as saldo_Aterior ,
sum((select
  sum((r.rsaxdeb)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6)  and  substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6)
))   as Debitos ,
sum((select
  sum((r.rsaxcre)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6)  and  substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsact
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsact
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsact END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,6)= substring(cc.cntcod,1,6)  and  substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6)
))   as saldo_actual 
from hosvital.cuentas c 
where c.empcod='03' and c.cntvig=2019 and   substring(c.cntcod,1,6)>='000000'   AND c.cntnvl=4
group by c.cntcod,c.cntdsc 
--order by  c.cntcod,c.cntdsc ;

union

--Nivel 6

--select * from hosvital.cuentas where empcod='03' and cntnvl =5 order by cntcod;

select c.cntcod cuenta,c.cntdsc descripcion_cuenta,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsant
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsant
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsant
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsant
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsant END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8)  and  substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring(c.cntcod,1,8)
))   as saldo_Aterior ,
sum((select
  sum((r.rsaxdeb)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8)  and  substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring(c.cntcod,1,8)
))   as Debitos ,
sum((select
  sum((r.rsaxcre)) 
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8)  and  substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring(c.cntcod,1,8)
))   as Creditos ,
sum((select
   sum(case when   substring(cc.cntcod,1,1)='1' 	and   cc.cntnat='D' then  r.rsaxsact
                when substring(cc.cntcod,1,1)='1'	 and  cc.cntnat='C' then  -r.rsaxsact
   	 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='2' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='3' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='3' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='4' and  cc.cntnat='C' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='4' and  cc.cntnat='D' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='5' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='5' and  cc.cntnat='C' then  -r.rsaxsact
               when substring(cc.cntcod,1,1)='6' and  cc.cntnat='D' then  r.rsaxsact
                 when substring(cc.cntcod,1,1)='6' and  cc.cntnat='C' then  -r.rsaxsact END ) as saldo_actual
  from hosvital.cuentas cc
  inner join hosvital.rsmaux r on (r.rsmempcod=c.empcod  and r.rsmempcod=cc.empcod  and  r.rsmano=2019 and  r.rsmmes=7 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and  substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8)  and  substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)  ) 
   where cc.empcod=c.empcod and cc.cntvig=c.cntvig  AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring(c.cntcod,1,8)
))   as saldo_actual 
from hosvital.cuentas c 
where c.empcod='03' and c.cntvig=2019 and   substring(c.cntcod,1,8)>='000000'   AND c.cntnvl=5
group by c.cntcod,c.cntdsc 
order by 1;
 --order by  c.cntcod,c.cntdsc ;
