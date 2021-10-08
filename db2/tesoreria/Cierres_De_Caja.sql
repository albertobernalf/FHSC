-- Consulta General cuierre

SELECT * 
FROM hosvital.CIECAJa
where ccjcod=2475 ;


-- Consulta por tipo de pago


SELECT * 
FROM hosvital.CIECAJa1   
where ccjcod=2475;





-- La suma total de los tipos d opago

SELECT SUM(CIEVLR) FROM hosvital.CIECAJA1  where ccjcod=2475;

-- VEAMOS LOS TURNOS

select 
* from hosvital.entturn
where ccjcod=2475 order by turcod ;

-- Cuanto sumas los turnos

SELECT SUM(TURVLRTOT)  from  hosvital.ENTTURN where ccjcod=2475; 

select * from hosvital.entturn1
where turcod= 13511;

--* cuantio suma el detalladio de todos lios turbnos de uhn cierre

select  sum(entvlrpag)
 from hosvital.entturn1
where turcod in (select turcod from hosvital.entturn where ccjcod=2475);

-- Query que encadena todo



select c.ccjcod as cierre,c.ccjfch as fecha_cierre,c.ccjvlrttl as valor_cierre,c1.codpago as codpago, c1.cievlr as valor_tipo_pago,
	e.turcod as turno,e.turfchent as fecha_turno,e.turvlrtot as valor_turno,e1.codpago as tipopagoturno,e1.entvlrpag as valortipopagoturno
from hosvital.ciecaja c
inner join hosvital.ciecaja1 c1 on (c1.ccjcod=c.ccjcod)
inner join hosvital.entturn e on (e.ccjcod=c1.ccjcod)
inner join hosvital.entturn1 e1 on (e1.turcod=e.turcod)
where c.ccjcod=2475
order by e.turcod ;


-- Consuklta opara el cierre de caja

select * from hosvital.conciecaj where ccjcod=2475;

----------------------------------------------------------
--- Caso cambio de  tipo depago en entrega de turno
---------------------------------------------------------
select * from hosvital.entturn
where turcod= 13664;  -- 484058.00

UPDATE HOSVITAL.ENTTURN
SET CODPAGO='EF'
where turcod= 13664; 
	

select * from hosvital.entturn1
where turcod= 13664;  -- 484058.00	

INSERT INTO HOSVITAL.entturn1 VALUES('01','001','TUR',13664,'TC',70000,'',0.00);

UPDATE HOSVITAL.ENTTURN1
SET CODPAGO='EF', ENTVLRPAG=414058 -- ESTABA484058.00	
where turcod= 13664; 


select * from hosvital.abonos where abonum = 169765 ;
select * from hosvital.abonos1 where abonum = 169765 ;

select * from hosvital.maeate4 where abonum = 169765;

select * from hosvital.abonos1 where codpago <> 'EF'; -- TC  ,  ABOCODBAN ,ABONUMPAGO= ABOVALPGO=

UPDATE hosvital.abonos1 
SET  CODPAGO='TC', ABOCODBAN='51', ABONUMPGO='3409 '
WHERE ABONUM = 169765;

SELECT * FROM HOSVITAL.BANCO;
SELECT * FROM HOSVITAL.BANCOS; -- 