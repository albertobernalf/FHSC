select * from hosvital.punrutusu where punrutusun like ('%RUGELE%');
select * from hosvital.punrutusu1 WHERE PUNRUTUSU ='39578953' ORDER BY PUNRUTCOD ; --  where punrutusun like ('%RUGELE%');

INSERT INTO hosvital.punrutusu1 
SELECT EMPCOD,MCDPTO,'RAD',PUNRUTUSU,MENNIT,PUNRUTUDO,PUNRUTUDE
FROM hosvital.punrutusu1 
WHERE PUNRUTUSU ='39578953' AND PUNRUTCOD = 'MC' AND MENNIT NOT IN (SELECT P.MENNIT FROM hosvital.punrutusu1 P  WHERE p.PUNRUTUSU ='39578953' and PUNRUTCOD='RAD')  ;