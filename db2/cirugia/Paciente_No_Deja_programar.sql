SELECT * FROM HOSVITAL.PROCIR WHERE MPCEDU = '1077030' ORDER BY PROFEC;

select * from hosvital.procir1 WHERE PROCIRCOD  in (125371,125688);
select * from hosvital.procir2 WHERE PROCIRCOD  in (125371,125688);
select * from hosvital.procir WHERE PROCIRCOD  in (125371,125688);

update  hosvital.procir 
set PROTPANST='G'
 WHERE PROCIRCOD=125371	;

SELECT procircod,mpcedu,profec, profecf, proctvin  , proesta, profecf , PROCONS  FROM HOSVITAL.PROCIR WHERE MPCEDU = '1077030' ORDER BY PROFEC;

update  hosvital.procir1 
set medcod='MG488',ESPCCOD=750,CRGHNRCI='01'
 WHERE PROCIRCOD=125371	;


SELECT procircod,mpcedu,profec, profecf, proctvin  , proesta, PROCONS  FROM HOSVITAL.PROCIR WHERE  procircod in (125371,125688);
select * from hosvital.procir1 WHERE procircod in (125688,125371);
select * from hosvital.procir2 WHERE procircod in (125688,125371);


SELECT * FROM HOSVITAL.TURQUI WHERE  PROCIRCOD  in (125371,125688);
SELECT * FROM HOSVITAL.TURQUI1 WHERE TUQCNS IN (99136	, 99131	);


INSERT INTO  HOSVITAL.TURQUI1 VALUES ('01','001','RTQ',99136	,'592103-1',1);


SELECT * FROM HOSVITAL.DESCIRMED WHERE CODCIR=125371	;
SELECT  FROM HOSVITAL.DESCIRMED1 WHERE CODCIR=125371	;

SELECT *  FROM HOSVITAL.PROCIR WHERE  procircod in (125371,125688);

select *  from hosvital.consul   where consdet  LIKE  ('%SAL%');


update hosvital.procir
set proesta=1, profec='2020-08-03', profecf='2020-08-03', prohori='19:30:00' , prohorf='20:00:00', PROCONS=132
where procircod=125371;

-- Paciente No se deja programar


select * from hosvital.procir WHERE PROCIRCOD  in(125371,126039);
select *  from hosvital.consul   where consdet  LIKE  ('%SAL%');

update hosvital.procir
set PROTPANST='G', proesta=1, profec='2020-08-14', profecf='2020-08-14', prohori='01:30:00' , prohorf='02:00:00', PROCONS=133
where procircod=126039;



select * from hosvital.procir1 WHERE PROCIRCOD  in (125371,126039);

update  hosvital.procir1 
set medcod='ME008',ESPCCOD=143,CRGHNRCI='01'
 WHERE PROCIRCOD=126039	;

select * from hosvital.procir2 WHERE PROCIRCOD  in (125371,126039);

SELECT * FROM HOSVITAL.TURQUI WHERE  PROCIRCOD  in (125371,126039);

SELECT * FROM HOSVITAL.TURQUI1 WHERE TUQCNS IN (99136	, 99131	);


INSERT INTO  HOSVITAL.TURQUI1 VALUES ('01','001','RTQ',99136	,'862004',1);