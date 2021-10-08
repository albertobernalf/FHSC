SELECT * FROM HOSVITAL.REPBALCON WHERE REPBALMED=7  AND EMPCOD='01' ORDER BY REPBALMED,REPTOTCOD,REPSUBCOD,REPCONCOD;
SELECT * FROM HOSVITAL.REPBALCONT;

SELECT * FROM HOSVITAL.REPBALCO1;
select * FROM HOSVITAL.REPBALCON  WHERE REPBALMED=9  AND EMPCOD='01';

SELECT * FROM HOSVITAL.REPBALCONT where empcod='01' and repbalnum=1 and repbalni='N';
SELECT * FROM HOSVITAL.REPBALCO1   where empcod='01' and repbalnum=1  and repbalmed=9 ;
select * from hosvital.repbaltot where repbalnum=1 and repbalmed=9 order by reptotcod;
select * from hosvital.repbalgrp where empcod = '01'  order by repbalnum,repbalmed;
select * from hosvital.repbalgrp where empcod = '01' and repbalnum=1 and repbalmed=9; ;
select * from hosvital.repbaltot where empcod='01' and  repbalnum=1   order by repbalnum,repbalmed;
select * from hosvital.repbalsub where empcod = '01' and repbalnum=1 and repbalmed=9; ;

-- seria

update  hosvital.repbalsub set repbalnum=12  where empcod = '01' and repbalnum=1 and repbalmed=9;  -- 7filas
update  HOSVITAL.REPBALCO1 set repbalnum=12  where empcod='01' and repbalnum=1 and repbalmed=9;  -- 2304
update  HOSVITAL.REPBALCON set repbalnum=12  where empcod='01' and repbalnum=1 and repbalmed=9;  -- 52
update  hosvital.repbaltot  set  repbalnum= 12 where empcod = '01' and repbalnum=1 and repbalmed=9;
update hosvital.repbalgrp set repbalnum= 12 where empcod = '01' and repbalnum=1 and repbalmed=9; 
update HOSVITAL.REPBALCONT set repbalnum=12   where empcod='01' and repbalnum=1 and repbalmed=9;

 



update  HOSVITAL.REPBALCON set repbalnum=3  where empcod='01' and repbalnum=1 and repbalmed=9;  -- 52


-- la devuelta:
  update  hosvital.repbalsub set repbalnum=1  where empcod = '01' and repbalnum=12 and repbalmed=9;  
update  HOSVITAL.REPBALCO1 set repbalnum=1  where empcod='01' and repbalnum=12 and repbalmed=9;  -- 2304
update  HOSVITAL.REPBALCON set repbalnum=1  where empcod='01' and repbalnum=12 and repbalmed=9;  --52
 update HOSVITAL.REPBALCONT set repbalnum=1   where empcod='01' and repbalnum=12 and repbalmed=9;
update hosvital.repbalgrp set repbalnum= 1 where empcod = '01' and repbalnum=12 and repbalmed=9 ;
 update  hosvital.repbaltot             set  repbalnum= 1 where empcod = '01' and repbalnum=12 and repbalmed=9;




------- Fin actualiza

SELECT  * 
FROM HOSVITAL.REPBALCONT 
WHERE EMPCOD='01' AND REPBALNI='N'
ORDER BY REPBALMED;


SELECT A.EMPCOD, A.REPBALMED, A.REPBALNUM, A.REPBALDSC1,B.CNTVIG,B.REPTOTCOD,B.REPSUBCOD,B.REPCONCOD,B.CNTCOD
FROM HOSVITAL.REPBALCONT A
INNER JOIN HOSVITAL.REPBALCO1 B ON (B.EMPCOD=A.EMPCOD AND B.REPBALMED=A.REPBALMED AND B.REPBALNUM=A.REPBALNUM)
WHERE A.EMPCOD='01' AND A.REPBALNI='N' AND B.CNTVIG=2019
ORDER BY A.EMPCOD, A.REPBALMED, A.REPBALNUM, A.REPBALDSC1,B.CNTVIG,B.REPTOTCOD,B.REPSUBCOD,B.REPCONCOD,B.CNTCOD;
