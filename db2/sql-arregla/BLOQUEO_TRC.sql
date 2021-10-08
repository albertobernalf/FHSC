	-- Paso O : Soliciutud
--39706
-- trc en 
--TRC 20437
--Solicito su amable colaboración, en desbloquear el TRC 13803,al intentar detallarlo aparece, no puede modificar el recibo, el usuario 
--35199663 lo esta modificando.
-- 36136
-- Paso No 1 Busca el asiento contable TRC 

select * from movcont3
where DOCCOD = 'TRC' AND  mvcnro IN (27054   ) 

-- SERVICE
50765
-- Paso No 2 Busca el comprobante
41116
select --mvbnrocmp,mvestrec
41168
41234
41718
54481
54766


53

57312
73812
SELECT *
from movban
where mvbnrocmp IN ( 27364,27656,27657  )

select * from movcont2
where mvcnro= 9908 AND DOCCOD = 'TRC'

-- Paso No 3 :  Actualiza el estado, liberando TRC

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA' AND MVBNROCMP IN ('6999','7054');

BEGIN TRANSACTION;
UPDATE movban
SET MVESTREC='L',MVESTUSU=''
where docCod='TRC' AND mvbnrocmp IN ( 29132, 29182, 29153 , 29184 )
-- ROLLBACK;
-- 	COMMIT


-- QUERY QUE ME DEECTE BLOQUEOS

SELECT MVESTUSU,mvestrec,*
 from movban
where MVBFCH >= '2016-02-01' AND MVESTUSU <> ''


-- Se puede validar desde el fronmt-end de hosvital financiero

select * from docucon where doccod='TRI'

-- DOCUMENTO TRI:

select * from movcont3
where DOCCOD = 'TRI' AND  mvcnro IN (11   ) 

BEGIN TRANSACTION;
UPDATE movban
SET MVESTREC='L',MVESTUSU=''
where docCod='TRI' AND mvbnrocmp IN ( 11       )
-- ROLLBACK;
-- COMMIT

---
SELECT *
from movban
where mvbnrocmp IN (6328  );

-------------------------------------
-- 

