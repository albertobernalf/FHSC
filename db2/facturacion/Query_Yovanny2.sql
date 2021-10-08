select count(*) from hosvital.ingresos;  --  666602	
select min(ingfecadm) from hosvital.ingresos where ingfecadm not in ('0001-01-01 00:00:00.000000','0201-11-01 14:39:03.000000','0216-06-13 14:02:00.000000');

select year(ingfecadm), count(*)
 from  hosvital.ingresos 
where ingfecadm not in ('0001-01-01 00:00:00.000000','0201-11-01 14:39:03.000000','0216-06-13 14:02:00.000000')
group by year(ingfecadm)
order by year(ingfecadm);


select i.ingfac,cap.mptdoc as tipo_doc,cap.mpcedu as documento,cap.mpnomc as paciente ,i.ingcsc as ingreso,i.ingfecadm as fecha_ingreso,i.ingfecegr,i.inginslc as salida_clinica,
case when i.ingfecegr = '0001-01-01 00:00:00.000000' then 'Sin salida' else days(i.ingfecegr) - days(i.ingfecadm)  end as dias,
mae.menomb as contrato,
(
select m.faccodcam
from hosvital.maeate m
where m.mptdoc=i.mptdoc and m.mpcedu=i.mpcedu and m.mactving=i.ingcsc and m.mpnfac = (select min (m1.mpnfac) from hosvital.maeate m1 where m1.mptdoc=m.mptdoc and m1.mpcedu=m.mpcedu and m1.mactving=m.mactving)
) as cama_factura,
(
select m.mavals
from hosvital.maeate m
where m.mptdoc=i.mptdoc and m.mpcedu=i.mpcedu and m.mactving=i.ingcsc and m.mpnfac = (select min (m1.mpnfac) from hosvital.maeate m1 where m1.mptdoc=m.mptdoc and m1.mpcedu=m.mpcedu and m1.mactving=m.mactving)
) as total_factura,
(
(select sum(t.tfvatp) from hosvital.tmpfac1 t where t.tftdoc=i.mptdoc and t.tfcedu=i.mpcedu and t.tmctving=i.ingcsc) 
+
(select sum(t1.tfvats) from hosvital.tmpfac2 t1 where t1.tftdoc=i.mptdoc and t1.tfcedu=i.mpcedu and t1.tmctving=i.ingcsc)

) as total_cuenta_activa,
(select t.tfccodcam from hosvital.tmpfac t where t.tftdoc=i.mptdoc and t.tfcedu=i.mpcedu and t.tmctving=i.ingcsc
) as cama_paciente_activo
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
left join hosvital.maeemp mae on (mae.mennit=i.ingnit)
where i.ingfecadm>= '2017-01-01 00:00:00'  AND i.ingfac = 534373
order by  cap.mptdoc,cap.mpcedu;

select facfch,mactving  from hosvital.maeate where mpnfac = 534373;

select facfch,mactving  from hosvital.maeate  where mpcedu='1033748487';

select * from hosvital.ingresos where mpcedu='1033748487';
select * from hosvital.ingresos where ingfac = 534373;

-- 305351
select * from hosvital.tmpfac1 where tfcedu= '1000061748';
select * from hosvital.tmpfac2 where tfcedu= '1000061748';
select * from hosvital.ingresos where mpcedu= '1000061748';
select * from hosvital.maeemp;


select tfvats from hosvital.tmpfac2 where tfstpotrn='H' and tfcedu= '1000061748';
select * from hosvital.tmpfac where  tfcedu= '1000061748';


select  mptdoc,mpcedu,ingcsc , count(*) from hosvital.ingresos where ingfecadm>= '2019-01-01 00:00:00'  group by mptdoc,mpcedu,ingcsc  having count(*) >1 ;
select  mptdoc,mpcedu,mactving , count(*) from hosvital.maeate where facfch>=  '2019-01-01'  group by mptdoc,mpcedu,mactving  having count(*) >1 ;

select * from hosvital.maeate where mpcedu= '1010203773'; 	


