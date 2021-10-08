select * from hosvital.maeemp;
select * from hosvital.ingresos;
select * from hosvital.maeate;
select * from hosvital.admglo11 where mpnfac = 574362	 ;
select * from hosvital.admglo01 where aglremnr = 22743;
select * from hosvital.admglo01;

select i.ingfac,c.mptdoc as tipo_doc,  c.mpcedu as doc, c.mpnomc as nombre ,m1.menomb as empresa,i.ingfecadm as ingreso,i.ingfecegr as egreso ,
        days(i.ingfecegr) -   days(i.ingfecadm )  as dias_estancia,
	m.mpnfac as factura,m.facfch as fecha_factura,
	days(m.facfch) - days(i.ingfecegr) as dias_hasta_factura,


           m.matotf as total_factura, a1.aglradfc as fecha_rad,
	days(a1.aglradfc)   - days(m.facfch) as dias_radicacion
from hosvital.capbas c, hosvital.ingresos i, hosvital.maeate m, hosvital.admglo11 a, hosvital.maeemp m1, hosvital.admglo01 a1
where i.ingfecegr >= '2019-04-01 00:00:00' and i.ingfecegr <= '2019-04-30 23:59:59'  and
          c.mptdoc = i.mptdoc and c.mpcedu = i.mpcedu and
          i.mptdoc = m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving and m.mpmeni = m1.mennit and
          m.mpnfac = a.mpnfac and a.aglremnr = a1.aglremnr;




select c.mptdoc as tipo_doc,  c.mpcedu as doc, c.mpnomc as nombre ,m1.menomb as empresa,i.ingfecadm as ingreso,i.ingfecegr as egreso ,
        days(i.ingfecegr) -   days(i.ingfecadm )  as dias_estancia,
	m.mpnfac as factura,m.facfch as fecha_factura,
	days(m.facfch) - days(i.ingfecegr) as dias_hasta_factura,
	 m.matotf as total_factura, a1.aglremfc as fecha_remision,
	  case when a1.aglremfc ='0001-01-01' then 'No radicado'
	 when a1.aglremfc ='1753-01-01' then   'No radicado'
	else cast((days(a1.aglremfc)   - days(m.facfch)) as varchar(20)) end
	 as dias_remision,
	a1.aglradfc as fecha_radicacion,
  	case when a1.aglradfc ='0001-01-01' then 'No radicado'
	 when a1.aglradfc ='1753-01-01' then   'No radicado'
	else cast((days(a1.aglradfc)   - days(a1.aglremfc)) as varchar(20)) end
	 as dias_radicacion
from hosvital.capbas c
inner join hosvital.ingresos i on (c.mptdoc = i.mptdoc and c.mpcedu = i.mpcedu)
inner join hosvital.maeate m on (m.mptdoc = i.mptdoc and m.mpcedu = i.mpcedu and m.mactving = i.ingcsc  )
inner join hosvital.maeemp m1 on (m1.mennit = m.mpmeni )
left join hosvital.admglo11 a on (a.mpnfac = m.mpnfac and a.aglfacdev<> 'S' )
inner join hosvital.admglo01 a1 on (a1.aglremnr = a.aglremnr)
where i.ingfecegr >= '2019-03-01 00:00:00' and i.ingfecegr <= '2019-04-30 23:59:59'  ;



select mpnfac,facfch,matotf from hosvital.maeate where mpnfac = 572663		;
select * from hosvital.admglo11 where mpnfac = 572663		;
select * from hosvital.admglo01 where aglremnr = 22712;
select * from hosvital.ingresos where mpcedu = '41373792' and ingfac =      572663	;

-- Acotado

select c.mptdoc as tipo_doc,  c.mpcedu as doc, c.mpnomc as nombre ,m1.menomb as empresa,i.ingfecadm as ingreso,i.ingfecegr as egreso ,days(i.ingfecegr)-days(i.ingfecadm ) as dias_estancia, m.mpnfac as factura,m.facfch as fecha_factura,  days(m.facfch)-days(i.ingfecegr) as dias_hasta_factura, m.matotf as total_factura, a1.aglremfc as fecha_remision, case when a1.aglremfc ='0001-01-01' then 'No radicado' when a1.aglremfc ='1753-01-01' then   'No radicado' else cast((days(a1.aglremfc) - days(m.facfch)) as varchar(20)) end as dias_remision,a1.aglradfc as fecha_radicacion,case when a1.aglradfc ='0001-01-01' then 'No radicado' when a1.aglradfc ='1753-01-01' then   'No radicado' else cast((days(a1.aglradfc) - days(a1.aglremfc)) as  varchar(20)) end as dias_radicacion from hosvital.capbas c inner join hosvital.ingresos i on (c.mptdoc = i.mptdoc and c.mpcedu = i.mpcedu) inner join hosvital.maeate m on (m.mptdoc = i.mptdoc and m.mpcedu = i.mpcedu and m.mactving = i.ingcsc) inner join hosvital.maeemp m1 on (m1.mennit=m.mpmeni) left join hosvital.admglo11 a on (a.mpnfac = m.mpnfac) inner join hosvital.admglo01 a1 on (a1.aglremnr = a.aglremnr) where i.ingfecegr>=? and i.ingfecegr<=? ;