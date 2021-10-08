
-- Query No 1
select c.mptdoc as tipo_doc, c.mpcedu as documento,c.mpnomc as nombre_paciente,i.ingcsc as ingreso, (days(CURRENT DATE) - days(c.mpfchn))/365 as edad,

t.tfccodpab as pabellon,m.mpnomp as nombre_pabellon, t.tfccodcam as cama_Adm,
m1.menomb as contrato,i.ingfecadm as ingreso, i.ingfecegr as egreso,
(select case    when t2.clapro = 5  or t2.clapro =   6 or t2.clapro =  9  or t2.clapro = 10  then 'No Deberia Censo'  when i2.ingfecegr='0001-01-01 00:00:00.000000' and t2.tfccodpab <> 8  then 'Deberia Censo'       else  'No deberia censo' end
from hosvital.ingresos i2, hosvital.tmpfac t2
where i2.mptdoc=i.mptdoc  and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and
          i2.mptdoc=t2.tftdoc  and i2.mpcedu=t2.tfcedu and i2.ingcsc=t2.tmctving

) as censo,
(select m11.mpnumc  
 from hosvital.maepab11 m11
 where  m11.mptdoc = t.tftdoc and m11.mpcedu = t.tfcedu and m11.hiscnsing = t.tmctving  and m11.hiscamedo='O' and  year(m11.hiscamfec)||month(m11.hiscamfec)||day(m11.hiscamfec)||m11.hiscamhor =
		(select max(year(m111.hiscamfec)||month(m111.hiscamfec)||day(m111.hiscamfec)||m111.hiscamhor)
		from hosvital.maepab11 m111
		 where  m111.mptdoc = m11.mptdoc and m111.mpcedu = m11.mpcedu and m111.hiscnsing = m11.hiscnsing and m111.hiscamedo=m11.hiscamedo   )
and
     not exists ( select mx.mpnumc 
	from hosvital.maepab11  mx
	where mx.mptdoc=m11.mptdoc and mx.mpcedu = m11.mpcedu and mx.hiscnsing = m11.hiscnsing and mx.hiscamedo='L' and mx.mpcodp=m11.mpcodp and mx.mpnumc=m11.mpnumc and 
		(year(mx.hiscamfec)||' '||month(mx.hiscamfec)||' '||day(mx.hiscamfec)||' '||mx.hiscamhor) >  (year(m11.hiscamfec)||' '||month(m11.hiscamfec)||' '||day(m11.hiscamfec)||' '||m11.hiscamhor)
              )

) as camaCenso,
(select sum(tfvatp)
from hosvital.tmpfac1 t2
where t.tftdoc = t.tftdoc and t2.tfcedu=t.tfcedu and t2.tmctving = t.tmctving and t2.tfptpotrn='F' and t2.tfestaanu1 <>'S'
) as procedimientos,
(select sum(tfvats)
from hosvital.tmpfac2 t2
where t.tftdoc = t.tftdoc and t2.tfcedu=t.tfcedu and t2.tmctving = t.tmctving and t2.tfstpotrn='F' and t2.tfestaanu2 <> 'S'
) as suministros,
CASE t.CLAPRO WHEN '1' THEN 'FACTURACION' WHEN '2' THEN 'FACTURACION' WHEN '3' THEN 'FACTURACION' WHEN '4' THEN 'FACTURACION' WHEN '5' THEN 'FACTURACION' WHEN '6' THEN 'REFACTURACION' WHEN '7' THEN 'REFACTURACION' WHEN '8' THEN 'REFACTURACION' WHEN '9' THEN 'REFACTURACION' WHEN '10' THEN 'REFACTURACION' END AS ESTADO_ING,  CASE t.CLAPRO WHEN '1' THEN 'AMBULATORIO' WHEN '2' THEN 'HOSPITALIZACION' WHEN '3' THEN 'URGENCIAS' WHEN '4' THEN 'TRIAGE' WHEN '5' THEN 'TRAT. ESPECIAL' WHEN '6' THEN 'AMBULATORIO' WHEN '7' THEN 'HOSPITALIZACION' WHEN '8' THEN 'URGENCIAS' WHEN '9' THEN 'TRIAGE' WHEN '10' THEN 'TRAT. ESPECIAL' END AS TIPO_ESTADO
from hosvital.ingresos i
inner join hosvital.tmpfac t on (t.tfcedu = i.mpcedu and t.tftdoc=i.mptdoc and t.tmctving= i.ingcsc)
inner join hosvital.capbas c on (c.mpcedu = t.tfcedu and c.mptdoc = t.tftdoc)
inner join hosvital.maepab m on (m.mpcodp = t.tfccodpab)
inner join hosvital.maeemp m1 on (m1.mennit = t.tfmeni)
order by c.mpcedu;

--Notas

