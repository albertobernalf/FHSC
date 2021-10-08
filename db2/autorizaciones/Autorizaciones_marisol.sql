SELECT a.autfecsol fecha_solicitud, a.authorsol hora,cap.mptdoc tipo_doc,cap.mpcedu documento,cap.mpnomc paciente,a.autcsc consecutivo,maepro.prcodi  as  cod_proced,maepro.prnomb as procedimiento,
case when a.autestado='P' then 'Pendiente'  when a.autestado='A' then 'Autorizada' when a.autestado='E' then 'En tramite' when a.autestado='R' then 'Rechazada'  when a.autestado='C' then 'Cancelada'  when a.autestado='S' then 'Suspendida'  end as estado,
a2.AUTSERVFCH as registro, A2.AUTSERVOBS observaciones, des.documento documento_usuario, des.nombre nombre_usuario
FROM hOSVIPRU.AUDSERV A
inner join hosvipru.audserv2 a2 on (a2.empcod=a.empcod and a2.doccod=a.doccod and a2.autcsc=a.autcsc)
inner join hosvipru.capbas cap on (cap.mptdoc = a.auttipdoc and cap.mpcedu = a.autcedu)
INNER JOIN hosvipru.usrdesencripta des on (des.ausrid = a2.autservusu)
inner join hosvipru.maepro maepro on (maepro.prcodi=a2.autserv)
WHERE A.EMPCOD='01' AND A.DOCCOD='AU7' and  a.autfecsol >= '2021-01-01';

select  * from hosvital.audserv;
select  * from hosvital.audserv2;
select  * from hosvital.audserv;