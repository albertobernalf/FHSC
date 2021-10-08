/*

FACTURA
NIT ENTIDAD
NOMBRE ENTIDAD 
DOCUMENTO USUARIO
NOMBRE USUARIO
CODIGO SERVICIO
NOMBRE DE SERVICIO FACTURADO
CANTIDAD
VALOR UNITARIO DEL SERVICIO
VALOR TOTAL DEL SERVICIO

*/
select * from hosvital.maeemp;
select * from hosvital.maeate2;
select * from hosvital.maeate;

select m.mpnfac as factura,maeemp.mecntr as nit_entidad, maeemp.menomb as nombre_entidad,m.mptdoc as tipo_doc,m.mpcedu as documento,c.mpnomc as paciente,m2.macscp as consecutivo,m2.prcodi as codigo_servicio,mae.prnomb as nombre_servicio,m2.macanpr as cantidad,m2.mpinte as valor_unitario,m2.mavatp as valor_total
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac= m.mpnfac and m2.FCPTPOTRN ='F' AND m2.maesanup<>'S')
inner join hosvital.maepro mae on (mae.prcodi= m2.prcodi)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.capbas c on (c.mptdoc=m.mptdoc and c.mpcedu=m.mpcedu)
where m.matipdoc='2' and m.facfch >= '2020-01-01'
order by 1;

select * from hosvital.maeate3;


select m.mpnfac as factura,maeemp.mecntr as nit_entidad, maeemp.menomb as nombre_entidad,m.mptdoc as tipo_doc,m.mpcedu as documento,c.mpnomc as paciente,m2.macscp as consecutivo,m2.prcodi as codigo_servicio,mae.prnomb as nombre_servicio,m2.macanpr as cantidad,m2.mpinte as valor_unitario,m2.mavatp as valor_total
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac= m.mpnfac and m2.matipdoc =m.matipdoc  and m2.FCPTPOTRN ='F' AND m2.maesanup<>'S')
inner join hosvital.maepro mae on (mae.prcodi= m2.prcodi)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.capbas c on (c.mptdoc=m.mptdoc and c.mpcedu=m.mpcedu)
where m.matipdoc='2' and m.maestf not in ('1','10') and  m.facfch >= '2020-02-29' and m.facfch <= '2020-02-29'
union
select m.mpnfac as factura,maeemp.mecntr as nit_entidad, maeemp.menomb as nombre_entidad,m.mptdoc as tipo_doc,m.mpcedu as documento,c.mpnomc as paciente,m3.macscs as consecutivo,m3.msreso as codigo_servicio,mae.msnomg as nombre_servicio,m3.macans as cantidad ,m3.mavalu as valor_unitario,m3.mavats as valor_total
from hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac= m.mpnfac and  m3.matipdoc=m.matipdoc and m3.FCSTPOTRN ='F' AND m3.maesanus<>'S')
inner join hosvital.maesum1 mae on (mae.msreso= m3.msreso)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni)
inner join hosvital.capbas c on (c.mptdoc=m.mptdoc and c.mpcedu=m.mpcedu)
where m.matipdoc='2' and m.maestf not in ('1','10') and  m.facfch >= '2020-02-29' and m.facfch <= '2020-02-29'
order by 1;