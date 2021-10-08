-- DOCUMENTA . Se deja una columna de 18:00 hasta las 05:59mdel dia sgte aplicacion medicamentos por turnos


---------------------------------------------------------------------
-- Query Consolidado
---------------------------------------------------------------------

select  mae.mpnomp pabellon, maepab1.mpnumc as cama,i2.ingfecmop as ingreso_a_cama, i.ingfecadm ingreso_admision,cap.mpcedu documento,cap.mpnomc as paciente,i.ingcsc num_ingreso, i.ingfecegr EGRESO, 
(select case when count(*)  = 0 then 'Verde' else 'Rojo' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord <= i2.ingfecmop
) Pendientes_Otros_Servicios,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.hisccie='1'  and h1.fhcindesp='GN' AND h1.hisfhorat >=i2.ingfecmop
) ingreso_evol_medico,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.hisccie='1' and h1.fhcindesp='EN' AND h1.hisfhorat >=i2.ingfecmop
) ingreso_evol_Enfermeria,
(
case when (
(select  ifnull(sum(ifnull(a.FSmCntsol,0) ),0)
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop and a.FsmIndAmb  <> 'A'
)  -
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
+
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop )
) > 0 then 'Rojo Pendiente x Despachar' 
when (
(select  ifnull(sum(ifnull(a.FSmCntsol,0) ),0)
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop and a.FsmIndAmb  <> 'A'
)  -
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
+
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop )
) < 0 then 'Amarillo Se despacho mas' else 'Verde Despachado' end
) Farmacia,
(select case when count(*)  = 0 then 'Verde' else 'Rojo' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord > i2.ingfecmop and h51.hcordamb='N'
) ApoyosComplementarios,
(
CASE WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_x_Aplicar'
WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Aplicacion_Al_Dia'
WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo Se_Aplica_Mas'
END
) Enfermeria_indicador_NoAplica,
(
CASE
WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo DeMas_12_00_00AM'

WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Al_Dia_12_00_00AM'

WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '06:00:00' and '12:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_12_00_00AM'
END
) Enfermeria_NoAplica_12_00_00AM,
(
CASE
WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo DeMas_18_00_00PM'

WHEN
(

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Al_Dia_18_00_00PM'

WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00'  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and time(dsp1.dsmfhrmov) between '12:00:01' and '18:00:00' and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_18_00_00PM'
END
) Enfermeria_NoAplica_18_00_00PM,
(
CASE
WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59')
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59')  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59') and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo DeMas_05_59_59AM'

WHEN
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59')
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59')  )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59') and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Al_Dia_05_59_59AM'

WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59')
)
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59') )
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop  and ( time(dsp1.dsmfhrmov) between '18:00:01' and '23:59:59' or   time(dsp1.dsmfhrmov) between '00:00:01' and '05:59:59') and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_05_59_59AM'
END
) Enfermeria_NoAplica_05_59_59AM,
 case when i.inginslc ='S' then 'Azul' else ' ' end  Alta_Medica,
(
case when
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
(select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A')  and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0  then 'Rojo Pendiente_a_Devolver'
when  
(
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
-
(select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A')  and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) =  0  then 'Verde'
else 'Amarillo' end
) Indicador_a_devolver,
(select case when count(*) >0 then 'Verde' else '' end
from hosvital.maeate m
where m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving= i.ingcsc and (m.mptdoc,m.mpcedu,m.mactving) not in (select t.tftdoc,t.tfcedu,t.tmctving from hosvital.tmpfac t)) Facturado
from hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpctvin=i.ingcsc)
inner join hosvital.maepab mae on (mae.mpcodp= maepab1.mpcodp)
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.ingcodpab=maepab1.mpcodp and i2.ingcodcam=maepab1.mpnumc)
where mae.mpclapro=2   and  mae.mpnomp liKe ('%HOSP%')  AND mae.mpnomp NOT LIKE ('%QUIR%') AND mae.mpnomp NOT LIKE ('%REANI%') AND mae.mpnomp NOT LIKE ('%CIRU%')
    and  maepab1.mpdisp=1 and i2.ingfecmop = (select max(i3.ingfecmop) from hosvital.ingresomp i3 where i3.mptdoc=i2.mptdoc and i3.mpcedu=i2.mpcedu and i3.ingcsc=i2.ingcsc and i3.ingcodpab =  i2.ingcodpab and i3.ingcodcam = i2.ingcodcam )
order by  mae.mpnomp , maepab1.mpnumc, i.mpcedu;


