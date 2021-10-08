select * from hosvital.terasis1;
select * from hosvital.terasis2;
select * from hosvital.terasis3;
select * from hosvital.terasis4;
select * from hosvital.maemed1;
select * from hosvital.maemed2;
select * from hosvital.maeesp;

select * from hosvital.maemed4 where mmcodm = 'MES27';
SELECT * FROM HOSVITAL.MAEMED1 WHERE MMCODM ='MES27'; -- PRTERCOD
SELECT * from hosvital.teracteco;
select * from hosvital.porter;
select  * from hosvital.porter1 WHERE ; --43752	
select count(*) from hosvital.portar1; --834529	
select * from hosvital.porter;  -- PRTERCOD, PRTERDES
select * from hosvital.porter1 WHERE PRTERCOD='212' AND PRCODI = '890226' ; -- PRTERPOR
select * from hosvital.agrasis order by agrascd;
select * from hosvital.agrasis1 ; -- empcod, agrascd, agrtercod

select * from hosvital.citmed where citnum = 524525	;  --citpro



	
-- 1er query

select  m3.prcodi,c.citcodmed as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,esp.menome as especialidad,c1.citnum as No_cita,'0001-01-01 00:00:01',c1.citced as cedula_paciente,cap.mpnomc as nombre_paciente,
emp.menomb as contrato,case when c.citestp = 'F' then 'Facturada'  when c.citestp = 'A' then  'Atendida' when c.citestp = 'I' then 'Incumplida' when c.citestp = 'C' then 'Confirmada' when c.citestp = 'R' then 'Reservada' when c.citestp = 'N' then 'Cancelada' end as estado,c1.citfac as factura, c.citfec as fecha_realizacion, 
'CONSULTAS' as item,'1',c.citpro,mx.prnomb as nombre_procedimiento,m3.macanpr,m3.mavatp as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor as porcen_porter, m1.mmporc as porcen_med,
 round(m1.mmporc *m3.mavatp/100 ,0) as valor_liquidado
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c.citsed=c1.citsed and c.citemp=c1.citemp and c.citnum=c1.citnum)
inner join hosvital.maemed1 m1 on (m1.mmcodm = c.citcodmed)
inner join hosvital.maeesp esp on (esp.mecode = c.citespmed )
inner join hosvital.capbas cap on (cap.mptdoc = c1.cittipdoc and cap.mpcedu = c1.citced)
inner join hosvital.maeemp emp on (emp.mennit = c1.citnrocto)
left join hosvital.maeate2 m3 on  (m3.mpnfac = c1.citfac and m3.prcodi = c.citpro and m3.fcptpotrn='F' and m3.maesanup<>'S')
inner join hosvital.maepro mx on (mx.prcodi=m3.prcodi)
left join hosvital.porter por on (por.prtercod=m1.prtercod)
left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = c.citpro )
where m1.mmteras='S' and c.citfec>='2019-04-20' and  c.citfec <= '2019-05-20'   -- and m3.mpnfac = 576088 --and m1.mmcodm='MES27'
group by m3.prcodi,c.citcodmed ,m1.mmcedm ,m1.mmnomm ,esp.menome ,c1.citnum ,c1.citced ,cap.mpnomc ,emp.menomb ,c.citestp ,c1.citfac , c.citfec , 
c.citpro,mx.prnomb,m3.macanpr,m3.mavatp,m1.prtercod,por.prterdes  , por1.prterpor,m1.mmporc


UNION ALL


select  m3.prcodi, m1.mmcodm as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,esp.menome as especialidad,'0',
h.hiscfcon as fecha_solicitud, i.hisckey as cedula_paciente,cap.mpnomc as nombre_paciente,emp.menomb as contrato, case when i.intest='A' then 'Realizado' end as estado,m2.mpnfac,date(i.intfchrsl) as fecha_realizacion,
'Interconsulta' as item,i.hiscsec,esp.espcodpin as cod_procedimiento,mx.prnomb as nombre_procedimiento,m3.macanpr,m3.mavatp as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor as porcen_porter, m1.mmporc as porcen_med,
 round(m1.mmporc *m3.mavatp/100 ,0) as valor_liquidado
