select m.mmnomm as medico,maesum1.msreso as cod_med, maesum1.msnomg as medicamento, count(*) TOTAL
 from hosvital.hccom1 h
 inner join hosvital.frmsmns f on (f.histipdoc=h.histipdoc and f.hisckey=h.hisckey and f.hiscsec=h.hiscsec)
 inner join hosvital.maemed1 m on (m.mmcodm=h.hiscmmed)
 inner join hosvital.maesum1 maesum1 on (maesum1.msreso = f.fsmmsreso)
 inner join hosvital.capbas c on (c.mptdoc=h.histipdoc and c.mpcedu= h.hisckey) 
where h.hisfhorat>='2021-10-01 00:00:00' and h.hisfhorat<='2021-10-02 23:59:59' 
group by m.mmnomm ,maesum1.msreso , maesum1.msnomg;

select * from hosvital.salinvt where salano>= 2021;
select * from hosvital.smovinv  where  SDOCNRO= '17067840' AND SMVTFOLIO=573;


select * from hosvital.hccom33;
select * from hosvital.hccom9;

SELECT * FROM HOSVITAL.DSPFRMC1;
SELECT * FROM HOSVITAL.DSPFRMC;

SELECT * FROM HOSVITAL.HCCOM6 WHERE HISCKEY ='17067840' ; -- AND HISCSEC = 573;

SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY ='17067840' AND HISCSEC = 573;

SELECT * FROM HOSVITAL.MOVINV4 WHERE MVTODOCPAC = '17067840';
SELECT * FROM HOSVITAL.MOVINV3 M3  WHERE (M3.DOCCOD, M3.DOCNRO ) IN (SELECT M4.DOCCOD, M4.DOCNRO FROM HOSVITAL.MOVINV4 M4 WHERE M4.MVTODOCPAC = '17067840');

SELECT * FROM HOSVITAL.MOVINV4 WHERE MVTODOCPAC = '17067840' AND MSRESO IN ('0001MQ37','0002MQ82','0005MQ31','0017MQ82') ORDER BY FCHMVT; -- ASA : 08/09/10/11
SELECT * FROM HOSVITAL.MOVINV4 WHERE DOCCOD='ASA' AND DOCNRO=9267310;

SELECT * FROM HOSVITAL.KARDEX1 WHERE DOCTIP='ASA' AND DOCNRO IN (9267308,9267309,9267310,9267311);
SELECT * FROM HOSVITAL.DSPFRMC WHERE HISCKEY='17067840' AND HISCSEC = 573;
SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY='17067840' AND HISCSEC = 573; -- DSMTIPDSP

SELECT * FROM HOSVITAL.DSPFRMC1 WHERE HISCKEY='17067840' AND DSMTIPDSP ='P'; 

select m.mmnomm as medico,maesum1.msreso as cod_med, maesum1.msnomg as medicamento, count(*) TOTAL
 from hosvital.hccom1 h
 inner join hosvital.DSPFRMC1 dsp on (dsp.histipdoc=h.histipdoc and dsp.hisckey=h.hisckey and dsp.hiscsec=h.hiscsec and dsp.DSMTIPDSP ='P)
 inner join hosvital.maemed1 m on (m.mmcodm=h.hiscmmed)
 inner join hosvital.maesum1 maesum1 on (maesum1.msreso = dsp.msreso)
 inner join hosvital.capbas c on (c.mptdoc=h.histipdoc and c.mpcedu= h.hisckey) 
where h.hisfhorat>='2021-10-01 00:00:00' and h.hisfhorat<='2021-10-02 23:59:59' 
group by m.mmnomm ,maesum1.msreso , maesum1.msnomg;


