SET SCHEMA HOSVITAL;

SELECT  EMPCOD, CNTVIG,COUNT(*) 
from HOSVITAL.nicuentash 
where          cntvig>=2018
GROUP BY  EMPCOD, CNTVIG;



select * from HOSVITAL.nicuentash where  empcod='03' and cntvig=2020;

/*
INSERT INTO HOSVITAL.nicuentash 
SELECT EMPCOD,2020,CNTCOD,2020,NICNTCOD,NICNTPRC,NICNTACT
from HOSVITAL.nicuentash 
where  --  empcod='03' and  
        cntvig=2019;
*/

select * from HOSVITAL.nicuentash where  EMPCOD='02' AND  cntvig=2020;

SELECT  CNTVIG,EMPCOD,COUNT(*)
FROM   HOSVITAL.nicuentash 
GROUP BY CNTVIG,EMPCOD
ORDER BY EMPCOD,CNTVIG;

select prcvig, count(*)
 from HOSVITAL.maeprov 
group by prcvig;

select * from HOSVITAL.forliq12;

select forlqvig, count(*)
 from HOSVITAL.forliq12
group by forlqvig;


select *  from HOSVITAL.maeprov  where prcodi='471110';


select *  from HOSVITAL.maeprov  where prcvig=2020 ;

SELECT * FROM HOSVITAL.HOJOBL WHERE HOJFCHOBL < '2021-01-01 00:00:00' AND CNTVIG=2020;


SELECT * FROM HOSVITAL.HOJOBL WHERE HOJFCHOBL < '2021-01-01 00:00:00' AND CNTVIG=2021;
SELECT * FROM HOSVITAL.HOJOBL WHERE  CNTVIG=2020 AND hojesthom ='S';
SELECT * FROM HOSVITAL.HOJOBL WHERE  CNTVIG=2021 AND hojesthom ='S';
