/*

Pido el favor me colabore con el siguiente listado, el cual se necesita generar diariamente y así realizar seguimiento farmacoterapéutico.

1. Que debe contener el listado:
2. Nombre del paciente
3. Número de HC
4. Cama
5. Medicamentos y nutriciones
6. Estado de los medicamentos: (Formulado, modificado, suspendido)
7. Diagnóstico principal del paciente (Coronario, hipertensos, diabeticos... etc)

Gracias

*/

select * from hosvital.frmsmns  where fsmfhrreg>= '2020-08-01 00:00:00'   and hisckey='17165922' and hiscsec = 26 order by hisckey,hiscsec;
select * from hosvital.hccom1 where hisfhorat>= '2020-08-01 00:00:00';
select * from hosvital.hcdiagn;
select * from hosvital.capbas;
select * from hosvital.maedia;

select c.mptdoc tipo_doc,c.mpcedu documento,c.mpnomc paciente ,i.mpnumc as cama, f.hiscsec as folio,f.fsmdscmdc  descripcion,case when f.fsmindcda='C' then 'Continuar' when f.fsmindcda='N' then 'Nuevo' when f.fsmindcda='M' then 'Suspendido' when f.fsmindcda='M' then 'Modificado' end estado_medicamento,
hc.hcdxcod as dx, mae.dmnomb as Diagnostico
from hosvital.frmsmns f
inner join hosvital.ingresos i on (i.mptdoc = f.histipdoc and i.mpcedu= f.hisckey and i.ingcsc=f.hictvin)
inner join hosvital.capbas c on (c.mptdoc = f.histipdoc and c.mpcedu=f.hisckey)
left join hosvital.hcdiagn hc on (hc.histipdoc=f.histipdoc and hc.hisckey=f.hisckey and hc.hiscsec=f.hiscsec and hc.hcdxcls=1)
left join hosvital.maedia mae on (mae.dmcodi =hc.hcdxcod)
where  f.fsmfhrreg>= '2020-08-01 00:00:00'  and  f.fsmfhrreg <= '2020-08-31 00:00:00' and f.hisckey='17165922'
order by f.fsmfhrreg, f.hisckey