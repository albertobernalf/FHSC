-- Querys de Pruebas
-- Valida Ingreso
select i.mptdoc,i.mpcedu,i.clapro,i.ingcsc,i.ingfecadm,i.ingfecegr,i.ingfac,i.inginslc, c.mpnomc  from hosvital.ingresos i inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu) where i. mpcedu ='41320661';
--Valida Cama que oucpa
select m1.mpcodp,m1.mpnumc,m1.mpfchi, m.mpnomp,mpctvin from hosvital.maepab1 m1 inner join hosvital.maepab m on (m.mpcodp=m1.mpcodp)  where mpuced='52916991';
select * from hosvital.ingresomp where mpcedu ='52916991' order by ingcodcam;
-- Pendientes Paraclinicos desde fecha cama-piso
select * from hosvital.hccom51 where hisckey='41320661' and hcfchrord <= '2020-09-22 20:51:47.000000' and hcprcest IN ('O','E');
-- iNGRESO EVOLUCION MEDICA DESPUES DE fecha CAMA-PISO
select * from hosvital.hccom1 where hisckey='41320661' and hisfhorat>='2020-09-22 20:51:47.000000' and fhcindesp='GN' ;
-- iNGRESO EVOLUCION ENFERMERIA DESPUES DE fecha CAMA-PISO
select * from hosvital.hccom1 where hisckey='41320661' and hisfhorat>='2020-09-22 20:51:47.000000' and fhcindesp='EN' ;
-- CANTIDAD FORMULADA/ DESPACHADA
-- Tengo problemas no incluyo los DIRECTOS

select a.hisckey, sum(ifnull(a.FSMCNTSOL,0) ) formulado,  sum(ifnull(a.FSmCntDia,0) ),sum(ifnull(dsp1.dsmcntmov,0)) despachado
from hosvital.FrmSmns a
left  join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.dsctvin1= a.hictvin and dsp1.hiscSEC= a.hiscSEC and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS')
where    a.fsmfhrreg>='2020-09-22 20:51:47.00000' and  a.hisckey='41320661' and a.hictvin=2  and a.hcsmstgr <> 'X'   
group by a.hisckey;

SELECT SUM(FSMCNTSOL) FROM hosvital.FrmSmns WHERE hisckey='41320661' and hictvin=2  and hcsmstgr <> 'X'  AND fsmfhrreg>='2020-09-22 20:51:47.000000' ; 	
SELECT SUM(DSMCNTMOV)  FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41320661'  AND DSCTVIN1=2 AND DSMFHRMOV >= '2020-09-22 20:51:47.000000' AND DSMTPOTRN='DS' ;
SELECT *   FROM HOSVITAL.DSPFRMC1 WHERE  hisckey='41320661'  AND DSCTVIN1=2 AND DSMFHRMOV >= '2020-09-22 20:51:47.000000' AND DSMTPOTRN='DS' ;
SELECT *   FROM HOSVITAL.DSPFRMC WHERE  hisckey='41320661'  AND DSCTVIN=2;

select  DSTIPDES,sum(d.dsmcntdsp),sum(d.dsmcntdes)
from hosvital.dspfrmc d
inner join hosvital.dspfrmc1 d1 on (d1.histipdoc= d.histipdoc and d1.hisckey=d.hisckey and d1.hiscsec=d.hiscsec and d1.msreso = d.msreso AND d1.DSMTPOTRN='DS' )
where d.hisckey='41320661' and d.dsctvin=2 and  d1.DSMFHRMOV >= '2020-09-22 20:51:47.000000'
group by  DSTIPDES ;


-- Paraclinicos despues de cama  - piso
select * from hosvital.hccom51 where hisckey='41320661' and hcfchrord >= '2020-09-22 20:51:47.000000' and hcprcest IN ('O','E');

-- Pendientes x Aplicar
select f.hisckey,sum(f.fsmcntsol) formulo,sum(ifnull(f1.hcsumcns,0)) aplico,sum(dsp1.dsmcntmov) farmacia_despacha,
(
sum(f.fsmcntsol)  - 
sum(ifnull(f1.hcsumcns,0)) 
) No_Aplico
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.hisckey='41320661'  and   f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
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
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.hisckey='41320661'  and   f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
group by  f.hisckey     ;



-- Facturado ?

select * from hosvital.maeate where mpcedu = '41320661' and mactving = 2;
-- Query Consolidado

select  mae.mpnomp pabellon, maepab1.mpnumc as cama,i2.ingfecmop as ingreso_a_cama, i.ingfecadm ingreso_admision,cap.mpcedu documento,cap.mpnomc as paciente,i.ingcsc num_ingreso, i.ingfecegr EGRESO, 
(select case when count(*)  = 0 then 'Verde' else 'Rojo' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord <= i2.ingfecmop

) Pendientes_Otros_Servicios,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.hisccie='1'  and h1.fhcindesp='GN' AND h1.hisfhorat >=i2.ingfecmop

) ingreso_evol_medico,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.hisccie='1' and h1.fhcindesp='EN' AND h1.hisfhorat >=i2.ingfecmop

) ingreso_evol_Enfermeria,
(select  sum(ifnull(a.FSmCntsol,0) )
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X' and  a.fsmfhrreg >= i2.ingfecmop

) Formulado_sin_directos,
(select sum(ifnull(dsp1.dsmcntmov,0))
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso 
) DESPACHADO_con_directos,
(
case when (
(select  sum(ifnull(a.FSmCntsol,0) )
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop

) -
(select sum(ifnull(dsp1.dsmcntmov,0))
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso
)) > 0 then 'Pendiente x Despachar' else 'Despachado' end

) Farmacia,
(select case when count(*)  = 0 then 'Verde' else 'Rojo' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord > i2.ingfecmop

) ApoyosComplementarios,
(

select   case when  (sum(ifnull(f.fsmcntsol,0))  - sum(ifnull(f1.hcsumcns,0))) > 0 then 'Pendiente_x-Aplicar'  when  (sum(ifnull(f.fsmcntsol,0))  - sum(ifnull(f1.hcsumcns,0))) = 0 then 'Al dia'  when  (sum(ifnull(f.fsmcntsol,0))  - sum(ifnull(f1.hcsumcns,0))) <  0 then 'Aplicacion_demas' end
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and
 f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
) Enfermeria_Aplica_Med,

 case when i.inginslc ='S' then 'Alta_Medica' else ' ' end  Alta_Medica,
(
select (sum(dsp1.dsmcntmov)   -  sum(ifnull(f1.hcsumcns,0)) 
) A_Devolver
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and  f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')

) Pendientes_a_devolver,
(select case when count(*) >0 then 'Facturado' else '' end
from hosvital.maeate m
where m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving= i.ingcsc) Facturado,
'' Boleta_Salida

from hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpctvin=i.ingcsc)
inner join hosvital.maepab mae on (mae.mpcodp= maepab1.mpcodp)
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.ingcodpab=maepab1.mpcodp and i2.ingcodcam=maepab1.mpnumc)
where mae.mpclapro=2   and  mae.mpnomp liKe ('%HOSP%')  AND mae.mpnomp NOT LIKE ('%QUIR%') AND mae.mpnomp NOT LIKE ('%REANI%') AND mae.mpnomp NOT LIKE ('%CIRU%')
 -- and i.mpcedu='1013652059' and i.ingcsc= 5
order by  mae.mpnomp , maepab1.mpnumc, i.mpcedu;