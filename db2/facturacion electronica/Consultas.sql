select * from hosvipru.ressev where  restippro='FEC';


-- No exitosa

--  FC, NC , N1, N2, N3, N4

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='FC' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='NC' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N1' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N2' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N3' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N4' AND RESXMLRES LIKE ('%false%')
order by RESTIPPRO,RESTIP,RESNUM;


-- exitosa

--  FC, NC , N1, N2, N3, N4
SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='FC' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='NC' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N1' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N2' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N3' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM  hosvipru.ressev 
where  restippro='FEC'AND RESTIP ='N4' AND RESXMLRES LIKE ('%true%')
order by RESTIPPRO,RESTIP,RESNUM;



--- Query para arreglar datos para REENVIO



SELECT * FROM HOSVIPRU.RESSEV WHERE RESFEC >= '2020-02-01 00:00:00' ;

UPDATE HOSVIPRU.RESSEV SET RESRET='1' WHERE RESTIPPRO='FEC' AND restip='FC' AND RESNUM in ('26','27','28') and resxmlres like ('%false%');

UPDATE HOSVIPRU.RESSEV SET RESRET='0' WHERE RESTIPPRO='FEC' AND restip='FC'  AND RESNUM in ('26','27','28') and resxmlres like ('%false%');
