--Consulta Censo Diario

select mae.mpnomp pabellon, m.mpnumc as cama, cap.mptdoc||'-'||rtrim(cap.mpcedu)||'-'||ltrim(i.ingcsc) documento_ingreso ,cap.mpnomc paciente , (days (i.ingfecadm) - days(cap.mpfchn))/360 edad, i.ingdxcli codigo_dx,maedia.dmnomb as diagnostico,date(i.ingfecadm) fecha_ingreso,(days(current_date) - days(i.ingfecadm))  dias_estancia, maeemp.menomb as ars_arl, CASE WHEN maeemp.mecapi=1 then 'Capitado' WHEN maeemp.mecapi=0 then 'Evento' end contrato, esp.menome especialidad_tratante
 from hosvital.maepab mae
inner join  hosvital.maepab1 m on (m.mpcodp =mae.mpcodp and m.mpdisp in (1,8) )
left join hosvital.ingresos i on (i.mptdoc = m.mpudoc and i.mpcedu=m.mpuced and i.ingcsc = m.mpctvin)
left join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
left join hosvital.maeemp maeemp on (maeemp.mennit= i.ingnit)
left join hosvital.maedia maedia on (maedia.dmcodi= i.ingdxcli)
inner join hosvital.maeesp esp on (esp.mecode=i.ingesmt)
order by m.mpcodp,m.mpnumc;

--  De pronto para las camas en mantenimiento

select mae.mpnomp pabellon, m.mpnumc as cama,' ' documento_ingreso ,'EN MANTENIMIENTO ' paciente , 0 edad, ' ' codigo_dx,' ' diagnostico,' ',0 dias_estancia,' ' ars_arl, ' ' contrato, ' ' especialidad_tratante
 from hosvital.maepab mae
inner join  hosvital.maepab1 m on (m.mpcodp =mae.mpcodp and m.mpdisp in (8) )
order by m.mpcodp,m.mpnumc;


-- Manejo de Camas

select * from hosvital.maepab1   order by mpnumc;
select * from hosvital.maepab1   order by mpnumc;
select * from hosvital.maepab11 where mpcedu='28717296' order by hiscamfec,hiscamhor;
select * from hosvital.maepab order by mpclapro,mpcodp; -- clapro 3 = urge 2 = hospi

-- Query transicion , manejo de camas

select cap.mptdoc tipo_doc,cap.mpcedu documento, cap.mpnomc paciente,case when m11.hiscamedo='L'  then 'Libera'   when m11.hiscamedo='O'  then 'Ocupa'  end  estado,case when m.mpclapro=3 then 'Urgencias'  when m.mpclapro=2 then 'Hospitalizacion' end servicio,m.mpcodp cod_pab,m.mpnomp pabellon, m11.mpnumc hab, m11.hiscamfec fecha,m11.hiscamhor hora,
(select 'Ocupa '||' '||m1111.mpnumc from hosvital.maepab11 m1111
inner join hosvital.maepab m0 on (m0.mpcodp=m1111.mpcodp)
where m0.mpclapro=2 and m1111.mptdoc=m11.mptdoc and m1111.mpcedu=m11.mpcedu and m1111.hiscnsing=m11.hiscnsing and m1111.hiscamedo='O' and m1111.hiscamfec= '2021-07-08' and (cast(m1111.hiscamfec as varchar(10))||' '||m1111.hiscamhor) =(select max((cast(m1112.hiscamfec as varchar(10))||' '||m1112.hiscamhor))
		       from hosvital.maepab11 m1112
		       inner join hosvital.maepab m00 on (m00.mpcodp=m1112.mpcodp)
		      where m00.mpclapro=2 and m1112.mptdoc=m11.mptdoc and m1112.mpcedu=m11.mpcedu and m1112.hiscnsing=m11.hiscnsing and m1112.hiscamedo='O' and m1112.hiscamfec= '2021-07-08')) traslado
from hosvital.maepab11 m11
inner join hosvital.maepab m on (m.mpcodp=m11.mpcodp)
inner join hosvital.capbas cap on (cap.mptdoc = m11.mptdoc and cap.mpcedu=m11.mpcedu)
where m11.hiscamfec = '2021-07-08' and m11.hiscamedo='L' and m.mpclapro=3 and (m11.mptdoc,m11.mpcedu) in (select m111.mptdoc, m111.mpcedu from hosvital.maepab11 m111
							      inner join hosvital.maepab m0 on (m0.mpcodp=m111.mpcodp)
							     where m0.mpclapro=2 and m111.mptdoc=m11.mptdoc and m111.mpcedu=m11.mpcedu and m111.hiscnsing=m11.hiscnsing and m111.hiscamedo='O' and m111.hiscamfec= '2021-07-08');






