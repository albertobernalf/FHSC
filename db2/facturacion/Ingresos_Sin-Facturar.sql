select i.mptdoc, i.mpcedu,c.mpnomc as paciente,case when i.clapro='2' then 'Urgencias' when i.clapro='5' then 'Hospitalizacion' end as servicio,     ingcsc as consecutivo,
    ingfecadm as ingreso ,   m.menomb as contrato,  ingfecegr  as egreso, case when m1.mpnfac is null  then 'No facturado' else 'Si facturado' end, m1.mpnfac,m1.matotf as total
from hosvital.ingresos i
left join hosvital.capbas c on (c.mptdoc=i.mptdoc and  c.mpcedu=i.mpcedu)
left join  hosvital.maeemp m on (m.mennit=i.ingnit)
left join hosvital.maeate m1 on (m1.mptdoc=i.mptdoc and  m1.mpcedu=i.mpcedu and m1.mactving=i.ingcsc)
where year(i.ingfecadm)='2019' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('2','5') 
order by i.ingfecadm;

select * from hosvital.maeemp;
select * from hosvital.ingresos;
select * from hosvital.maeate where mpcedu in ('17111400');

select * from hosvital.ingresos where mpcedu in ('6033909','1018483311');
select * from hosvital.datsoat where mpcedu in ('6033909','1018483311');
select * from hosvital.datsoat  where dafecacc >= '2019-06-30 00:00:00';

select i.mptdoc, i.mpcedu,c.mpnomc as paciente,case when i.clapro='2' then 'Urgencias' when i.clapro='5' then 'Hospitalizacion' end as servicio,     ingcsc as consecutivo,
    ingfecadm as ingreso ,   m.menomb as contrato,  ingfecegr  as egreso, case when m1.mpnfac is null  then 'No facturado' else 'Si facturado' end, m1.mpnfac,m1.matotf as total,
( select sum(x.tfvatp)
 from hosvital.tmpfac1 x
 where x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving=i.ingcsc and x.tfptpotrn ='F' and  tfestaanu1 <>'S'
) as procedimeintos,
( select sum(x.tfvats)
 from hosvital.tmpfac2 x
 where x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving=i.ingcsc and x.tfstpotrn ='F' and  tfestaanu2 <>'S'
) as suministros
from hosvital.ingresos i
left join hosvital.capbas c on (c.mptdoc=i.mptdoc and  c.mpcedu=i.mpcedu)
left join  hosvital.maeemp m on (m.mennit=i.ingnit)
left join hosvital.maeate m1 on (m1.mptdoc=i.mptdoc and  m1.mpcedu=i.mpcedu and m1.mactving=i.ingcsc)
where year(i.ingfecadm)='2019' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('2','5')  and i.IngFchAnu = '0001-01-01 00:00:00.000000'
order by i.ingfecadm;

select * from hosvital.tmpfac1 where tfcedu = '52521883';
select * from hosvital.tmpfac2 where tfcedu = '52521883';
