
-- Cirugias

select * from hosvital.procir1 where procircod=130629	
;
select * from hosvital.audserv where AutCscCir=133876	
;
	
select p.procircod,cap.mptdoc,cap.mpcedu,cap.mpnomc as paciente,maeemp.menomb as contrato, case when p.prosit='1' then 'Programada' when p.prosit='0' then '' when p.prosit='2' then 'Urgencias' when p.prosit='3' then 'Otra'    end as tipo_cirugia,  m11.mmcodm ,m11.mmnomm medico_cirugia, esp11.menome as especialidad,  p.profsep as fecha_solicitud_ciru,
aud.AutFecFin Fecha_Autorizacion, aud.AutHorFin as Hora_autorizacion, d.fecinicir as Realizacion_acto_Quirurgico, d.horinicir as hora_inicio, d.horfincir as  hora_final
from  hosvital.procir p 
inner join hosvital.capbas  cap on (cap.mptdoc  =  p.mptdoc and cap.mpcedu= p.mpcedu)
inner join hosvital.maeemp maeemp on (maeemp.mennit=p.proeps)
left  join hosvital.audserv aud on (aud.AutCscCir= p.procircod and aud.autestado='A')
inner join hosvital.descirmed d on (d.codcir = p.procircod)	
inner join hosvital.maemed1 m11 on (m11.mmcodm = d.codmed)
inner join hosvital.maeesp esp11 on (esp11.mecode=d.codesp)
 where p.profec>= '2021-06-01' and p.profec <= '2021-06-30' ;


/*
Ruta: Hosvital Report / Indicadores cirugia/ Oportunidad y Autorización Cirugías
Campos:
- # Cirugía
- Tipo de Identificación del paciente
- Nombre y apellidos del paciente
- Contrato asociado a la cirugia

- Tipo de cirugia (programada / urgencias )
- Profesional que realiza cirugia
- Especialidad
- Fecha de solicitud de la cirugia (orden medica/boleta de cirugia)
- Fecha autorización de la cirugia
- Fecha de realización de la cirugia

*/

