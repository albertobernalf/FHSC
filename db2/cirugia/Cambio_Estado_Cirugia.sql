select procircod,proesta, profec, a.*
 from hosvital.procir a
where profec >= '2020-03-01'  and procircod in (121988,121998,121964)
order by procircod;;


-- 1 = reservada
-- 2 = Confirmada
-- 3 = cancelada
-- 4 = Realizada
-- 6 = pendiente

select procircod,proesta, profec
 from hosvital.procir
where profec >= '2020-03-01'  and procircod in (129269);
-- 1070587757

SELECT *  FROM  hosvital.procir where procircod in (124843 );

SELECT *  FROM  hosvital.TURQUI  where procircod in (124843 );

update hosvital.procir
set proesta='2' -- , PROCONS=1
where procircod in (130253 );


update hosvital.procir
set proctvin=1
where procircod in (124843 );
SELECT * FROM HOSVITAL.CONSUL;

SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU='5633740';

select * from hosvital.ingresos where mpcedu = '5633740';

select * from hosvital.descirmed where codcir in (124843 );
select * from hosvital.descirmed1;  --  where codcir in (124843 );
SELECT *  FROM  hosvital.procir where procircod in (124843 );
SELECT *  FROM  hosvital.procir1 where procircod in (124843 );
SELECT *  FROM  hosvital.procir2 where procircod in (124843 );

SELECT * FROM HOSVITAL.MAEATE WHERE MPCEDU='5633740';


update   hosvital.descirmed
set  cscing=1
 where codcir in (124843 );