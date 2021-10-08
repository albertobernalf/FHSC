-- codigo portafolio,codigo proced, descrip proced,porcentage,forma de liquidacion, cantidad de uvr,latarifade la homioolog}acion
-- los procedi activos
-- de losportafolios y los procedimientosactivos
--------------------------------------------------------------------------

--suministro

--codigo cum, la descripcuion, si es pos o no pos y el valor
----------------------------------------
select * from hosvital.portar;
select * from hosvital.portar1;
select * from hosvital.portar11;
select * from hosvital.portar2;
select * from hosvital.homproc;
select * from hosvital.maepro;

select * from hosvital.maeemp31;


--Consulta de procedimientos

select p.ptcodi, p.ptdesc, po1.prcodi,pro.prnomb,po1.trfcod, PO1.PTPORC,po1.forliqcod,po1.ptcntuvr, hom.homprovlr
from hosvital.portar p 
inner join hosvital.portar1 po1 on (po1.ptcodi=p.ptcodi)
inner join hosvital.maepro pro on (pro.prcodi=po1.prcodi)
left join hosvital.homproc hom on (hom.trfcod=po1.trfcod and hom.homprocod=pro.prcodi)
where p.ptcodi='C04' and p.ptest='S'
order by p.ptcodi,po1.prcodi;

--Consulta de Suministros

select * from hosvital.portarsu;
select * from hosvital.portars1;
select * from hosvital.portars2 order by msreso,pscodi;
select * from hosvital.maesum1;
select * from hosvital.maesumn;


--codigo cum, la descripcion, si es pos o no pos y el valor
-- 9 =no aplica

select su.pscodi as cod_portafolio , su.psdesc as portafolio,m1.msreso as cod_med ,m1.msnomg as medicamento, p1.pstari as tipo, p1.psporc as porcentage,  p2.psvalu1 as valor ,case when  mn.msposx='0' then 'POS'  when  mn.msposx='1' then 'NO POS'  when  mn.msposx='9' then 'NO APLICA' end as estado
from  hosvital.portarsu su
inner join hosvital.portars1 p1 on (p1.pscodi=su.pscodi)
inner join hosvital.portars2 p2 on (p2.pscodi=p1.pscodi and  p2.msreso=p1.msreso)
inner join  hosvital.maesum1 m1 on (m1.msreso = p1.msreso)
inner join hosvital.maesumn mn on (mn.mscodi=m1.mscodi and mn.msprac=m1.msprac and mn.cnccd = m1.cnccd and mn.msform = m1.msform)
where  su.psest ='S'  and p2.msreso ='S55208'
order by su.pscodi, m1.msreso ;


select p.ptcodi as cod_portafolio, p.ptdesc as portafolio, po1.prcodi as cod_proced,pro.prnomb as procedimiento,po1.trfcod as tarifa, PO1.PTPORC as porcentage,po1.forliqcod as forma_liq,po1.ptcntuvr as cant_uvr, hom.homprovlr as homologado from hosvital.portar p inner join hosvital.portar1 po1 on (po1.ptcodi=p.ptcodi) inner join hosvital.maepro pro on (pro.prcodi=po1.prcodi) left join hosvital.homproc hom on (hom.trfcod=po1.trfcod and hom.homprocod=pro.prcodi) where p.ptest='S' order by p.ptcodi,po1.prcodi;

select * from hosvital.portars2 where pscodi='18' and msreso ='S55208';


-- Portafolios de suministros con vigencias

select su.pscodi as cod_portafolio , su.psdesc as portafolio,m1.msreso as cod_med ,m1.msnomg as medicamento, p1.pstari as tipo, p1.psporc as porcentage,  p2.psvalu1 as valor ,case when  mn.msposx='0' then 'POS'  when  mn.msposx='1' then 'NO POS'  when  mn.msposx='9' then 'NO APLICA' end as estado
from  hosvital.portarsu su
inner join hosvital.portars1 p1 on (p1.pscodi=su.pscodi)
inner join hosvital.portars2 p2 on (p2.pscodi=p1.pscodi and  p2.msreso=p1.msreso)
inner join  hosvital.maesum1 m1 on (m1.msreso = p1.msreso)
inner join hosvital.maesumn mn on (mn.mscodi=m1.mscodi and mn.msprac=m1.msprac and mn.cnccd = m1.cnccd and mn.msform = m1.msform)
where  su.psest ='S'  and p2.msreso ='S55208'  and p2.psvigin = (select max(p3.psvigin) from hosvital.portars2 p3 where p3.pscodi= p2.pscodi and p3.msreso=p2.msreso)
order by su.pscodi, m1.msreso ;



select su.pscodi as cod_portafolio,su.psdesc as portafolio,m1.msreso as cod_med ,m1.msnomg as medicamento, p1.pstari as tipo, p1.psporc as porcentage,p2.psvalu1 as valor,case when mn.msposx='0' then 'POS' when mn.msposx='1' then 'NO POS' when mn.msposx='9' then 'NO APLICA' end as estado from hosvital.portarsu su inner join hosvital.portars1 p1 on (p1.pscodi=su.pscodi) inner join hosvital.portars2 p2 on (p2.pscodi=p1.pscodi and  p2.msreso=p1.msreso) inner join  hosvital.maesum1 m1 on (m1.msreso = p1.msreso) inner join hosvital.maesumn mn on (mn.mscodi=m1.mscodi and mn.msprac=m1.msprac and mn.cnccd=m1.cnccd and mn.msform = m1.msform) where SU.PSCODI=? AND su.psest ='S' order by su.pscodi,m1.msreso
;

-- Portafolio de procedimientos con vigencias

select * from hosvital.maeemp31 order by ptcodi,mennit;

select * from hosvital.maeemp32;

select p.ptcodi, p.ptdesc, po1.prcodi,pro.prnomb,po1.trfcod, PO1.PTPORC,po1.forliqcod,po1.ptcntuvr, hom.homprovlr
from hosvital.portar p 
inner join hosvital.portar1 po1 on (po1.ptcodi=p.ptcodi)
inner join hosvital.maepro pro on (pro.prcodi=po1.prcodi)
inner join hosvital.maeemp31 mae on (pro.prcodi=po1.prcodi)
left join hosvital.homproc hom on (hom.trfcod=po1.trfcod and hom.homprocod=pro.prcodi)
where p.ptcodi='C04' and p.ptest='S'
order by p.ptcodi,po1.prcodi;