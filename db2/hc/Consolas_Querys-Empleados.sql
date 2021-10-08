

-- querys  para Consola de Cirugia

select mpcedu, mptdoc,mpnom1,mpnom2,mpape1,mpape2,mpsexo,mpestpac from hosvital.capbas;
select codmed,codcir,cedpac,codesp, estcir , cscing from hosvital.descirmed;
select * from hosvital.consul;
select procircod,mpcedu,mptdoc, proeps , proesta,protipcam, profec, procons from hosvital.procir;
select * from hosvital.maepab1;
select mpcodp, mpnomp, mpclapro from hosvital.maepab;
select * from hosvital.ingresomp;



-- querys  para Consola de Hositalizacion



select hisckey, histipdoc, hiscsec,hcprccod,hcprccns,hcprctpop, hcprcest, hcfchrord, hcfchrap, hctvin51,hcordamb from hosvital.hccom51;
select hisckey,histipdoc,hiscsec,hisccie,hisfhorat , hiscltr  , hcesp from hosvital.hccom1;
select   hisckey,histipdoc,hiscsec , mscodi,msprac,msform,cnccd,fsmfhrreg, hiscansum, hictvin, fsmmsreso from hosvital.FrmSmns;
select hisckey,histipdoc,hiscsec ,msreso, dsmcntdsp,dsmcntsol,dsmfch, dsmcntdes, dsmcntdev, dsctvin, dstipdes              from hosvital.dspfrmc ;
select  hisckey,histipdoc,hiscsec , mscodi,msprac,msform,cnccd,  hcsumcns, asfecpapl, hictvin1                from hosvital.frmsmns1 ;
select hisckey, histipdoc, hiscsec, msreso,dsmtpotrn, dsmcnsmov, dsmfhrmov,  dsmcntmov, dspabellon, dsctvin1   from hosvital.dspfrmc1 ;
select mpnfac,matipdoc, mpcedu, mptdoc, mpclpr,   facfch from hosvital.maeate;
select mpcedu, mptdoc, clapro, ingcsc, ingfecadm,  ingfecegr from hosvital.ingresos;


