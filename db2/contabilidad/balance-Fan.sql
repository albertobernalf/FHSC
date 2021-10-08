select * from hosvital.cuentas where empcod='03' and cntvig=2019  and cntnvl =3;

select * from hosvital.rsmaux  where rsmempcod='03' and rsmano=2019 and rsmmes=9 order by rsmctncon ;
select * from hosvital.resmcue  where rsmempcod='03' and rsmano=2019 and rsmmes=9 order by rsmctncon ;

select * from hosvital.cuentas where empcod='03' and cntvig=2019  order by cntcod ;



select c.cntcod,c.cntdsc,r.rsaxsant, r.rsaxdeb,r.rsaxcre, r.rsaxsact
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmctncon= c.cntcod  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  
order by c.cntcod;

select * from hosvital.movcont2 where doccod='CEF' AND MVCNRO = 241;


/*
UPDATE hosvital.movcont2
SET CNTCOD='11200503'
where EMPCOD = '03' AND doccod='CEF' AND MVCNRO = 241 AND MVCCSC=1;
*/

select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb)  debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmempcod =   c.empcod and     substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  AND c.cntnvl=1 and substring(c.cntcod,1,1)>='0'
group  by  c.cntcod,c.cntdsc
union

select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb)  debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmempcod =   c.empcod and     substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  AND c.cntnvl=2 and substring(c.cntcod,1,2)>='00'
group  by  c.cntcod,c.cntdsc
union
select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb)  debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmempcod =   c.empcod and     substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  AND c.cntnvl=3 and substring(c.cntcod,1,4)>='000'
group  by  c.cntcod,c.cntdsc
union
select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb)  debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmempcod =   c.empcod and     substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  AND c.cntnvl=4 and substring(c.cntcod,1,6)>='000000'
group  by  c.cntcod,c.cntdsc
union
select c.cntcod cuenta ,c.cntdsc descripcion_cuenta,sum(r.rsaxsant)saldo_anterio, sum(r.rsaxdeb)  debitos,sum(r.rsaxcre) creditos, sum(r.rsaxsact) saldo_actual
 from hosvital.cuentas c
inner join hosvital.rsmaux r on (r.rsmempcod =   c.empcod and     substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)  )
where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9  AND c.cntnvl=5 and substring(c.cntcod,1,8)>='00000000'
group  by  c.cntcod,c.cntdsc
order by 1;

select * from hosvital.terceros;

/*Por tercero*/

select c.cntcod cuenta ,' ' ,c.cntdsc descripcion ,sum(r.rsmsalant) saldo_anterioR, sum(r.rsmdeb) debitos,sum(r.rsmcre) creditos, sum (r.rsmsalact) saldo_actual from hosvital.cuentas c inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9 AND c.cntnvl=1 and substring (c.cntcod,1,1)>='0' group by c.cntcod,c.cntdsc
union 
select c.cntcod cuenta ,' ' ,c.cntdsc descripcion_cuenta,sum(r.rsmsalant) saldo_anterioR, sum(r.rsmdeb) debitos,sum(r.rsmcre) creditos, sum (r.rsmsalact) saldo_actual from hosvital.cuentas c inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9 AND c.cntnvl=2 and substring(c.cntcod,1,2)>='00' group by c.cntcod,c.cntdsc
union
select c.cntcod cuenta ,' ' ,c.cntdsc descripcion_cuenta,sum(r.rsmsalant) saldo_anterioR, sum(r.rsmdeb) debitos,sum(r.rsmcre) creditos, sum (r.rsmsalact) saldo_actual from hosvital.cuentas c inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,4)= substring (c.cntcod,1,4)) where c.empcod='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9 AND c.cntnvl=3 and substring (c.cntcod,1,4)>='000' group by c.cntcod,c.cntdsc
union 
select c.cntcod cuenta ,' ' ,c.cntdsc descripcion_cuenta,sum(r.rsmsalant) saldo_anterioR, sum(r.rsmdeb) debitos,sum(r.rsmcre) creditos, sum (r.rsmsalact) saldo_actual from hosvital.cuentas c inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) where c.empcod='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9 AND c.cntnvl=4 and substring(c.cntcod,1,6)>='000000' group by c.cntcod,c.cntdsc
union
select c.cntcod cuenta ,ter.trccod ,ter.trcrazsoc as tercero,sum(r.rsmsalant) saldo_anterioR, sum(r.rsmdeb) debitos,sum(r.rsmcre) creditos, sum (r.rsmsalact) saldo_actual
 from hosvital.cuentas c inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and substring(r.rsmctncon,1,8)= substring (c.cntcod,1,8))
inner join hosvital.terceros ter on (ter.trccod=r.trccod)
 where c.empcod ='03' and c.cntvig=2019 and r.rsmano=2019 and r.rsmmes=9 AND c.cntnvl=5 and substring (c.cntcod,1,8)>='00000000' group by c.cntcod,ter.trccod,ter.trcrazsoc  order by 1,2;


/* fin por tercero  */


select * from hosvital.resmcue where  rsmano=2019 and rsmmes=9;