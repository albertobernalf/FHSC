select * from hosvital.movcont3 where doccod='ASA' AND MVCNRO =10;
select * from hosvital.movcont3 where doccod='RSD' AND MVCNRO >=14 AND MVCNRO <=29;

select * from hosvital.movcont3 where doccod='ROI' AND MVCNRO >=328 AND MVCNRO <=350;

select * from hosvital.movcont3 where doccod='NCR' AND MVCNRO >=19 AND MVCNRO <=28;




SELECT count(*) FROM  hosvital.movcont3
 where  MVCFCH >= '2020-02-01 00:00:00' AND  MVCFCH <= '2020-02-29 23:59:59'  AND (DOCCOD,MVCNRO ) NOT IN (SELECT DOCCOD,NIMCNRO FROM HOSVITAL.NIMOVCON1);
