select * from hosvital.hccom44 where hisckey in ('1019021507','1023942629','1136910798','93083690'); -- and hcdietcd=111;

select * from hosvital.RslPrc1  where  hisckey in ('1019021507','1023942629') and hiscsec in (12,76,41);;
select * from hosvital.hccom1 where  hisckey in ('1019021507','1023942629') and hiscsec in (12,76,41);
select * from hosvital.hccom5 where  hisckey in ('1019021507','1023942629') and hiscsec in (12,76,41);

select * from hosvital.ingresos where ingfecadm>='2019-11-20 00:00:00';
select * from hosvital.maepab;

select * from hosvital.RsPNoQx order by rnqclv; -- rnqtip=7 / rnqcod



-- Query dietas

select h44.histipdoc tipo_doc, h44.hisckey documento,cap.mpnomc paciente,mae.mpnomp pabellon,case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end,h44.hiscsec folio,H1.HISFHORAT fecha_folio, rs.rnqclv dieta, h44.hcdiedsc as descripcion_dieta
from hosvital.hccom44 h44
inner join hosvital.hccom1 h1 on (h1.histipdoc=h44.histipdoc and h1.hisckey=h44.hisckey and h1.hiscsec=h44.hiscsec)
inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu=h1.hisckey)
inner join hosvital.ingresos i on (i.mptdoc=cap.mptdoc and i.mpcedu=cap.mpcedu and i.ingcsc = h1.hctvin1)
left join hosvital.tmpfac t on (t.tftdoc=cap.mptdoc and t.tfcedu = cap.mpcedu and t.tmctving=i.ingcsc)
inner  join hosvital.maepab1 mae1 on (mae1.mpnumc = case when i.ingcodceg='' then t.tfccodcam else i.ingcodceg end )
inner  join hosvital.maepab mae on (mae.mpcodp = mae1.mpcodp)
inner join hosvital.RsPNoQx  rs on (rs.rnqtip=7 and rs.rnqcod=h44.hcdietcd)
where h1.hisfhorat>='2019-11-01 00:00:00'  --and h44.hcdietcd=111-- and h1.hisckey  in ('1019021507','1023942629')
order by  h1.histipdoc,h1.hisckey;