from hosvital.intercn i
inner join hosvital.hccom1 h on (h.histipdoc=i.histipdoc and h.hisckey = i.hisckey and h.hiscsec=i.hiscsec and h.hctvin1 = i.intctvin)
inner join hosvital.maemed1 m1 on (m1.mmusuario = i.intusrrsp)
inner join hosvital.maeesp esp on (esp.mecode = i.mecode )
inner join hosvital.capbas cap on (cap.mptdoc = h.histipdoc and cap.mpcedu =h.hisckey)
left join hosvital.maeate m2 on (m2.mptdoc=i.histipdoc and m2.mpcedu = i.hisckey  and m2.mactving = i.intctvin)
inner  join hosvital.maeate2 m3 on (m3.mpnfac = m2.mpnfac and  m3.prcodi = esp.espcodpin    and m3.fcptpotrn='F' and m3.maesanup<> 'S' and m3.msupro = m1.mmusuario and m3.mmcodm = m1.mmcodm and m3.mecomm = i.mecode and   m3.manumfol = i.hiscsec)
inner join hosvital.maepro mx on (mx.prcodi=m3.prcodi )
left join hosvital.maeemp emp on (emp.mennit = h.fhccodcto)
left join hosvital.porter por on (por.prtercod=m1.prtercod)
left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = esp.espcodpin )
where m1.mmteras='S' and i.intest='A'  and  i.intfchrsl>='2019-04-20 00:00:00' and i.intfchrsl <= '2019-05-20 23:59:59'    -- and m2.mpnfac = 576088  and i.intest='A' -- and m1.mmcodm='MES27' 
group by m3.prcodi,m1.mmcodm ,m1.mmcedm ,m1.mmnomm ,esp.menome ,h.hiscfcon , i.hisckey,cap.mpnomc ,emp.menomb ,i.intest,m2.mpnfac,date(i.intfchrsl) 
,i.hiscsec,esp.espcodpin, mx.prnomb,m3.macanpr, m3.mavatp, m1.prtercod,por.prterdes  , por1.prterpor,m1.mmporc


UNION ALL

select  m3.prcodi,m1.mmcodm as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,'','0',
h51.hcfchrord as fecha_orden, h51.hisckey as cedula_paciente,cap.mpnomc as nombre_paciente, '',
case when h51.hcprcest ='O' then 'Ordenado' when h51.hcprcest ='A' then 'Realizado' when h51.hcprcest ='N' then 'Cancelado'  when h51.hcprcest ='I' then 'Interpretado realizado' end as estado_proc, m2.mpnfac , date(h51.hcfchrap) as fecha_realizacion, 
t.tiprdes  as agrupador_proc_item,
h51.hiscsec as folio_sol, h51.hcprccod as cod_procedimiento, mae.prnomb as nombre_procedimiento,m3.macanpr,m3.mavatp as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor as porcen_porter, m1.mmporc as porcen_med,
 round(m1.mmporc *m3.mavatp/100 ,0) as valor_liquidado
from hosvital.hccom51 h51
inner join hosvital.hccom5 h5 on (h51.histipdoc=h5.histipdoc and h51.hisckey = h5.hisckey and h51.hiscsec=h5.hiscsec and h51.hctvin51 = h5.hctvin5 and h51.hcprccod=h5.hcprccod)
inner join hosvital.capbas cap on (cap.mptdoc = h51.histipdoc and cap.mpcedu =h51.hisckey)
inner join hosvital.maepro mae on (mae.prcodi = h51.hcprccod )
inner join hosvital.tipproc t on (t.tiprcod=mae.tpprcd )
inner join hosvital.maemed1 m1 on (m1.mmusuario = h51.rprusrrgs)
left  join hosvital.maeate m2 on (m2.mptdoc=h51.histipdoc and m2.mpcedu = h51.hisckey  and m2.mactving = h51.hctvin51)
inner join hosvital.maeate2 m3 on (m3.mpnfac = m2.mpnfac and m3.prcodi = h51.hcprccod and m3.fcptpotrn='F' and m3.maesanup<>'S')
left join hosvital.porter por on (por.prtercod=m1.prtercod)
left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = h51.hcprccod )
where m1.mmteras='S'  and h51.hcfchrap>='2019-04-20 0:00:00' and h51.hcfchrap <= '2019-05-20 23:59:59'  and t.tiprcod <>'5'   --and m2.mpnfac = 576088
group by m3.prcodi, m1.mmcodm ,m1.mmcedm ,m1.mmnomm ,'','0',h51.hcfchrord , h51.hisckey ,cap.mpnomc , '',h51.hcprcest , m2.mpnfac , date(h51.hcfchrap) ,t.tiprdes ,h51.hiscsec , h51.hcprccod , mae.prnomb ,m3.macanpr, m3.mavatp,m1.prtercod,por.prterdes  , por1.prterpor , m1.mmporc order by 1,6;

