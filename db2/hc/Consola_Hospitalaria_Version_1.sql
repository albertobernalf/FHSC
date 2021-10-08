-- Querys de Pruebas
-- Valida Ingreso
select i.mptdoc,i.mpcedu,i.clapro,i.ingcsc,i.ingfecadm,i.ingfecegr,i.ingfac,i.inginslc, c.mpnomc  from hosvital.ingresos i inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) where i. mpcedu ='1020723754';
--Valida Cama que oucpa
SELECT * FROM HOSVITAL.MAEPAB1 WHERE MPCODP='27'ORDER BY MPNUMC;
SELECT * FROM HOSVITAL.MAEPAB1 WHERE MPUCED ='52916991';
update  HOSVITAL.MAEPAB1 set mpdisp='0'  WHERE mpnumc='4N31' AND  MPUCED ='52916991';

select m1.mpcodp,m1.mpnumc,m1.mpfchi, m.mpnomp,mpctvin,MPDISP AS DISPO from hosvital.maepab1 m1 inner join hosvital.maepab m on (m.mpcodp=m1.mpcodp)  where mpuced='52916991';
select * from hosvital.ingresomp where mpcedu ='52916991' order by ingcodcam;
-- Pendientes Paraclinicos desde fecha cama-piso
select * from hosvital.hccom51 where hisckey='11303066' and hcfchrord <= '2020-10-26 21:03:09.0000' and hcprcest IN ('O','E');
-- iNGRESO EVOLUCION MEDICA DESPUES DE fecha CAMA-PISO
select * from hosvital.hccom1 where hisckey='41320661' and hisfhorat>='2020-09-22 20:51:47.000000' and fhcindesp='GN' ;
-- iNGRESO EVOLUCION ENFERMERIA DESPUES DE fecha CAMA-PISO
select * from hosvital.hccom1 where hisckey='11303066' and hisfhorat>='2020-10-26 21:03:09.0000' and fhcindesp='EN' ;
-- CANTIDAD FORMULADA/ DESPACHADA
-- Tengo problemas no incluyo los DIRECTOS

select a.hisckey, sum(ifnull(a.FSMCNTSOL,0) ) formulado,  sum(ifnull(a.FSmCntDia,0) ),sum(ifnull(dsp1.dsmcntmov,0)) despachado
from hosvital.FrmSmns a
left  join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.dsctvin1= a.hictvin and dsp1.hiscSEC= a.hiscSEC and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS')
where    a.fsmfhrreg>='2020-10-29 14:32:38.00000' and  a.hisckey='322176' and a.hictvin=1  and a.hcsmstgr <> 'X'   
group by a.hisckey;

select * from hosvital.frmsmns  WHERE hisckey='25190018' and hictvin=1  and hcsmstgr <> 'X'  AND fsmfhrreg>='2020-10-28 20:44:42.00000' ; 	
select * from hosvital.frmsmns1  WHERE hisckey='25190018' and hictvin1=1 order by hiscsec,mscodi,msprac,msform,cnccd,hcsumcns; -- ; and hcsmstgr <> 'X'  AND fsmfhrreg>='2020-10-28 20:44:42.00000'  
SELECT SUM(FSMCNTSOL) FROM hosvital.FrmSmns WHERE hisckey='41529590' and hictvin=1  and hcsmstgr <> 'X'  AND fsmfhrreg>='2020-10-28-15.59.05.00000' ;  -- 110

SELECT SUM(DSMCNTMOV)  FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41529590'  AND DSCTVIN1=1 AND DSMFHRMOV >= '2020-10-28-15.59.05.00000' AND DSMTPOTRN='DS' ;  --114
SELECT SUM(DSMCNTMOV)  FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41529590'  AND DSCTVIN1=1 AND DSMFHRMOV >= '2020-10-28-15.59.05.00000' AND DSMTPOTRN='DV' ;  --26
SELECT *   FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41529590'  AND DSCTVIN1=1 AND DSMFHRMOV >= '2020-10-28-15.59.05.00000' AND DSMTPOTRN='DV' ;  
SELECT *   FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41529590'  AND DSCTVIN1=1 AND DSMTPOTRN='DS' AND DSMFHRMOV >= '2020-10-28-15.59.05.00000'  ;
SELECT *   FROM HOSVITAL.DSPFRMC WHERE  hisckey='41529590'  AND DSCTVIN=1;

select  DSTIPDES,sum(d.dsmcntdsp),sum(d.dsmcntdes) -- 114
from hosvital.dspfrmc d
inner join hosvital.dspfrmc1 d1 on (d1.histipdoc= d.histipdoc and d1.hisckey=d.hisckey and d1.hiscsec=d.hiscsec and d1.msreso = d.msreso AND d1.DSMTPOTRN='DS' )
where d.hisckey='41529590' and d.dsctvin=1 and  d1.DSMFHRMOV >= '2020-10-28-15.59.05.00000'
group by  DSTIPDES ;


-- Paraclinicos despues de cama  - piso
select * from hosvital.hccom51 where hisckey='11303066' and hcfchrord >= '2020-10-26 21:03:09.0000' and hcprcest IN ('O','E','A','I') AND HCTVIN51=2;

