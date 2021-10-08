

select *  from hosvital.kardex where msreso='0038MQ03';
select *  from hosvital.kardex where msreso='0038MQ03' and bodega = '00';
select *  from hosvital.kardex where msreso='0038MQ03' and bodega = '01';
select *  from hosvital.kardex where msreso='0038MQ03' and bodega = '73';


update hosvital.kardex
set MOVSVLR= - MOVSVLR , movcstp=-movcstp
 where msreso='0038MQ03' and bodega = '00';


update hosvital.kardex
set movcstp=-movcstp,movsuni = - movsuni
 where msreso='0038MQ03' and bodega = '73';


select * from hosvital.ctrcstprm where ccpmsreso='0038MQ03' and ccpbodega='01'  order by ccpfchmov;
select * from hosvital.ctrcstprm where ccpmsreso='0038MQ03' and ccpbodega='00' order by ccpfchmov;
select * from hosvital.ctrcstprm where ccpmsreso='0038MQ03' and ccpbodega='73' order by ccpfchmov;


select *  from hosvital.kardex1 where msreso='0038MQ03' and bodega = '73';


update hosvital.ctrcstprm
set  ccpslduan= - ccpslduan
where ccpcns=7517 and ccpmsreso= '0038MQ03' and ccpdoccod='IEA' AND CCPNRODOC=44207;