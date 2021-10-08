/*
Atentamente solicito de su valiosa colaboración con la generación de un reporte con los procedimientos existentes creados a tarifas propias
 y paquetes por cada entidad con valor parametrizado. 
*/

select ptcodi,maepro.prcodi,maepro.prnomb, h.trfcod,h.homprovlr
 from hosvital.portar1 p
inner join hosvital.maepro maepro on (maepro.prcodi=p.prcodi)
left join hosvital.homproc h on (h.trfcod=p.trfcod and h.homprocod = p.prcodi)
where p.ptcodi='173'
order by p.prcodi;

select * from hosvital.portar1 where ptcodi='173';
select  * from hosvital.homproc;

select * from hosvital.maepro where prNomb like ('%PAQUETE%');
SELECT * FROM HOSVITAL.PORTAR1;
SELECT * FROM HOSVITAL.PORTAR;


select p.ptcodi as cod_portafolio, p.ptest as activo, po1.PTReqAut as req_autorizacion,p.ptdesc as portafolio, po1.prcodi as cod_proced, hom.homprocod as cod_homologo, pro.prnomb as procedimiento,po1.trfcod as tarifa, PO1.PTPORC as porcentage,hom.HomProCnt cant_factor,po1.forliqcod as forma_liq,po1.ptcntuvr as cant_uvr, hom.homprovlr as homologado
from hosvital.portar p 
inner join hosvital.portar1 po1 on (po1.ptcodi=p.ptcodi) 
inner join hosvital.maepro pro on (pro.prcodi=po1.prcodi and pro.prnomb like ('%PAQUETE%')) 
left join hosvital.homproc hom on (hom.trfcod=po1.trfcod and hom.PRCODI=pro.prcodi)
where  p.ptest='S' 
order by p.ptcodi,po1.prcodi;

select * from hosvital.maeemp31;
select * from hosvital.maeemp;

select p.ptcodi as cod_portafolio, emp.menomb as contrato, p.ptest as activo, po1.PTReqAut as req_autorizacion,p.ptdesc as portafolio, po1.prcodi as cod_proced, hom.homprocod as cod_homologo, pro.prnomb as procedimiento,po1.trfcod as tarifa, PO1.PTPORC as porcentage,hom.HomProCnt cant_factor,po1.forliqcod as forma_liq,po1.ptcntuvr as cant_uvr, hom.homprovlr as homologado
from hosvital.portar p 
inner join hosvital.portar1 po1 on (po1.ptcodi=p.ptcodi) 
inner join hosvital.maepro pro on (pro.prcodi=po1.prcodi and pro.prnomb like ('%PAQUETE%')) 
left join hosvital.homproc hom on (hom.trfcod=po1.trfcod and hom.PRCODI=pro.prcodi)
inner join hosvital.maeemp31 m31 on (m31.ptcodi=p.ptcodi)
inner join hosvital.maeemp emp on (emp.mennit =m31.mennit)
where  p.ptest='S' 
GROUP BY  p.ptcodi , emp.menomb , p.ptest , po1.PTReqAut ,p.ptdesc, po1.prcodi , hom.homprocod , pro.prnomb ,po1.trfcod, PO1.PTPORC ,hom.HomProCnt,po1.forliqcod ,po1.ptcntuvr , hom.homprovlr 
order by p.ptcodi,po1.prcodi;

select * from hosvital.homproc where trfcod=44 and prcodi='FHSC02202'; -- C19

SELECT * FROM HOSVITAL.PORTAR1 WHERE PTCODI='C39' AND PRCODI='FHSC02202';

SELECT * FROM HOSVITAL.MAEEMP31 WHERE PTCODI='C39'; -- MTUCO1