select * from hosvital.hccom51 where hisckey='17075389' and hctvin51 = 1 and hiscsec=2 and hcprccod='895100';
select * from hosvital.hccom5 where hisckey='17075389' and hctvin5 = 1 and hiscsec=2 and hcprccod='895100';

select * from hosvital.maeate2 where mpnfac =  573154  and prcodi = '890435';

select * from hosvital.intercn   where hisckey='2227770';;
select * from hosvital.intercn1 where hisckey='2227770' and hiscsec in (207,282);
select * from hosvital.intercn2 where hisckey='2227770' and hiscsec in (207,282);



select * from hosvital.maeate where mpnfac = 573154;

-------------------------------------------------------
-------------------------------------------------------
--Acotado


select  c.citcodmed as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,esp.menome as especialidad,c1.citnum as No_cita,'0001-01-01 00:00:01',c1.citced as cedula_paciente,cap.mpnomc as nombre_paciente,
emp.menomb as contrato,case when c.citestp = 'F' then 'Facturada'  when c.citestp = 'A' then  'Atendida' when c.citestp = 'I' then 'Incumplida' when c.citestp = 'C' then 'Confirmada' when c.citestp = 'R' then 'Reservada' when c.citestp = 'N' then 'Cancelada' end as estado,c1.citfac as factura, c.citfec as fecha_realizacion, 'CONSULTAS' as item,'1',c.citpro,mx.prnomb as nombre_procedimiento,sum(m3.macanpr),sum(m3.mavatp) as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor 
from hosvital.citmed c inner join hosvital.citmed1 c1 on (c.citsed=c1.citsed and c.citemp=c1.citemp and c.citnum=c1.citnum) inner join hosvital.maemed1 m1 on (m1.mmcodm = c.citcodmed)
inner join hosvital.maeesp esp on (esp.mecode = c.citespmed) inner join hosvital.capbas cap on (cap.mptdoc = c1.cittipdoc and cap.mpcedu = c1.citced) inner join hosvital.maeemp emp on (emp.mennit = c1.citnrocto)
left join hosvital.maeate2 m3 on  (m3.mpnfac = c1.citfac and m3.prcodi = c.citpro and m3.fcptpotrn='F' and m3.maesanup<>'S') inner join hosvital.maepro mx on (mx.prcodi=m3.prcodi)
left join hosvital.porter por on (por.prtercod=m1.prtercod) left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = c.citpro) where m1.mmteras='S' and c.citfec>='2019-03-20' and  c.citfec <= '2019-04-20'  group by c.citcodmed ,m1.mmcedm ,m1.mmnomm ,esp.menome ,c1.citnum ,c1.citced ,cap.mpnomc ,emp.menomb ,c.citestp ,c1.citfac , c.citfec , c.citpro,mx.prnomb,m1.prtercod,por.prterdes ,por1.prterpor UNION ALL select  m1.mmcodm as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,esp.menome as especialidad,'0', h.hiscfcon as fecha_solicitud, i.hisckey as cedula_paciente,cap.mpnomc as nombre_paciente,emp.menomb as contrato, case when i.intest='A' then 'Realizado' end as estado,m2.mpnfac,date(i.intfchrsl) as fecha_realizacion,'Interconsulta' as item,i.hiscsec,esp.espcodpin as cod_procedimiento,mx.prnomb as nombre_procedimiento,sum(m3.macanpr),sum(m3.mavatp) as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor from hosvital.intercn i inner join hosvital.hccom1 h on (h.histipdoc=i.histipdoc and h.hisckey = i.hisckey and h.hiscsec=i.hiscsec) inner join hosvital.maemed1 m1 on (m1.mmusuario = i.intusrrsp)
inner join hosvital.maeesp esp on (esp.mecode = i.mecode ) inner join hosvital.capbas cap on (cap.mptdoc = h.histipdoc and cap.mpcedu =h.hisckey) left join hosvital.maeate m2 on (m2.mptdoc=i.histipdoc and m2.mpcedu = i.hisckey  and m2.mactving = i.intctvin) inner join hosvital.maeate2 m3 on (m3.mpnfac = m2.mpnfac and m3.prcodi = esp.espcodpin and m3.fcptpotrn='F' and m3.maesanup<>'S') inner join hosvital.maepro mx on (mx.prcodi=m3.prcodi)
left join hosvital.maeemp emp on (emp.mennit = h.fhccodcto) left join hosvital.porter por on (por.prtercod=m1.prtercod) left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = esp.espcodpin )
where m1.mmteras='S' and i.intest='A' and  i.intfchrsl>='2019-03-20 00:00:00' and i.intfchrsl <= '2019-04-20 23:59:59' group by m1.mmcodm ,m1.mmcedm ,m1.mmnomm ,esp.menome ,h.hiscfcon , i.hisckey,cap.mpnomc ,emp.menomb ,i.intest,m2.mpnfac,date(i.intfchrsl) ,i.hiscsec,esp.espcodpin, mx.prnomb,m1.prtercod,por.prterdes  , por1.prterpor UNION ALL select  m1.mmcodm as cod_medico,m1.mmcedm as cedula_medico,m1.mmnomm as nombre_medico,'','0',
h51.hcfchrord as fecha_orden, h51.hisckey as cedula_paciente,cap.mpnomc as nombre_paciente, '',case when h51.hcprcest ='O' then 'Ordenado' when h51.hcprcest ='A' then 'Realizado' when h51.hcprcest ='N' then 'Cancelado'  when h51.hcprcest ='I' then 'Interpretado realizado' end as estado_proc, m2.mpnfac , date(h51.hcfchrap) as fecha_realizacion, t.tiprdes  as agrupador_proc_item,h51.hiscsec as folio_sol, h51.hcprccod as cod_procedimiento, mae.prnomb as  nombre_procedimiento,sum(m3.macanpr),sum(m3.mavatp) as valor_proc,m1.prtercod,por.prterdes  , por1.prterpor from hosvital.hccom51 h51 inner join hosvital.hccom5 h5 on (h51.histipdoc=h5.histipdoc and h51.hisckey = h5.hisckey and h51.hiscsec=h5.hiscsec and h51.hctvin51 = h5.hctvin5 and h51.hcprccod=h5.hcprccod) inner join hosvital.capbas cap on (cap.mptdoc = h51.histipdoc and cap.mpcedu =h51.hisckey) inner join hosvital.maepro mae on (mae.prcodi = h51.hcprccod) inner join hosvital.tipproc t on (t.tiprcod=mae.tpprcd ) inner join hosvital.maemed1 m1 on (m1.mmusuario = h51.rprusrrgs) left join hosvital.maeate m2 on (m2.mptdoc=h51.histipdoc and m2.mpcedu = h51.hisckey  and m2.mactving = h51.hctvin51) inner join hosvital.maeate2 m3 on (m3.mpnfac = m2.mpnfac and m3.prcodi = h51.hcprccod and m3.fcptpotrn='F' and m3.maesanup<>'S') left join hosvital.porter por on (por.prtercod=m1.prtercod) left  join hosvital.porter1 por1 on (por.prtercod=por1.prtercod and por1.prcodi = h51.hcprccod ) where m1.mmteras='S'  and h51.hcfchrap>='2019-03-20 0:00:00' and h51.hcfchrap<= '2019-04-20 23:59:59'  and t.tiprcod <>'5' group by m1.mmcodm ,m1.mmcedm ,m1.mmnomm ,'','0',h51.hcfchrord , h51.hisckey ,cap.mpnomc , '',h51.hcprcest , m2.mpnfac , date(h51.hcfchrap) ,t.tiprdes ,h51.hiscsec , h51.hcprccod , mae.prnomb ,m1.prtercod,por.prterdes, por1.prterpor order by 1,6;

