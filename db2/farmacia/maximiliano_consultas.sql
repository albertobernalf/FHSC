select m.mmnomm as medico,maesum1.msreso as cod_med, maesum1.msnomg as medicamento,c.mptdoc as tipodoc, c.mpcedu as documento,c.mpnomc as paciente,h.hiscsec as folio,h.hisfhorat as fecha_orden from hosvital.hccom1 h inner join hosvital.frmsmns f on (f.histipdoc= h.histipdoc and f.hisckey=h.hisckey and f.hiscsec=h.hiscsec) inner join hosvital.maemed1 m on (m.mmcodm=h.hiscmmed) inner join hosvital.maesum1 maesum1 on (maesum1.msreso = f.fsmmsreso) inner join hosvital.capbas c on (c.mptdoc=h.histipdoc and c.mpcedu= h.hisckey) where h.hisfhorat>='2021-01-01 00:00:00' and h.hisfhorat<='2021-01-05 23:59:59' order by h.hisfhorat;


--       formulas medias   ordenadas

select m.mmnomm as medico,maesum1.msreso as cod_med, maesum1.msnomg as medicamento, count(*) TOTAL
 from hosvital.hccom1 h inner join hosvital.frmsmns f on (f.histipdoc= h.histipdoc and f.hisckey=h.hisckey and f.hiscsec=h.hiscsec) inner join hosvital.maemed1 m on (m.mmcodm=h.hiscmmed) inner join hosvital.maesum1 maesum1 on (maesum1.msreso = f.fsmmsreso) inner join hosvital.capbas c on (c.mptdoc=h.histipdoc and c.mpcedu= h.hisckey) where h.hisfhorat>='2021-01-01 00:00:00' and h.hisfhorat<='2021-01-05 23:59:59' 
group by m.mmnomm ,maesum1.msreso , maesum1.msnomg;


--  Formulas medicas entregadas

select a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio,cap.mpnomc as paciente, maes.msreso as cod_medicamento, maes.msnomg as Medicamento, (select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada from hosvital.FrmSmns as a inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) inner join hosvital.hccom1 hc on (a.histipdoc = hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) inner join hosvital.maesum1 maes on (maes.msreso = a.fsmmsreso) where a.fsmfhrreg>=? AND a.fsmfhrreg<=? and a.fsmmsreso in ( '0015A11A' ,'0016A11A', '0007A11A','0005A11A', '0005V06D','0008A11A', '0019A11A','0020A11A','0006A11A','0002V02B' , '0035A11A' , '0007B05B','0009B05B', '0004B05B','0009A11A','0008B05B' ,'0018A11A') order by a.histipdoc,a.hisckey, a.hiscsec, maes.msnomg;


selec  maes.msreso as cod_medicamento, maes.msnomg as Medicamento, (select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada
 from hosvital.FrmSmns as a
 inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) 
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.hccom1 hc on (a.histipdoc = hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed)
 inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) 
inner join hosvital.maesum1 maes on (maes.msreso = a.fsmmsreso) 
where a.fsmfhrreg>='2021-01-01 00:00:00' AND a.fsmfhrreg<='2021-01-05 23:59:59' ;

Select * from hosvital.dspfrmc1 WHERE dsmtpotrn ='DS';

SELECT   COUNT(*)
FROM   hosvital.dspfrmc1 
WHERE dsmtpotrn ='DS'
AND  DSMFHRMOV  >='2021-01-01 00:00:00' AND DSMFHRMOV <='2021-01-31 23:59:59' ;;               

-- kardex_farmacia modificado

select * from hosvital.terceros where trcrazsoc like ('%COMPENSAR%');
SELECT * FROM HOSVITAL.REPEXC1   WHERE  REPCLCTV=4 AND REPCTV =51;
SELECT * FROM HOSVITAL.REPEXC2   WHERE  REPCLCTV=4 AND REPCTV =51;
SELECT * FROM HOSVITAL.REPEXC3   WHERE  REPCLCTV=4 AND REPCTV =51;

INSERT INTO HOSVITAL.REPEXC3 SELECT EMPCOD,MCDPTO,4,66,REPCON,REPMAS,REPTIPDAT,  REPTIPFIL FROM  HOSVITAL.REPEXC3   WHERE   REPCLCTV=4 AND REPCTV =51;
INSERT INTO HOSVITAL.REPEXC2 SELECT EMPCOD,MCDPTO,4,66,AUSRID, REPEST FROM  HOSVITAL.REPEXC2   WHERE   REPCLCTV=4 AND REPCTV =51;
