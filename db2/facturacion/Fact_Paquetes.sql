SELECT * FROM HOSVITAL.MAEPRO WHERE PRCODI='378301';
select * from hosvital.tipproc;
select * from hosvital.maeemp;
select * from hosvital.maeate2 where mpnfac = 618031 and prcodi='378301';
select * from hosvital.maeate2 where mpnfac = 618031	
 and fcptpotrn='H' ;
select * from hosvital.maeate3 where mpnfac = 618031	
 and fcstpotrn='H' ; ;
select * from hosvital.honrios;


select m.mpnfac factura,m2.macscp consecutivo,cap.mptdoc tipo_doc,cap.mpcedu identificacion,m2.prcodi codigo, maepro.prnomb descripcion,t.tiprdes agrupador, h.hnrdsc honorario,m2.macanpr cantidad,m2.mpinte unitario,m2.mavatp total,mae.menomb asegurador , year(m2.mafepr) ano, month(m2.mafepr) mes, case when m2.fcptpotrn='F' then 'facturado'  when m2.fcptpotrn='H' then 'Hoja de Gasto'  END ESTADO
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac = m.mpnfac  and m2.maesanup<>'S' and ((m2.prcodi='378301' and  m2.fcptpotrn='F')  or m2.fcptpotrn='H' ))
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
inner join hosvital.tipproc t on (t.tiprcod= maepro.tpprcd)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
left join hosvital.honrios h on (h.hnrcod=m2.mahoncod)
where  m.facfch>= '2020-01-01' and m.facfch <= '2021-12-31' and m.maestf not in ('1','10') and m2.mpnfac in (select m22.mpnfac from hosvital.maeate2 m22 where m22.mpnfac=m2.mpnfac and m22.prcodi='378301' and m22.maesanup<>'S')
union
select m.mpnfac factura,m3.macscs consecutivo,cap.mptdoc tipo_doc,cap.mpcedu identificacion,m3.msreso codigo, maesum1.msnomg descripcion,'Medicamento-Suministro', ' ' honorario,m3.macans cantidad,m3.mavalu unitario,m3.mavats total,mae.menomb asegurador , year(m3.mafcsu) ano, month(m3.mafcsu) mes, case when m3.fcstpotrn='F' then 'facturado'  when m3.fcstpotrn='H' then 'Hoja de Gasto'  END ESTADO
from hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac = m.mpnfac  and m3.maesanus<>'S')
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where  m.facfch>= '2020-01-01' and m.facfch <= '2021-12-31'  and m.maestf not in ('1','10') and m3.mpnfac in (select m22.mpnfac from hosvital.maeate2 m22 where m22.mpnfac=m3.mpnfac and m22.prcodi='378301' and m22.maesanup<>'S')
order by 1;