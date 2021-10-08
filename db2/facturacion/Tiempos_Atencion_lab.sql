select c.mptdoc as tipo_doc,c.mpcedu as doc, c.mpnomc as nombre ,m1.menomb as empresa,i.ingfecadm as ingreso,m.mpnfac as factura,m.facfch as fecha_factura,m.facfchhor as hora_factura, 
case when m.mpclpr='1' then 'Ambulatorio'  when  m.mpclpr='2' then 'Urgencias'  when m.mpclpr='3' then 'Consulta Externa' end,
concat(concat(concat(concat(concat(concat(year(m.facfch),'-'),lpad(month(m.facfch),'2','0')),'-'),lpad(day(m.facfch),'2','0')),' '),m.facfchhor),

(concat(concat(concat(concat(concat(concat(year(m.facfch),'-'),lpad(month(m.facfch),'2','0')),'-'),lpad(day(m.facfch),'2','0')),' '),m.facfchhor) - i.ingfecadm)/100


from hosvital.capbas c 
inner join hosvital.ingresos i on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) 
inner join hosvital.maeate m on (m.matipdoc='2' and m.mptdoc = i.mptdoc and m.mpcedu = i.mpcedu and m.mactving = i.ingcsc) 
inner join hosvital.maeemp m1 on (m1.mennit=m.mpmeni) 
where i.ingfecadm>='2019-08-05 00:00:00' and i.ingfecadm<='2019-08-31 23:59:59' and  m.mpclpr in ('1','6') and
  (m.mptdoc,m.mpcedu,m.mactving) in (select h.histipdoc, h.hisckey, h.hctvin51 from hosvital.hccom51 h where  hcprctpop='2')
order by i.ingfecadm;


select mpnfac,  facfch,mafche,mahore,facfchhor  from hosvital.maeate where mpnfac = 593991;
select * from hosvital.hccom51;


	
