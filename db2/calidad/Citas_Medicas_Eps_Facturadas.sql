select * from hosvital.citmed where citfec >= '2019-01-01';

select  * from hosvinew.citmed where citnum in (550750,550751,550885);

select * from hosvital.citmed1;

select * from hosvital.maeemp where menomb like ('%NUEVA%EPS%');
select * from hosvital.maeemp where mennIt ='SS0101';

select year(c.citfec) ano, month(c.citfec) mes, menomb contrato,count(*) total
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum=c.citnum)
inner join hosvital.maeemp m on (m.mennit = c1.citnrocto)
where c.citfec >= '2019-01-01'  and c.citestp='F'  and menomb like ('%NUEVA%EPS%')
group by year(c.citfec), month(c.citfec),menomb
order by year(c.citfec), month(c.citfec),menomb;


select *
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum=c.citnum)
inner join hosvital.maeemp m on (m.mennit = c1.citnrocto)
where c.citfec >= '2019-01-01'  and c.citestp='F'  and menomb like ('%NUEVA%EPS%');

select * from hosvital.citmed1 where citnum in (521050,521578	,522306);	
select mpnfac, mpmeni, maestf, facfch from hosvital.maeate where mpnfac in (565572,566773	,569704);


select * from hosvital.maeate;



select year(c.citfec) ano, month(c.citfec) mes, menomb contrato,count(*) total
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum=c.citnum)
inner join hosvital.maeemp m on (m.mennit = c1.citnrocto)
where c.citfec >= '2019-01-01'  and c.citestp='F'  and m.menomb like ('%NUEVA%EPS%') and
--     (c1.citfac ) in (select mae.mpnfac from hosvital.maeate mae where mae.mpnfac = c1.citfac and mae.mpmeni = m.mennit and mae.maestf not in ('1','10'))
 (c1.citfac ) in (select mae.mpnfac from hosvital.maeate mae where mae.mpnfac = c1.citfac  and mae.maestf not in ('1','10') and mae.mpmeni  IN (SELECT mx.mennit from hosvital.maeemp mx where mx.menomb like ('%NUEVA%EPS%')))
group by year(c.citfec), month(c.citfec),menomb
order by year(c.citfec), month(c.citfec),menomb;


-- Query facturado

select year(c.citfec) ano, month(c.citfec) mes, menomb contrato,case when c.citestp='C' then 'Confirmado'  when c.citestp='A' then 'Atendido'  when c.citestp='F' then 'Facturado'   when c.citestp='R' then 'Confirmado'
  when c.citestp='N' then 'Cancelada'  end ,count(*) total
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum=c.citnum)
inner join hosvital.maeemp m on (m.mennit = c1.citnrocto)
where c.citfec >= '2018-01-01'  -- and c.citestp='F'  
and m.menomb like ('%NUEVA%EPS%') and
 (c1.citfac ) in (select mae.mpnfac from hosvital.maeate mae where mae.mpnfac = c1.citfac  and mae.maestf not in ('1','10') and mae.mpmeni  IN (SELECT mx.mennit from hosvital.maeemp mx where mx.menomb like ('%NUEVA%EPS%')))
group by year(c.citfec), month(c.citfec),menomb,c.citestp
order by year(c.citfec), month(c.citfec),menomb,c.citestp;

-- Query sin Filtro Facturado


select year(c.citfec) ano, month(c.citfec) mes, menomb contrato,case when c.citestp='C' then 'Confirmado'  when c.citestp='A' then 'Atendido'  when c.citestp='F' then 'Facturado'   when c.citestp='R' then 'Confirmado'
  when c.citestp='N' then 'Cancelada'  end ,count(*) total
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum=c.citnum)
inner join hosvital.maeemp m on (m.mennit = c1.citnrocto)
where c.citfec >= '2018-01-01'  -- and c.citestp='F'  
and m.menomb like ('%NUEVA%EPS%')
group by year(c.citfec), month(c.citfec),menomb,c.citestp
order by year(c.citfec), month(c.citfec),menomb,c.citestp;
