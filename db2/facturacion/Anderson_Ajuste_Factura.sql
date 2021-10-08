SELECT mpnfac,prcodi,macscp,mahoncod, mavatp,mpinte,mavlrtot ,fcptpotrn,maesanup  FROM HOSVITAL.MAEATE2 WHERE  mpnfac = 562832 and PRCODI='767401' ; -- AND MAVLRTOT=596245;

select * from hosvital.maeate2;

update hosvital.maeate2
set mavlrtot=500263
 WHERE  mpnfac = 562832 and PRCODI='767401' and maesanup='N' and macscp in (85,86,87,88);

SELECT mpnfac,prcodi,macscp,mahoncod, mavatp,mpinte,mavlrtot ,fcptpotrn,maesanup  FROM HOSVITAL.MAEATE2 WHERE  mpnfac = 562832 and PRCODI='767901' ;


update hosvital.maeate2
set mavlrtot=424204
 WHERE  mpnfac = 562832 and PRCODI='767901' and maesanup='N' and macscp in (95,96,97,98);

select * from hosvital.maeate where mpnfac = 562832;

select * from hosvital.tmpfac1;


select tftdoc, tfcedu,tmctving, tfprc1, tfvatp, tfinte, tfvlrtot , tfestaanu1,tfcscp, tfhnrcod     from hosvital.tmpfac1 where tfcedu='19485067' and tfprc1='767901' and  tfestaanu1 ='N';
select tftdoc, tfcedu,tmctving, tfprc1, tfvatp, tfinte, tfvlrtot , tfestaanu1,tfcscp  , tfhnrcod  from hosvital.tmpfac1 where tfcedu='19485067' and tfprc1='767401' and  tfestaanu1 ='N';

update  hosvital.tmpfac1
set tfvlrtot=500263
 where tfcedu='19485067' and tfprc1='767401' and  tfestaanu1 ='N' and tfcscp in (85,86,87,88);


update  hosvital.tmpfac1
set tfvlrtot=424204
 where tfcedu='19485067' and tfprc1='767901' and  tfestaanu1 ='N' and tfcscp in (95,96,97,98);


