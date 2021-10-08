select i.mptdoc, i.mpcedu,c.mpnomc as paciente,case   when i.clapro='1' then 'Ambulatorio' when i.clapro='2' then 'Urgencias' when i.clapro='3' then 'Hospitalizacion' end as servicio,     ingcsc as consecutivo,
    ingfecadm as ingreso ,   m.menomb as contrato,  ingfecegr  as egreso, case when m1.mpnfac is null  then 'No facturado' else 'Si facturado' end, m1.mpnfac,
case when m1.mpnfac is not null and m1.maestf='1' or m1.mpnfac is not null and m1.maestf='10' then 'Anulada'   when m1.mpnfac is null then ' '  else 'No Anulada'   end estado_factura,m1.matotf as total,
( select sum(x.tfvatp)
 from hosvital.tmpfac1 x
 where x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving=i.ingcsc and x.tfptpotrn ='F' and  tfestaanu1 <>'S'
) as procedimeintos,
( select sum(x.tfvats)
 from hosvital.tmpfac2 x
 where x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving=i.ingcsc and x.tfstpotrn ='F' and  tfestaanu2 <>'S'
) as suministros,
( select  x.tfccodcam
 from hosvital.tmpfac x
  where x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving=i.ingcsc 

) as cama_paciente_activo,
year(i.ingfecadm), month(i.ingfecadm)
from hosvital.ingresos i
left join hosvital.capbas c on (c.mptdoc=i.mptdoc and  c.mpcedu=i.mpcedu)
left join  hosvital.maeemp m on (m.mennit=i.ingnit)
left join hosvital.maeate m1 on (m1.mptdoc=i.mptdoc and  m1.mpcedu=i.mpcedu and m1.mactving=i.ingcsc)
where year(i.ingfecadm)>='2008' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')  and i.IngFchAnu = '0001-01-01 00:00:00.000000' order by i.ingfecadm;


select * from hosvital.ingresos where mpcedu='19482721' and ingcsc=3;
select * from hosvital.maeate where mpnfac =563885;   --debe ser ingreso nro 3	$157810.00	
select * from hosvital.tmpfac where tfcedu= '79250385'; -- 508-S	
select * from hosvital.ingresos  where mpcedu= '79250385';
select * from hosvital.tmpfac2;


select distinct year(t.tffces),
(select sum(x.tfvatp)
 from hosvital.tmpfac1 x
 where    x.tfptpotrn ='F' and  tfestaanu1 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving,year(t.tffces))  in      (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm)
		     					      from hosvital.ingresos i	
							where  i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('2','5')  and i.IngFchAnu = '0001-01-01 00:00:00.000000') ),
( select sum(x.tfvats)
 from hosvital.tmpfac2 x
 where  year(t.tffces) = year(x.tffcsu) and x.tfstpotrn ='F' and  tfestaanu2 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving)  in      (select  i.mptdoc, i.mpcedu, i.ingcsc
		     					      from hosvital.ingresos i	
							where  i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('2','5')  and i.IngFchAnu = '0001-01-01 00:00:00.000000')
)
from hosvital.tmpfac t
where year(t.tffces)>= 2001
group by year(t.tffces);


select * from hosvital.tmpfac2;
select * from hosvital.tmpfac1;

select year(x.tffchp), 'Procedimientos', sum(x.tfvatp)
 from hosvital.tmpfac1 x
 where    x.tfptpotrn ='F' and  tfestaanu1 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving, year(x.tffchp))  in      (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm)
		     					      from hosvital.ingresos i	
							where   i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')   and i.IngFchAnu = '0001-01-01 00:00:00.000000') and   year(x.tffchp) >= 2008
group by  year(x.tffchp)
union
select year(x.tffcsu), 'Suministros',sum(x.tfvats)
 from hosvital.tmpfac2 x
 where    x.tfstpotrn ='F' and  x.tfestaanu2 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving,year(x.tffcsu))  in      (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm)
		     					      from hosvital.ingresos i	
							where   i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')   and i.IngFchAnu = '0001-01-01 00:00:00.000000') and   year(x.tffcsu) >= 2008
group by  year(x.tffcsu);



select  year(i.ingfecadm),i.clapro, count(*)
from hosvital.ingresos i
where year(i.ingfecadm)>='2008' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')  and i.IngFchAnu = '0001-01-01 00:00:00.000000' 
group by year(i.ingfecadm),i.clapro
order by  year(i.ingfecadm),i.clapro;