-- Hay traslados donde esta el pabellon mas no la cama
select count(*) from hosvital.tmpfac; --2316 / 2291

-- ver 93202517       

-----------------------------------
-- infiorme acotado
---------------------------------------

select c.mptdoc as tipo_doc, c.mpcedu as documento,c.mpnomc as nombre_paciente,i.ingcsc as ingreso, (days(CURRENT DATE) - days(c.mpfchn))/365 as edad,t.tfccodpab as pabellon,m.mpnomp as nombre_pabellon, t.tfccodcam as cama_Adm, 
m1.menomb as contrato,i.ingfecadm as ingreso, i.ingfecegr as egreso,(select case when t2.clapro=5 or t2.clapro=6 or t2.clapro=9  or t2.clapro=10  then 'No Deberia Censo'  when i2.ingfecegr='0001-01-01 00:00:00.000000' and t2.tfccodpab <> 8  then  'Deberia Censo'  else  'No deberia censo' end from hosvital.ingresos i2, hosvital.tmpfac t2 where i2.mptdoc=i.mptdoc  and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.mptdoc=t2.tftdoc  and i2.mpcedu=t2.tfcedu and i2.ingcsc=t2.tmctving 
) as censo,(select m11.mpnumc  from hosvital.maepab11 m11 where m11.mptdoc= t.tftdoc and m11.mpcedu= t.tfcedu and m11.hiscnsing=t.tmctving and m11.hiscamedo='O' and year(m11.hiscamfec)||month(m11.hiscamfec)||day(m11.hiscamfec)||m11.hiscamhor =(select max(year(m111.hiscamfec)||month(m111.hiscamfec)||day(m111.hiscamfec)||m111.hiscamhor) from hosvital.maepab11 m111
where  m111.mptdoc = m11.mptdoc and m111.mpcedu = m11.mpcedu and m111.hiscnsing = m11.hiscnsing and m111.hiscamedo=m11.hiscamedo) and not exists (select mx.mpnumc from hosvital.maepab11 mx 
where mx.mptdoc=m11.mptdoc and mx.mpcedu = m11.mpcedu and mx.hiscnsing = m11.hiscnsing and mx.hiscamedo='L' and mx.mpcodp=m11.mpcodp and mx.mpnumc=m11.mpnumc and 
(year(mx.hiscamfec)||' '||month(mx.hiscamfec)||' '||day(mx.hiscamfec)||' '||mx.hiscamhor) >  (year(m11.hiscamfec)||' '||month(m11.hiscamfec)||' '||day(m11.hiscamfec)||' '||m11.hiscamhor)) ) as camaCenso,
(select sum(tfvatp) from hosvital.tmpfac1 t2 where t.tftdoc = t.tftdoc and t2.tfcedu=t.tfcedu and t2.tmctving = t.tmctving and t2.tfptpotrn='F' and t2.tfestaanu1 <>'S' ) as procedimientos,
(select sum(tfvats) from hosvital.tmpfac2 t2 where t.tftdoc = t.tftdoc and t2.tfcedu=t.tfcedu and t2.tmctving = t.tmctving and t2.tfstpotrn='F' and t2.tfestaanu2 <> 'S' ) as suministros,
CASE t.CLAPRO WHEN '1' THEN 'FACTURACION' WHEN '2' THEN 'FACTURACION' WHEN '3' THEN 'FACTURACION' WHEN '4' THEN 'FACTURACION' WHEN '5' THEN 'FACTURACION' WHEN '6' THEN 'REFACTURACION' WHEN '7' THEN 'REFACTURACION' WHEN '8' THEN 'REFACTURACION' WHEN '9' THEN 'REFACTURACION' WHEN '10' THEN 'REFACTURACION' END AS ESTADO_ING,  CASE t.CLAPRO WHEN '1' THEN 'AMBULATORIO' WHEN '2' THEN 'HOSPITALIZACION' WHEN '3' THEN 'URGENCIAS' WHEN '4' THEN 'TRIAGE' WHEN '5' THEN 'TRAT. ESPECIAL' WHEN '6' THEN 'AMBULATORIO' WHEN '7' THEN 'HOSPITALIZACION' WHEN '8' THEN 'URGENCIAS' WHEN '9' THEN 'TRIAGE' WHEN '10' THEN 'TRAT. ESPECIAL' END AS TIPO_ESTADO from hosvital.ingresos i inner join hosvital.tmpfac t on (t.tfcedu = i.mpcedu and t.tftdoc=i.mptdoc and t.tmctving= i.ingcsc) inner join hosvital.capbas c on (c.mpcedu = t.tfcedu and c.mptdoc = t.tftdoc)
inner join hosvital.maepab m on (m.mpcodp = t.tfccodpab) inner join hosvital.maeemp m1 on (m1.mennit = t.tfmeni) order by c.mpcedu;	
