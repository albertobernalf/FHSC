SELECT * FROM CIECAJa1   -- POR ESPECIE
where ccjcod=6597


SELECT * FROM CIECAJa -- TOTALES
where ccjcod=6597

-- 4605871 

SELECT SUM(CIEVLR) FROM CIECAJA1  where ccjcod=6597 --15693844.00

SELECT * FROM CIECAJa
where ccjcod=6597  -- EL TOTAL

select * from entturn-- limit 100  -- TURNOS DE UN CIERRRE
where ccjcod=5704

SELECT SUM(TURVLRTOT)  from ENTTURN where ccjcod=5704  -- 15693844.00

select * from entturn1-- limit 100  --	 ESPECIE DE UN TURNO
where turcod= 6597

select turcod,sum(entvlrpag)
 from entturn1-- limit 100
where turcod in 
(46388,
46382,
46381,
46380,
46379,
46378,
46377,
46376,
46375,
46374,
46373
)
group by turcod

select codpago,sum(entvlrpag) from entturn1-- limit 100
where  turcod in 
(46388,
46382,
46381,
46380,
46379,
46378,
46377,
46376,
46375,
46374,
46373
)
group by codpago


select * from entturn-- limit 100
where ccjcod=53476

select codpago,sum(entvlrpag) , sum(turvlrtot)
from entturn1 a, entturn b
where  a.turcod= b.turcod and a.turcod in 
(46388,
46382,
46381,
46380,
46379,
46378,
46377,
46376,
46375,
46374,
46373
)
group by codpago

-- efectivos

select * from entturn1-- limit 100
where  turcod in 
(46388,
46382,
46381,
46380,
46379,
46378,
46377,
46376,
46375,
46374,
46373
) and codpago='EF' AND TURCOD IN (SELECT TURCOD FROM ENTTURN WHERE ccjcod=5704)


SELECT * FROM CIECAJa  -- tot 15390044.00
where ccjcod=5704

SELECT * FROM CIECAJa1 
where ccjcod=5704


select * from entturn1-- limit 100
where ccjcod=5704

-- Querys de arreglo :

begin transacTion;
update CIECAJa1 -- 118000.00
set cievlr=234900
where ccjcod=5704 and codpago='MC'
-- COMMIT;


begin transacTion;  -- Para ekl efectivo
update CIECAJa1 -- 14056144.00
set cievlr=14243044
where ccjcod=5704 and codpago='EF'
-- COMMIT;

begin transacTion;  -- Para el total
update CIECAJa -- 15390044.00
set CCJVLRTTL=15693844 -- ESTABA 15390044.00
where ccjcod=5704 
-- COMMIT;

SELECT * FROM CIECAJa
where ccjcod=5704


SELECT * FROM CIECAJa
where ccjcod=5704  .. E


-------------------------------
-- FIN ARREGLOS
-------------------------------

select * from entturn1-- limit 100
where ccjcod=5704

-- Para encontrar diferencias :

select x.ccjcod,a.codpago, sum(a.entvlrpag),b.cievlr
from entturn x ,entturn1 a, CIECAJa1 b
where x.ccjcod= b.ccjcod and x.ccjcod=5708 and
  x.turcod= a.turcod and a.codpago=b.codpago --and a.turcod
  group by  x.ccjcod,a.codpago,b.cievlr


  select x.ccjcod,a.codpago, sum(a.entvlrpag),b.cievlr
from entturn x ,entturn1 a, CIECAJa1 b
where x.ccjcod= b.ccjcod and x.ccjcod>=5708 and
  x.turcod= a.turcod and a.codpago=b.codpago  
    group by  x.ccjcod,a.codpago,b.cievlr
  HAVING sum(a.entvlrpag) <> b.cievlr
  ORDER  BY CCJCOD

  select * from CIECAJa where ccjcod=5708
  select * from CIECAJa1 where ccjcod=5708
  select * from entturn  where ccjcod=5708

    select * from entturn1  where turcod in (53476) -- 190300
	    select * from entturn  where turcod in (53476) -- 193000


-- Veamos los recibos de caja asociados con la entrega de runo

SELECT * FROM ABONOS  where turcod in (53476) ORDER BY ABONUM -- 23 RECIBOS DE CAJA
SELECT SUM(ABOVLR) FROM ABONOS  where turcod in (53476)  -- 193000


aNd codpago='AE'

    

  SELECT * FROM CIECAJA WHERE ccjcod= 5708
      

  SELECT * FROM CIECAJA1 WHERE ccjcod= 5708




  begin transacTion;  -- Para ekl efectivo
update CIECAJa1 -- 128900.00
set cievlr=189800
where ccjcod=5708 and codpago='AE'
-- COMMIT;

begin transacTion;  -- Para el total
update CIECAJa -- 15390044.00
set CCJVLRTTL=11284057 -- ESTABA 11223157.00
where ccjcod=5708 
-- COMMIT;
