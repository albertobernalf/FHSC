select c.mptdoc,c.mpcedu,c.mpnomc,i.ingfecadm, i.ingfecegr, m3.menomb, m2.mpnfac,m2.prcodi,m2.mavatp
from hosvital.capbas c
inner join hosvital.ingresos i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu)
inner join hosvital.maeate m1 on (m1.mptdoc=i.mptdoc and m1.mpcedu=c.mpcedu and m1.mactving=i.ingcsc and m1.maestf not in ('1','10'))
inner join hosvital.maeate2 m2 on (m2.mpnfac = m1.mpnfac)
inner join hosvital.maeemp m3 on (m3.mennit = m1.mpmeni)
where i.ingfecadm >= '2019-01-01 00:00:00' and i.ingfecadm <= '2019-07-31 23:59:59' and m2.prcodi ='890602' and m2.fcptpotrn='F' and m2.maesanup <>'S'
order by i.ingfecadm;

select * from hosvital.maeate;
select * from hosvital.maeate2;