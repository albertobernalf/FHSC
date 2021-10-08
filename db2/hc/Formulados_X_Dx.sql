
/*
-Tipo de documento
-Nombre y apellidos del paciente
-Fecha del ingreso
-EPS
-Pabellón
-Diagnóstico (Registrado como principal o relacionados)
-Medicamentos formulados (nombre de medicamento y dosis)
I209, J449, I500, E109, I10X, I679, I219, R51X, K804
*/

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc paciente,i.ingfecadm igreso,mae.menomb contrato,a.hiscsec as folio, case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end  as Accion, a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida, case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via, a.fsmfhrreg as fecha_formulacion_medico
from hosvital.FrmSmns as a 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin)
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
where a.fsmfhrreg  >= '2021-03-02 00:00:00' AND a.fsmfhrreg  <= '2021-03-03 00:00:00';

select * from hosvital.frmsmns;
select * from hosvital.ingresos;
select * from hosvital.hcdiagn;
select * from hosvital.maedia;


-- con dx

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc paciente,i.ingfecadm igreso,mae.menomb contrato,a.hiscsec as folio,
dia.dmcodi  cod_dx, dia.dmnomb diagnostico,
 case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end  as Accion, a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida, case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via, a.fsmfhrreg as fecha_formulacion_medico
from hosvital.FrmSmns as a 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin)
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
inner join hosvital.hcdiagn hc on (hc.histipdoc=a.histipdoc and hc.hisckey=a.hisckey and hc.hiscsec=a.hiscsec)
inner join hosvital.maedia dia on (dia.dmcodi=hc.hcdxcod)
where i.ingfecadm  >= '2021-03-02 00:00:00' AND i.ingfecadm  <= '2021-03-03 00:00:00' and hc.hcdxcod in ('I209', 'J449', 'I500', 'E109', 'I10X','I679', 'I219', 'R51X', 'K804');


--


-- con dx

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc paciente,i.ingfecadm igreso,i.ingcsc ingreso,mae.menomb contrato,a.hiscsec as folio,
dia.dmcodi  cod_dx, dia.dmnomb diagnostico,
 case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end  as Accion, a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida, case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via, a.fsmfhrreg as fecha_formulacion_medico
from hosvital.FrmSmns as a 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin)
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
inner join hosvital.maedia dia on (dia.dmcodi='I500')
where i.mpcedu= '19069141' and  i.ingfecadm  >= '2021-03-01 00:00:00' AND i.ingfecadm  <= '2021-03-31 00:00:00'  and (a.histipdoc,a.hisckey, a.hictvin) in
							 (select   f.histipdoc, f.hisckey, f.hictvin
							   from hosvital.FrmSmns f
							  inner join hosvital.hcdiagn hcd on (hcd.histipdoc=f.histipdoc and hcd.hisckey =f.hisckey and 										hcd.hiscsec=f.hiscsec )
							where f.histipdoc=a.histipdoc and f.hisckey=a.hisckey AND f.hictvin=a.hictvin and hcd.hcdxcod in ('I500') );

select * from hosvital.maepab;
-- prueba

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc paciente,i.ingfecadm fecha_ingreso,i.ingcsc ingreso,pab.mpnomp pabellon,mae.menomb contrato,a.hiscsec as folio,
dia.dmcodi  cod_dx, dia.dmnomb diagnostico,
 case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end  as Accion, a.fsmdscmdc as descripcion, a.FSmCntDia as cantidad	, a.hiscansum as dosis, un.unmddes as medida,maec.cncdes as concentracion,via.viapldsc as via, a.fsmfhrreg as fecha_formulacion_medico
from hosvital.FrmSmns as a 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin)
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
inner join hosvital.maedia dia on (dia.dmcodi='I500')
inner join hosvital.maepab pab on (pab.mpcodp = i.mpcodp)
where   i.ingfecadm  >= '2021-01-01 00:00:00' AND i.ingfecadm  <= '2021-01-31 00:00:00'  and (a.histipdoc,a.hisckey, a.hictvin) in
							 (select   f.histipdoc, f.hisckey, f.hictvin
							   from hosvital.FrmSmns f
							  inner join hosvital.hcdiagn hcd on (hcd.histipdoc=f.histipdoc and hcd.hisckey =f.hisckey and 										hcd.hiscsec=f.hiscsec )
							where f.histipdoc=a.histipdoc and f.hisckey=a.hisckey AND f.hictvin=a.hictvin and hcd.hcdxcod in ('I500') )
order by a.histipdoc,  a.hisckey, a.hiscsec;


-- A LO MEJOR TOTALIZANDO
------------------------------------
--
select dia.dmcodi  cod_dx, dia.dmnomb diagnostico, a.fsmdscmdc as descripcion, sum(a.FSmCntDia) as cantidad, a.hiscansum as dosis, un.unmddes as medida, maec.cncdes as concentracion,via.viapldsc as via
from hosvital.FrmSmns as a 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin)
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
inner join hosvital.maedia dia on (dia.dmcodi='I500')
where i.mpcedu= '19069141' and  i.ingfecadm  >= '2021-03-01 00:00:00' AND i.ingfecadm  <= '2021-03-31 00:00:00'  and (a.histipdoc,a.hisckey, a.hictvin) in
							 (select   f.histipdoc, f.hisckey, f.hictvin
							   from hosvital.FrmSmns f
							  inner join hosvital.hcdiagn hcd on (hcd.histipdoc=f.histipdoc and hcd.hisckey =f.hisckey and 										hcd.hiscsec=f.hiscsec )
							where f.histipdoc=a.histipdoc and f.hisckey=a.hisckey AND f.hictvin=a.hictvin and hcd.hcdxcod in ('I500') )
group by dia.dmcodi  , dia.dmnomb ,  a.fsmdscmdc , a.hiscansum,   un.unmddes , maec.cncdes ,via.viapldsc 
order by a.fsmdscmdc;

-- ejecucion de yuda

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc paciente,i.ingfecadm fecha_ingreso,i.ingcsc ingreso,mae.menomb contrato,a.hiscsec as folio,dia.dmcodi  cod_dx, dia.dmnomb diagnostico, case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end as Accion, a.fsmdscmdc as descripcion, a.FSmCntDia as cantidad,a.hiscansum as dosis, un.unmddes as medida,maec.cncdes as concentracion,via.viapldsc as via, a.fsmfhrreg as fecha_formulacion_medico from hosvital.FrmSmns as a inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu= a.hisckey) inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = a.hictvin) inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) inner join hosvital.maeemp mae on (mae.mennit=i.ingnit) inner join hosvital.maedia dia on (dia.dmcodi='K804') where i.ingfecadm>='2020-01-01 00:00:00' AND i.ingfecadm<='2020-12-31 23:59:59' and (a.histipdoc,a.hisckey, a.hictvin) in (select f.histipdoc, f.hisckey, f.hictvin from hosvital.FrmSmns f inner join hosvital.hcdiagn hcd on (hcd.histipdoc=f.histipdoc and hcd.hisckey =f.hisckey and hcd.hiscsec=f.hiscsec) where f.histipdoc=a.histipdoc and f.hisckey=a.hisckey AND f.hictvin=a.hictvin and hcd.hcdxcod in ('K804')) order by a.histipdoc,a.hisckey, a.hiscsec