select  year(i.ingfecadm),i.clapro, count(*)
from hosvital.ingresos i
where year(i.ingfecadm)>='2008' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro not in ('5')  
and i.IngFchAnu = '0001-01-01 00:00:00.000000' 
group by year(i.ingfecadm),i.clapro
order by  year(i.ingfecadm),i.clapro;


------------ sumatoria
--------------------------------
select year(i.ingfecadm), 'Procedimientos',
(
select  sum(x.tfvatp)
 from hosvital.tmpfac1 x
 where   year(x.tffchp) = year(i.ingfecadm) and x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving = i.ingcsc and  x.tfptpotrn ='F' and  tfestaanu1 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving, year(x.tffchp))  in    
  (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm)      from hosvital.ingresos i where   i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')   and i.IngFchAnu = '0001-01-01 00:00:00.000000') 
) as total_proc
from hosvital.ingresos i
where year(i.ingfecadm)>='2008' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')  and i.IngFchAnu = '0001-01-01 00:00:00.000000' and (i.mptdoc,i.mpcedu,i.ingcsc) not in (select p.mptdoc,p.mpcedu,p.mactving from hosvital.maeate  p) group by year(i.ingfecadm)
union
select year(i.ingfecadm), 'Suministros',
(
select sum(x.tfvats)
 from hosvital.tmpfac2 x
 where    x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving = i.ingcsc and x.tfstpotrn ='F' and  x.tfestaanu2 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving,year(x.tffcsu))  in      (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm)
		     					      from hosvital.ingresos i	
							where   i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')   and i.IngFchAnu = '0001-01-01 00:00:00.000000') and   year(x.tffcsu)  = year(i.ingfecadm)) as total_suministros
from hosvital.ingresos i
where year(i.ingfecadm)>='2008' and i.ingfecegr='0001-01-01 00:00:00' and i.clapro in ('1','2','3')  and i.IngFchAnu = '0001-01-01 00:00:00.000000' and (i.mptdoc,i.mpcedu, i.ingcsc) not in (select p.mptdoc,p.mpcedu,p.mactving from hosvital.maeate p) group by year(i.ingfecadm);


select year(i.ingfecadm), 'Procedimientos',
(
select  sum(x.tfvatp) as total
 from hosvital.tmpfac1 x
 where   year(x.tffchp) = year(i.ingfecadm) and x.tftdoc=i.mptdoc and x.tfcedu=i.mpcedu and x.tmctving = i.ingcsc and  x.tfptpotrn ='F' and  tfestaanu1 <>'S' and (x.tftdoc, x.tfcedu, x.tmctving, year(x.tffchp))  in    
  (select  i.mptdoc, i.mpcedu, i.ingcsc, year(i.ingfecadm) from hosvital.ingresos i where i.clapro in ('1','2','3')   and i.IngFchAnu = '0001-01-01 00:00:00.000000') 
) as total_proc
from hosvital.ingresos i
where year(i.ingfecadm)>='2008' and i.clapro in ('1','2','3')  and i.IngFchAnu = '0001-01-01 00:00:00.000000' and (i.mptdoc,i.mpcedu,i.ingcsc) not in (select p.mptdoc,p.mpcedu,p.mactving from hosvital.maeate  p)
 group by year(i.ingfecadm);



SELECT * FROM HOSVITAL.TMPFAC1;

SELECT *  -- SUM(TFVATP)  
FROM HOSVITAL.TMPFAC1
WHERE  year(tffchp) = 2010 and tfptpotrn ='F' and  tfestaanu1 <>'S' AND (tftdoc,tfcedu,tmctving) not in (select mptdoc, mpcedu,mactving from hosvital.maeate) AND
                  (tftdoc,tfcedu,tmctving) NOT IN (SELECT i.mptdoc,i.mpcedu, i.ingcsc from hosvital.ingresos i where  i.IngFchAnu <> '0001-01-01 00:00:00.000000'   ) ;


SELECT SUM(TFVATS)  	
FROM HOSVITAL.TMPFAC2
WHERE  year(tffcsu) = 2010 and  tfStpotrn ='F' and  tfestaanu2 <>'S' AND (tftdoc,tfcedu,tmctving) not in (select mptdoc, mpcedu,mactving from hosvital.maeate)  AND
                  (tftdoc,tfcedu,tmctving) NOT IN (SELECT i.mptdoc,i.mpcedu, i.ingcsc from hosvital.ingresos i where  i.IngFchAnu <> '0001-01-01 00:00:00.000000'   ) ;

1007711105

