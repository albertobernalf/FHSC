select * from hosvital.maemed where mmcodm='MG743';
select * from hosvital.maemed6 where mmcodm='MG743';

select * from hosvital.maemed1 where mmcedm= '1047454672';
select * from  hosvital.hccom1;


select * from hosvital.hccom1  where hisckey= '20102399' ;

SELECT hisckey,hisfhorat,hiscmmed,hcesp,hiscfcon,hisfing, hisfsal, hischora FROM hosvital.hccom1 where hisckey= '20102399' order by hiscsec;