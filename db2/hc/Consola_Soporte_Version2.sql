SELECT * FROM HOSVITAL.HCCOM51; -- HCORDAMB='N'
select * from hosvital.dspfrmc1;
select * from hosvital.dspfrmc;
select * from hosvital.FrmSmnsAm;
select distinct FsmIndAmb from hosvital.frmsmns; -- 'A' = Anbulatoria ,, n = NoRMAL

select * from hosvital.maepab1 where mpnumc='614-C';
SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU= '80904717';
SELECT * FROM HOSVITAL.MAEPAB11 WHERE MPCEDU ='80904717' ORDER BY HISCAMFEC;
SELECT * FROM HOSVITAL.ingresomp  WHERE MPCEDU= '80904717';  -- 2020-11-04 22:11:43.000000	
SELECT * FROM HOSVITAL.MAEPAB1 WHERE mpuced ='80904717' ;

SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY='80904717'  AND HCFCHRORD >='2020-11-04 22:11:43' ;

select hisckey, hiscsec,msreso,dsmfhrmov, time(dsmfhrmov) from hosvital.dspfrmc1 where  time(dsmfhrmov) between '06:00:00' and '12:00:00';
select hisckey, hiscsec,msreso,dsmfhrmov, time(dsmfhrmov) from hosvital.dspfrmc1 where  time(dsmfhrmov) between '12:00:01' and '18:00:00';
select hisckey, hiscsec,msreso,dsmfhrmov, time(dsmfhrmov) from hosvital.dspfrmc1 where  time(dsmfhrmov) between '18:00:01' and '23:59:59';
select hisckey, hiscsec,msreso,dsmfhrmov, time(dsmfhrmov) from hosvital.dspfrmc1 where  time(dsmfhrmov) between '00:00:01' and '05:59:59';

select hisckey, hiscsec,msreso,dsmfhrmov, time(dsmfhrmov) from hosvital.dspfrmc1 where  (dsmfhrmov = dsmfhrmov  and  time(dsmfhrmov) between '18:00:01' and '23:00:00' or 
						(dsmfhrmov = (dsmfhrmov+1)  and  time(dsmfhrmov) between '00:00:01' and '05:59:59'))	;


WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo DeMas_05:59:59AM'

WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Al_Dia_05:59:59AM'

WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59'  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_05:59:59AM'

