

SELECT T1.BODEGA, T2.AUsrDsc, T1.EMPCOD, T1.AUsrId 
FROM (BODUSR T1 INNER JOIN ADMUSR T2 ON T2.AUsrId = T1.AUsrId) 
WHERE T1.EMPCOD = '01' and 
T1.BODEGA = '09' --and T1.AUsrId = $3
 ORDER BY T1.EMPCOD, T1.BODEGA, T1.AUsrId

-- Pjo ampliar este script para que la consulta traiga los nombres y apellidos de los pacientes.
-- Consulto usuarios con acceso a bodega especifica
select * from bodusr
where bodega = '08'
order by ausrid

insert into bodusr values (1,'09',52218246);

select * from bodusr where ausrid = '52218246'

insert into bodusr values (1,'09',52188994);
insert into bodusr values (1,'09',40990877);
insert into bodusr values (1,'09',1075654823);

select * from bodusr
where ausrid = '20986080'

begin transaction;
delete from  bodusr
where ausrid = '20986080' and bodega ='14'
-- ROLLBACK
-- commit
