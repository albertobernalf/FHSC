select * from hosvital.movcxc where mccfch >='2019-08-01 00:00:00'and doccod not in ('FAR','FAD','RSD');
select facfch, maestf from hosvital.maeate where mpnfac = 575996         	
;

select m.mpnfac as factura,m.facfch as fecha,mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum(mov.mccvlr )
from hosvital.movcxc mov
where  mov.mccnumobl    =cast(m.mpnfac as varchar(6))  and  mov.doccod in ('DRC') and mov.mccnat='C'
) as Pagos_Aplicados,
(select sum(mov.mccvlr )
from hosvital.movcxc mov
where  mov.mccnumobl    =cast(m.mpnfac as varchar(6))  and  mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR') and mov.mccnat='C'
) as Notas_Credito,
( m.mavals -
(select ifnull(sum(mov.mccvlr ),0)
from hosvital.movcxc mov
where  mov.mccnumobl    = cast(m.mpnfac as varchar(6))  and  mov.doccod in ('DRC') and mov.mccnat='C'
) -
(select ifnull(sum(mov.mccvlr ),0)
from hosvital.movcxc mov
where  mov.mccnumobl    =cast(m.mpnfac as varchar(6))  and  mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR') and mov.mccnat='C'
)
) as Saldo
from hosvital.maeate m
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.facfch >= '2019-07-01' and m.maestf not in ('1','10') 
order by m.facfch;
-- and m.mpnfac = 575996;

select * from hosvital.movcxc where mccnumobl= '575996';
select * from hosvital.maeemp;

--Query Acotado



-- Consulta Nit


select m.mpnfac as factura,m.facfch as fecha,mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum (mov.mccvlr ) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C') as Pagos_Aplicados,
(select sum(mov.mccvlr) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC') and mov.mccnat='C') as Notas_Credito,
 (m.mavals-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C' )-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar (6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC') and mov.mccnat='C')) as Saldo 
from hosvital.maeate m 
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni and substring(mae.mecntr,1,9)='900156264') 
where m.facfch>='2006-01-01' and m.facfch<='2019-08-31' and m.maestf not in ('1','10') and  m.mpnfac =579965
order by m.facfch;


select  * from hosvital.movcxc where mccnumobl='579965';
select  * from hosvital.movcxc where mccnumobl='150398';

select  * from hosvital.HOJOBL where HOJNUMOBL='490296';


-- Con la Contabilidad


select h1.cntcod,m.mpnfac as factura,m.facfch as fecha,mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum (mov.mccvlr ) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C') as Pagos_Aplicados,
(select sum(mov.mccvlr) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and (mov.cntcod=h1.cntcod or mov.cntcod= and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC') and mov.mccnat='C') as Notas_Credito,
 (m.mavals-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C' )-(select ifnull(sum(case when mov.mccnat='C'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar (6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC')  and mov.cntcod=h1.cntcod and mov.mccnat='C')) as Saldo 
from hosvital.maeate m 
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni and substring(mae.mecntr,1,9)='900156264') 
inner join hosvital.hojobl h1 on (h1.hojnumobl =cast(m.mpnfac as varchar(6)))
where m.facfch>='2006-01-01' and m.facfch<='2019-08-31' and m.maestf not in ('1','10') and  m.mpnfac =579965 --  AND H1.CNTCOD='13020501'
order by m.facfch;


-- Con la Contabilidad sin Radicar


select h1.cntcod,m.mpnfac as factura,m.facfch as fecha,mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum(case when mov.mccnat='C'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.cntcod in ('13010501','13010601','13011001','13012001')) as Sin_Radicar,
(select sum (mov.mccvlr ) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C') as Pagos_Aplicados,
(select sum(case when mov.mccnat='C'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and (mov.cntcod=h1.cntcod or substring(mov.cntcod,1,4) = '1303') and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC') ) as Notas_Credito,
 (m.mavals-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C' )-(select ifnull(sum(case when mov.mccnat='C'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar (6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC')  and (mov.cntcod=h1.cntcod or substring(mov.cntcod,1,4) = '1303'))) as Saldo 
from hosvital.maeate m 
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni ) -- and substring(mae.mecntr,1,9)='900156264') 
inner join hosvital.hojobl h1 on (h1.hojnumobl =cast(m.mpnfac as varchar(6)))
where h1.empcod='01' and m.facfch>='2006-01-01' and m.facfch<='2019-08-31' and m.maestf not in ('1','10')    and  m.mpnfac = 454993  --  579965 --212553
    -- 579965         	 
 AND (H1.CNTCOD ='13020501' or H1.CNTCOD ='13999001' )  and H1.CNTVIG = (SELECT MAX(H2.CNTVIG) FROM HOSVITAL.HOJOBL H2 WHERE h2.empcod=h1.empcod and H2.HOJNUMOBL=H1.HOJNUMOBL)
order by m.facfch; 


select  * from hosvital.HOJOBL where HOJNUMOBL='454993';              -- 212553


-- Version Final


select distinct m.mpnfac as factura,m.facfch as fecha,mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end)   from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') ) as Pagos_Aplicados,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6))  and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR','CAC') ) as Notas_Credito,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1301') as Cuenta_1301,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1302') as Cuenta_1302,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1303') as Cuenta_1303,
(select sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1399') as Cuenta_1399,
(select ifnull(sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1301') +
(select ifnull(sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1302') +
(select ifnull(sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1303') +
(select ifnull(sum(case when mov.mccnat='D'  then  mov.mccvlr else -mov.mccvlr end),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and substring(mov.cntcod,1,4) = '1399') as saldo
from hosvital.maeate m 
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni  and substring(mae.mecntr,1,9)='900156264') 
inner join hosvital.hojobl h1 on (h1.hojnumobl =cast(m.mpnfac as varchar(6)))
where h1.empcod='01' and m.facfch>='2006-01-01' and m.facfch<='2019-08-31' and m.maestf not in ('1','10')   
and H1.CNTVIG = (SELECT MAX(H2.CNTVIG) FROM HOSVITAL.HOJOBL H2 WHERE h2.empcod=h1.empcod and H2.HOJNUMOBL=H1.HOJNUMOBL)
order by m.facfch; 