-- Pendientes x Aplicar
select f.hisckey,sum(f.fsmcntsol) formulo_errado,sum(ifnull(f1.hcsumcns,0)) aplico,ifnull(sum(dsp1.dsmcntmov),0) farmacia_despacha,
(
sum(f.fsmcntsol)  - 
sum(ifnull(f1.hcsumcns,0)) 
) No_Aplico
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec  and dsp1.msreso=f.fsmmsreso and  dsp1.DSMTPOTRN='DS')
where f.hisckey='25190018'  and  f.hictvin = 1 AND DSMFHRMOV >= '2020-10-28 20:44:42.00000'
and f1.hcsumest in ('A') AND f1.asfecpapl <> '0001-01-01 00:00:00.000000'  and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest  in ('A') AND  f11.asfecpapl <> '0001-01-01 00:00:00.000000')
group by  f.hisckey     ;

-- Pendientes por devolver
-- De lo despachado que no se ha aplicado

select f.hisckey,sum(f.fsmcntsol) formulo,sum(ifnull(f1.hcsumcns,0)) aplico,sum(dsp1.dsmcntmov) farmacia_despacha,
(
sum(dsp1.dsmcntmov)   - 
sum(ifnull(f1.hcsumcns,0)) 
) A_Devolver
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso AND dsp1.DSMTPOTRN='DS' )
where f.hisckey='41529590'  and  f.hictvin = 1 and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
group by  f.hisckey     ;

-- Pendiente a Devolver otroquery
-- despachadocon directos - devueltos_a_farmacia  - enfermeria_aplica_med

select i.mpcedu,
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
 DESPACHADO,
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
DEVUELTO,
(select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A')  and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  ) APLICADO,
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
)
from hosvital.ingresos i
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc)
where i.mpcedu='41529590' and i.ingcsc=1 and i2.ingcodcam='412-B';

select * from hosvital.ingresomp where mpcedu='41529590' and ingcsc=1;


-- Facturado ?

select * from hosvital.maeate where mpcedu = '1020723754'; -- and mactving = 2;4
select * from hosvital.maeate2 where mpnfac = 641732	;
select * from hosvital.tmpfac where tfcedu= '1020723754';
select * from hosvital.tmpfac1 where tfcedu= '1020723754';
select * from hosvital.tmpfac2 where tfcedu= '1020723754';

-- DespachosDirectos
select * from hosvital.dspfrmc;
select * from hosvital.dspfrmc1;

select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and dsp.dstipdes='D'; -- and dsp.msreso=a.fsmmsreso ;


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
(select  ifnull(sum(ifnull(a.FSmCntsol,0) ),0)
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X' and  a.fsmfhrreg >= i2.ingfecmop

) Formulado_sin_directos,
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and dsp.dstipdes='D' 

) directos,
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso 
) DESPACHADO_con_directos,
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso 

) devueltos_a_farmacia,
-- Formulados_Sin_Directos + Directos - (Despachoscon directos - devueltos_a_farmacia)
-- Formulados_Sin_Directos + Directos - Despachoscon directos + devueltos_a_farmacia
(
case when (
(select  ifnull(sum(ifnull(a.FSmCntsol,0) ),0)
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop

) 
/* +
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and dsp.dstipdes='D'  )
*/
 -
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
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop

) 
/*
+
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop and dsp.dstipdes='D'  )
*/
 -
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
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord > i2.ingfecmop

) ApoyosComplementarios,
(
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) Enfermeria_Aplica_Med,

(
CASE WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) > 0.00 THEN 'Rojo Pendiente_x_Aplicar'

WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) = 0 THEN 'Verde Aplicacion_Al_Dia'

WHEN
(
-- DESPACHO CON DIRECTOS

(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop 
)
-- MENOS DEVUELTOS_A_FARMACI
-
(select ifnull(sum(ifnull(dsp1.dsmcntmov,0)),0)
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DV')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop  )
--MENOS LO QUE APLICA ENFERMERIA
-
( select ifnull(sum(ifnull(f1.hcsumcns,0)),0) 
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd )
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumest in ('A') and dsp1.DSMFHRMOV >= i2.ingfecmop and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest in ('A') )  )
) < 0 THEN 'Amarillo Se_Aplica_Mas'
END
) Enfermeria_indicador_NoAplica,
 case when i.inginslc ='S' then 'Azul' else ' ' end  Alta_Medica,
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
) Pendientes_a_devolver,
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
where m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving= i.ingcsc and (m.mptdoc,m.mpcedu,m.mactving) not in (select t.tftdoc,t.tfcedu,t.tmctving from hosvital.tmpfac t)) Facturado,
'' Boleta_Salida

from hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpctvin=i.ingcsc)
inner join hosvital.maepab mae on (mae.mpcodp= maepab1.mpcodp)
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.ingcodpab=maepab1.mpcodp and i2.ingcodcam=maepab1.mpnumc)
where mae.mpclapro=2   and  mae.mpnomp liKe ('%HOSP%')  AND mae.mpnomp NOT LIKE ('%QUIR%') AND mae.mpnomp NOT LIKE ('%REANI%') AND mae.mpnomp NOT LIKE ('%CIRU%')
    and  maepab1.mpdisp=1
and i.mpcedu= '1020723754'
order by  mae.mpnomp , maepab1.mpnumc, i.mpcedu;
--order by   i.mpcedu;

select * from hosvital.maeate where mpcedu ='79473418';
select * from hosvital.maepab1 where mpuced = '79473418';
select * from hosvital.maepab11 where mpcedu  = '79473418';
select * from hosvital.maepab1 where mpnumc ='754';

-- Altas con cama liberada
-- Altas sin cama Liberada

--Cuando Liberan Cama pailas desaparece de la consulta
