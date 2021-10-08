/*
Paciente
-EPS
-CUP
-Procedimiento
-Cantidad
-Valor
*/

select * from hosvital.maeate2;


select mae.mpnfac,c.mptdoc as tipo_doc,c.mpcedu as documento,c.mpnomc as paciente ,mae2.mafepr as fecha,mae2.prcodi as cups , maep.prnomb as procedimiento , mae2.macanpr as cantidad ,mae2.mavatp as valor
from hosvital.capbas c, hosvital.maeate mae,  hosvital.maeate2 mae2,hosvital.maepro maep
where mae2.mafepr >= '2019-06-01 00:00:00' and mae2.mafepr <= '2019-06-30 00:00:00'  and  mae2.mpnfac = mae.mpnfac and mae.mptdoc=c.mptdoc and mae.mpcedu =  c.mpcedu and mae.maestf not in ('1','10') and mae2.prcodi=maep.prcodi
order by mae2.mafepr,mae2.mpnfac;



select mae.mpnfac as factura,c.mptdoc as tipo_doc,c.mpcedu as documento,c.mpnomc as paciente , mae2.mafepr as fecha , mae2.FCPCodSCC as cod_centro ,cen.cncdsc as centro_costo,mae2.prcodi as cups ,
maep.prnomb as procedimiento,mae2.macanpr as cantidad ,mae2.mavatp as valor
from hosvital.capbas c
inner join hosvital.maeate mae on (mae.mptdoc=c.mptdoc and mae.mpcedu=c.mpcedu and mae.maestf not in ('1','10'))
inner join hosvital.maeate2 mae2 on (mae2.mpnfac=mae.mpnfac)
inner join hosvital.maepro maep on (maep.prcodi=mae2.prcodi)
left join hosvital.cencost cen on (cen.cnccod=mae2.FCPCodSCC )
where mae.facfch >= '2019-05-01' and mae.facfch  <= '2019-05-31' and mae.mpnfac = 576570 and mae.matipdoc='2' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'
order by mae2.mafepr,mae2.mpnfac;

-- 1.866.894,0

select * from hosvital.maeate2 where mpnfac = 576573;
select * from hosvital.maeate3 where mpnfac = 576570 AND MSRESO='0019MQ45';
select * from hosvital.maeate3 where mpnfac = 576570 ORDER BY MACANS;

select * from hosvital.maesum1 where msreso='0072A12A';

-- ULTIMA VERSION CON suministros

select mae.mpnfac as factura,c.mptdoc as tipo_doc,c.mpcedu as documento,c.mpnomc as paciente , mae2.mafepr as fecha , mae2.FCPCodSCC as cod_centro ,cen.cncdsc as centro_costo,mae2.prcodi as cups ,
maep.prnomb as procedimiento,mae2.macanpr as cantidad ,mae2.mavatp as valor 
from hosvital.capbas c
inner join hosvital.maeate mae on (mae.mptdoc=c.mptdoc and mae.mpcedu=c.mpcedu and mae.maestf not in ('1','10'))
inner join hosvital.maeate2 mae2 on (mae2.mpnfac=mae.mpnfac)
inner join hosvital.maepro maep on (maep.prcodi=mae2.prcodi)
left join hosvital.cencost cen on (cen.cnccod=mae2.FCPCodSCC )
where mae.facfch >= '2019-05-01' and mae.facfch  <= '2019-05-31' and mae.mpnfac = 576570 and mae.matipdoc='2' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'  
union
select  mae.mpnfac as factura,c.m19465673	750222ptdoc as tipo_doc,c.mpcedu as documento,c.mpnomc as paciente , mae3.mafcsu as fecha , mae3.macencos as cod_centro ,cen.cncdsc as centro_costo,maesum1.mscodcum as cups ,
maesum1.msnomg as procedimiento,mae3.macans as cantidad ,mae3.mavats as valor 
 -- sum(mae3.mavats) as valor
from hosvital.capbas c
inner join hosvital.maeate mae on (mae.mptdoc=c.mptdoc and mae.mpcedu=c.mpcedu and mae.maestf not in ('1','10'))
inner join hosvital.maeate3 mae3 on (mae3.mpnfac=mae.mpnfac)
LEFT join hosvital.maesum1 maesum1 on (maesum1.msreso=mae3.msreso)
left join hosvital.cencost cen on (cen.cnccod=mae3.macencos )
where mae.facfch >= '2019-05-01' and mae.facfch  <= '2019-05-31' and mae.mpnfac = 576570 and mae.matipdoc='2' and mae3.fcstpotrn='F' and mae3.maesanus <> 'S'
order by 1,11;


-- nop
--

select  mae.mpnfac as factura,c.mptdoc as tipo_doc,c.mpcedu as documento,c.mpnomc as paciente , mae3.mafcsu as fecha , mae3.macencos as cod_centro ,cen.cncdsc as centro_costo,maesum1.mscodcum as cups ,
maesum1.msnomg as procedimiento,mae3.macans as cantidad ,mae3.mavats as valor
from hosvital.capbas c
inner join hosvital.maeate mae on (mae.mptdoc=c.mptdoc and mae.mpcedu=c.mpcedu and mae.maestf not in ('1','10'))
inner join hosvital.maeate3 mae3 on (mae3.mpnfac=mae.mpnfac)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=mae3.msreso)
left join hosvital.cencost cen on (cen.cnccod=mae3.macencos )
where mae.facfch >= '2019-05-01' and mae.facfch  <= '2019-05-31' and mae.mpnfac = 576570 and mae.matipdoc='2' and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and  MAE3.MSRESO='0019MQ45'; 
-- 5406831.00	
--40376500.00	


select sum(mae2.mavatp) as valor
from hosvital.capbas c
inner join hosvital.maeate mae on (mae.mptdoc=c.mptdoc and mae.mpcedu=c.mpcedu and mae.maestf not in ('1','10'))
inner join hosvital.maeate2 mae2 on (mae2.mpnfac=mae.mpnfac)
inner join hosvital.maepro maep on (maep.prcodi=mae2.prcodi)
left join hosvital.cencost cen on (cen.cnccod=mae2.FCPCodSCC )
where mae.facfch >= '2019-05-01' and mae.facfch  <= '2019-05-31' and mae.mpnfac = 576570 and mae.matipdoc='2' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S';
