select h44.histipdoc tipo_doc, h44.hisckey documento,cap.mpnomc paciente,mae.mpnomp pabellon,case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end as cama,H1.HISFHORAT fecha_folio, rs.rnqclv dieta, h44.hcdiedsc as descripcion_dieta 
from hosvital.hccom44 h44 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h44.histipdoc and h1.hisckey=h44.hisckey and h1.hiscsec=h44.hiscsec)
 inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu=h1.hisckey)
 inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = h1.hctvin1) 
left join hosvital.tmpfac t on (t.tftdoc=cap.mptdoc and t.tfcedu=cap.mpcedu and t.tmctving=i.ingcsc)
 inner join hosvital.maepab1 mae1 on (mae1.mpnumc = case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end) 
inner join hosvital.maepab mae on (mae.mpcodp=mae1.mpcodp) 
inner join hosvital.RsPNoQx rs on (rs.rnqtip=7 and rs.rnqcod=h44.hcdietcd) 
where h1.hisfhorat>='2020-01-01 00:00:00' and h1.hisfhorat<='2020-03-31 23:59:59' 
order by h1.histipdoc,h1.hisckey;


select h44.histipdoc tipo_doc, h44.hisckey documento,cap.mpnomc paciente,mae.mpnomp pabellon,case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end as cama,H1.HISFHORAT fecha_folio, rs.rnqclv dieta, h44.hcdiedsc as descripcion_dieta , h44.hiscsec as folio,f.fsmdscmdc
from hosvital.hccom44 h44 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h44.histipdoc and h1.hisckey=h44.hisckey and h1.hiscsec=h44.hiscsec)
 inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu=h1.hisckey)
 inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = h1.hctvin1) 
left join hosvital.tmpfac t on (t.tftdoc=cap.mptdoc and t.tfcedu=cap.mpcedu and t.tmctving=i.ingcsc)
 inner join hosvital.maepab1 mae1 on (mae1.mpnumc = case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end) 
inner join hosvital.maepab mae on (mae.mpcodp=mae1.mpcodp) 
inner join hosvital.RsPNoQx rs on (rs.rnqtip=7 and rs.rnqcod=h44.hcdietcd) 
inner join hosvital.frmsmns f on (f.histipdoc=h44.histipdoc and f.hisckey=h44.hisckey and f.hiscsec=h44.hiscsec)
inner join hosvital.frmsmns1 f1 on (f1.histipdoc=h44.histipdoc and f1.hisckey=h44.hisckey and f1.hiscsec=h44.hiscsec)
where h1.hisfhorat>='2020-01-01 00:00:00' and h1.hisfhorat<='2020-03-31 23:59:59' 
order by h1.histipdoc,h1.hisckey

