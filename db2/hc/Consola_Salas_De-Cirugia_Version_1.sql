select distinct protipcam from hosvital.procir ;
select procircod,mpcedu,profsep,prohsep,profec,pfchrcnf FROM HOSVITAL.PROCIR where profec >= '2020-10-01' and mpcedu in ('2938942');	

select * from hosvital.procir where mpcedu= '2379607';
select * from hosvital.procir where procircod = 127993				; -- PROFECF, PROHORI, PROHORF =FECHA, HORA Y FIN DE PROGRAMACION DE LA CIRU
select * from hosvital.procir where procircod = 127993		;
select * from hosvital.procir1 where procircod = 127993	;
select * from hosvital.procir2  where procircod = 127993	;;
select * from hosvital.consul where consdet like ('%ASIG%'); --227	
select * from hosvital.descirmed where codcir in (127993);
select * from hosvital.descirmed1 where codcir in (127993);
select * from hosvital.maepab1 where mpuced  in ('2938942');   
select * from hosvital.maepab11 where mpcedu= '2379607' order by hiscamfec; 	
select * from hosvital.ingresos where mpcedu= '2379607';
select * from hosvital.ingresomp where mpcedu= '2379607';

SELECT * FROM HOSVITAL.TURQUI WHERE PROCIRCOD=128331; -- FECHA DE INGRESO SALIDA HORA DE INGRESO REAL DE LA SALA DE CIRU
SELECT * FROM HOSVITAL.TURQUI1 WHERE TUQCNS=128331;
select * from hosvital.procir where procircod = 128331		;
select * from hosvital.descirmed where codcir in (128331);
select * from hosvital.descirmed1 where codcir in (128331);


-- Query Consola de Cirugia

select p.procircod cod_cirugia,cons.consdet sala,p.mptdoc tipo_doc,p.mpcedu documento,cap.mpnomc paciente,p.profec fecha,'' alistamiento,
case when p.proesta ='1' then 'Reservada' when p.proesta ='2' then 'Confirmada' when p.proesta ='4' then 'Realizada' when p.proesta ='3' then 'Cancelada' when p.proesta ='5' then 'Facturada' when p.proesta ='6' then 'Pendiente' when p.proesta ='7' then 'Con Instrucciones' end estado_proc, 
( select case when count(*) > 0 then 'Verde' else 'Rojo' end
 from hosvital.descirmed des
 where des.codcir=p.procircod
) desq_qx  , case when  p.prorescam='S' then 'Reserva cama' else ' ' end Reserva_cama,
 case when  p.protipcam='U' then 'UCI'  when  p.protipcam='H' then 'Hospitalizacion'  else ' ' end TipoCama
,
 (select  m11.mpnumc
from hosvital.maepab11 m11
inner join hosvital.ingresomp i on (i.mptdoc = p.mptdoc and i.mpcedu = p.mpcedu and i.ingcsc = m11.hiscnsing and date(i.ingfecmop) >= date(case when p.pfchrcnf = '0001-01-01 00:00:00.000000' then date('2099-01-01 00:00:00') else  date(p.pfchrcnf)  end) and i.ingcodpab = m11.mpcodp and i.ingcodcam=m11.mpnumc   and  i.ingfecmop = (select max (ii.ingfecmop) from hosvital.ingresomp ii where ii.mptdoc=i.mptdoc and ii.mpcedu=i.mpcedu and ii.ingcsc   = i.ingcsc and ii.ingcodpab = i.ingcodpab   ))
inner join hosvital.maepab mm on (mm.mpclapro=2  and mm.mpcodp = i.ingcodpab  anD mm.mpnomp NOT LIKE ('%QUIR%') AND mm.mpnomp NOT LIKE ('%CIRU%'))
where m11.mptdoc = p.mptdoc and m11.mpcedu=p.mpcedu  and m11.hiscamedo='O'  and  date(cast(concat(concat(cast(m11.hiscamfec as varchar(10)),' '), m11.hiscamhor) as date)) >= date(p.pfchrcnf) and
   m11.hiscamhor = ( select min (m111.hiscamhor) from hosvital.maepab11 m111 where m111.mptdoc=m11.mptdoc and m111.mpcedu = m11.mpcedu and m111.hiscnsing= m11.hiscnsing and m111.hiscamfec = p.profec  and m111.hiscamedo='O'  and m111.mpnumc=m11.mpnumc)
) Cama

from hosvital.procir p
inner join hosvital.capbas cap on (cap.mptdoc =p.mptdoc and cap.mpcedu = p.mpcedu)
inner join hosvital.consul cons on (cons.conscod = p.procons)
where p.profec >= '2021-05-01' and p.profec <= '2021-05-10' and p.proesta <> 3    -- and p.mpcedu='1070013199'  
order by p.profec,cons.conscod,p.mpcedu;

SELECT * FROM HOSVITAL.PROCIR WHERE PROcircod = 133630;   -- fecha de confirmacion 2021-05-16 11:27:59.000000	

select * from hosvital.maepab where  mpclapro=2;

select * from hosvital.maepab11 where mpcedu='1070013199' and hiscnsing= 3;
select * from hosvital.ingresomp  where mpcedu='1070013199' and  ingcsc=3;

select   distinct  protipcam  from hosvital.procir;

-- Query a Entregar
---------------------------------
----------------------------------------
delete from hosvital.consola_cirugia;
insert into hosvital.consola_cirugia
select cons.consdet sala,p.mptdoc tipo_doc,p.mpcedu documento,cap.mpnomc paciente,p.profec fecha,'' alistamiento,
case when p.proesta ='1' then 'Reservada' when p.proesta ='2' then 'Confirmada' when p.proesta ='4' then 'Realizada' when p.proesta ='3' then 'Cancelada' when p.proesta ='5' then 'Facturada' when p.proesta ='6' then 'Pendiente' when p.proesta ='7' then 'Con Instrucciones' end procedimiento_estado, ( select case when count(*) > 0 then 'Verde' else 'Rojo' end
 from hosvital.descirmed des
 where des.codcir=p.procircod) Recuperacion  ,  case when  p.protipcam='U' then 'UCI'  when  p.protipcam='H' then 'Hospitalizacion'  else ' ' end Destino
from hosvital.procir p
inner join hosvital.capbas cap on (cap.mptdoc =p.mptdoc and cap.mpcedu = p.mpcedu)
inner join hosvital.consul cons on (cons.conscod = p.procons)
where p.profec >= '2021-05-24'  and p.profec <= '2021-05-28' and p.proesta <> 3
order by p.procircod;


select * from hosvital.consola_cirugia;

select codcir,codmed from hosvital.descirmed where codcir in
(select p.procircod from hosvital.procir p where p.profec >= '2021-05-24'  and p.profec <= '2021-05-24' and p.proesta <> 3);
