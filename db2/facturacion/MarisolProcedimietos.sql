select m2.macscp, m2.mmcodm,m1.mmnomm,m2.mafepr, m2.prcodi,maepro.prnomb,m.mpmeni,mae.menomb,cap.mptdoc,cap.mpcedu, cap.mpnomc ,m2.macanpr,m2.mavatp, m2.mpnfac 
from hosvital.maeate m
 inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.maesanup <>'N')
 inner join hosvital.maeemp mae on  (mae.mennit= m.mpmeni) 
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi) 
inner join hosvital.maemed1 m1 on (m1.mmcodm=m2.mmcodm ) 
where m2.mafepr BETWEEN '2021-05-01 00:00:00' AND '2021-05-31 23:59:59' and m2.mmcodm<>'' 
union 
select t1.tfcscp, t1.mmcom1,m1.mmnomm,t1.tffchp,t1.tfprc1,maepro.prnomb,t1.tfnitp,mae.menomb, cap.mptdoc,cap.mpcedu, cap.mpnomc ,t1.tfcanpr,t1.tfvatp,0 
from hosvital.tmpfac1 t1
 inner join hosvital.maeemp mae on (mae.mennit= t1.tfnitp) 
inner join hosvital.capbas cap on (cap.mptdoc=t1.tftdoc and cap.mpcedu=t1.tfcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=t1.tfprc1) 
inner join hosvital.maemed1 m1 on (m1.mmcodm=t1.mmcom1) 
where t1.tffchp between  '2021-05-01 00:00:00'  and '2021-05-31 23:59:59' and t1.mmcom1<>''
 order by 6,5;


select * from hosvital.tmpfac1 where tfcedu='19239141';
select * from hosvital.maeEsp where menome like ('%CIRU%');
select * from hosvital.maeEsp where mecode=42;

--

select m2.macscp,m2.mafepr, ESP.MENOME,m1.mmnomm,m2.prcodi,maepro.prnomb,m.mpmeni,mae.menomb,cap.mptdoc,cap.mpcedu, cap.mpnomc ,m2.macanpr,m2.mavatp, m2.mpnfac 
from hosvital.maeate m
 inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.maesanup <>'S')
 inner join hosvital.maeemp mae on  (mae.mennit= m.mpmeni) 
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi) 
inner join hosvital.maemed1 m1 on (m1.mmcodm=m2.mmcodm ) 
inner join hosvital.maeesp esp on (esp.mecode in (141,83,133,47) and esp.mecode= m2.mecomm)
where m2.mafepr BETWEEN '2020-12-01 00:00:00' AND '2021-05-31 23:59:59' and m2.mmcodm<>'' and  
       m2.maesanup<>'S' and m2.fcptpotrn='F'
union
select t1.tfcscp, t1.tffchp,ESP.MENOME, m1.mmnomm,t1.tfprc1,maepro.prnomb,t1.tfnitp,mae.menomb, cap.mptdoc,cap.mpcedu, cap.mpnomc ,t1.tfcanpr,t1.tfvatp,0 
from hosvital.tmpfac1 t1
 inner join hosvital.maeemp mae on (mae.mennit= t1.tfnitp) 
inner join hosvital.capbas cap on (cap.mptdoc=t1.tftdoc and cap.mpcedu=t1.tfcedu)
 inner join hosvital.maepro maepro on (maepro.prcodi=t1.tfprc1) 
inner join hosvital.maemed1 m1 on (m1.mmcodm=t1.mmcom1) 
inner join hosvital.maeesp esp on (esp.mecode in (141,83,133,47) and esp.mecode= t1.mecom1)
where t1.tffchp between  '2020-12-01 00:00:00'  and '2021-05-31 23:59:59' and t1.mmcom1<>'' and t1.tfptpotrn='F'  and t1.tfestaanu1<>'S'
order by 4,14;



