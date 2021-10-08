select COUNT(*) from abonos  -- 675845
select COUNT(*) from abonos1 -- 676696

select * from abonos
where abofch >= '2016-12-02' and abonum not in (select abonum from abonos1)


select * from ABONOS where ABONUM in (674524)
select * from ABONOS1 where ABONUM in (674524)

select * from MAEATE4 where abonum in (674524,674954)






begin transaction;
update ABONOS
set AboCnsUlt=1
 where ABONUM in (674524)
 -- commit;

 sp_help abonos1
 sp_help abonos

 begin transaction;
 insert into ABONOS1 
 values('1',	'001',	'TCR',	674954,	1,'','','EF','' ,'' ,'' ,2700,0,'' ,0,'',0,'N',0,'');
 -- ROLLBACK


 select * from entturn
where TurCod=53476



select * from entturn1
where TurCod=53476

BEGIN TRANSACTION,
UPDATE entturn1
SET EntVlrPag=193000
where TurCod=53476
-- COMMIT

SELECT * FROM CIECAJA WHERE CJSCod=6561
SELECT * FROM CIECAJA1 WHERE CCJCod=6561


