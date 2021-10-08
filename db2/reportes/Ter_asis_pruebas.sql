-- Tablas que intervienen en terceros asistenciales

select * from hosvital.porter;
select * from hosvital.porter1 order by prtercod, prcodi;
select * from hosvital.maemed1; --  MMTERAS='S' , mmporc = porcentage,, prtercod = codigio portafolio tercero ,, PorTerCoS= codigo portafolio sumninistro tercero

select * from hosvital.terasis;

select * from hosvital.terasis1 order by tercod;  --TerAgr = tercero es agrupador,, terest = estado del tercero asistencial
select * from hosvital.terasis2;
select * from hosvital.terasis3;




select * from hosvital.terasoc;
select * from hosvital.terasis4;
select * from hosvital.terasis5;


select * from hosvital.terdes;
select * from hosvital.terint;

select * from hosvital.tercencta;
select * from hosvital.TerCenCt1;

select * from hosvital.agrasis where agrascd= '1015400043';
select * from hosvital.agrasis1  order by agrascd,agrtercod; -- aqui estan los med agrupadores


-----------------------------------------------------
-- Hagamos un query por aparte que haga esto
-----------------------------------------------------
----------------------------------------------------
-----------------------------------------------------
----------------------------------------------------



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
where m1.mmteras='S' and c.citfec>='2017-01-20' and  c.citfec <= '2019-05-20'  -- and m1.mmcedm='72151516'   -- and m3.mpnfac = 576088 --and m1.mmcodm='MES27'
group by m3.prcodi,c.citcodmed ,m1.mmcedm ,m1.mmnomm ,esp.menome ,c1.citnum ,c1.citced ,cap.mpnomc ,emp.menomb ,c.citestp ,c1.citfac , c.citfec , 
c.citpro,mx.prnomb,m3.macanpr,m3.mavatp,m1.prtercod,por.prterdes  , por1.prterpor,m1.mmporc
order by m1.mmcedm,c1.citnum ;

--Este esta bueno para laspruebas pues tiene dos med
-- coloc en MED	859  el portafolio 205
select * from hosvital.porter1 where prtercod = '205'  and prcodi= '890335'  order by prtercod, prcodi;
select * from hosvital.porter1 where prtercod = '205' ;

select * from hosvital.porter1  order by prcodi;

select * from hosvital.porter1 where prtercod = '204' and prcodi = '867104'  order by prtercod, prcodi;
select * from hosvital.portar1 where ptcodi    = '135' and prcodi = '867104'  order by ptcodi, prcodi;

select * from hosvital.maemed1 where  mmcedm= '72151516';
select * from hosvital.porter1 where prcodi = '471110 ';  --en el204

867203   	
862001   	
862324   	
867203   	
862324   	
836001   	
862004   	

select mmporc from hosvital.maemed1;

update hosvital.porter1
set prtercnuvr=0
where prtercod='103' and prcodi = '471110';

select * from hosvital.forliq1 where forliqcod='102';


SELECT * FROM  HOSVITAL.PORTAR1 WHERE PTCODI='146' AND PRCODI ='512101';
