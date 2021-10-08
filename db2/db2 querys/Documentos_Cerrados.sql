select * from hosvital.movcont3  
where  doccod='RC' AND MVCNRO IN (1409);


SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RC' AND MVBNROCMP=1409;
SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RC' AND MVBNROCMP=1409;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='RC' AND MVBNROCMP=1409;
SELECT * FROM HOSVITAL.MOVANT  WHERE MVANTDOC='RC';

SELECT * FROM HOSVITAL.MOVCXC WHERE DOCCOD='RC'; -- AND MVCXCNRO=    1409;  --select * from hosvital.maeate where mpnfac = 565973; 

update  hosvital.movcont3
set  mvcest ='C'
WHERE  EMPCOD='02' AND doccod='RC' AND MVCNRO IN  (1409)  and mvcest='S';

select * from hosvital.movcont3 where doccod='LAN' AND MVCNRO=1613;


update  hosvital.movcont3
set  mvcest ='S'
where  doccod='ACP' AND MVCNRO IN ( 1926) and mvcest='C';


select * from hosvital.movcont2  
where  doccod='CEG' AND MVCNRO IN  (31699, 30405);

select * from hosvital.MOVCONT3   where  DOCCOD = 'CA' AND MVCNRO  IN ( 7692);  
select * from hosvital.MOVCONT3   where  DOCCOD = 'NCR' AND MVCNRO  IN ( 18285,18261,18262) ;  -- and mvcest='C';
select * from hosvital.NIMOVCON1   where  DOCCOD = 'ACP' AND NIMCNRO IN  (1926);  
select * from hosvital.NIMOVCON1   where  DOCCOD = 'NCR' AND NIMCNRO IN ( 18285,18261,18262);   

update  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where doccod='ACP' and NIMCNRO IN (1926) and NIMC1EST='C';

update  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where doccod='LAN' and NIMCNRO IN (1613) and NIMC1EST='C';


select * from hosvital.NIMOVCON1   where  DOCCOD = 'RC' AND NIMCNRO IN  (1409);  
select * from hosvital.NIMOVCON2   where  DOCCOD = 'RC' AND NIMCNRO IN  (1409);  
