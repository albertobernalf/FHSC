select * from hosvital.maeate  where mpnfac =631264;
select * from hosvital.maeate2 where mpnfac =631264;

select *  from hosvital.maeate3 where mpnfac =631264;
select * from hosvital.movcont3 where doccod='FAR' AND  MVCFCH>='2020-06-01 00:00:00';

SELECT * FROM HOSVITAL.MAESUM1 WHERE MSRESO IN (SELECT MSRESO FROM HOSVITAL.MAEATE3 WHERE MPNFAC = 631264);


SELECT * from hosvital.impcue; ---  WHERE IMPCOD='00';

SELECT * FROM HOSVITAL.IMPUESTOS ; -- WHERE IMPCOD='00';

SELECT * FROM HOSVITAL.IMPUEST ; -- WHERE IMPCOD='00';
SELECT * FROM HOSVITAL.IMPSED; --  WHERE IMPCOD='00';
SELECT * FROM HOSVITAL.IMPBSE WHERE IMPCOD='00';

SELECT * FROM HOSVITAL.CUENTAS WHERE CNTVIG>= 2019;

-- me ayudas a que tabla e?


select * from hosvital.maepro where prcodi in (select prcodi from hosvital.maeate2 where mpnfac = 631264);
select * from hosvital.maesum1  where msreso in (select msreso from hosvital.maeate3 where mpnfac = 631264);


SELECT * FROM HOSVITAL.NICUENTASH WHERE  NICNTVIG=2019 ORDER BY CNTCOD;

SELECT M2.DOCCOD,M2.MVCNRO,M2.CNTCOD, M2.CNTVIG,H.CNTCOD, H.NICNTVIG
FROM HOSVIPRU.MOVCONT2 M2
inner JOIN HOSVIPRU.NICUENTASH H ON (h.empcod='01'  and h.empcod= m2.empcod and  H.NICNTVIG = 2020 and  H.NICNTVIG=M2.CNTVIG )
WHERE M2.doccod='FAR' AND M2.MVCNRO=630869
order by  H.CNTCOD ;

;



select * from hosvital.NICUENTAS  where  nicntvig=2020 and nicntcod='2368';
select * from hosvital.NICUENTAS  where  nicntvig=2020 and nicntcod='236805';
select * from hosvital.NICUENTASH where cntcod='23680590' and cntvig = 2020;

select * from hosvital.CUENTAS where cntcod='2368' and cntvig = 2020;
select * from hosvital.CUENTAS where cntcod='236805' and cntvig = 2020;
select * from hosvital.CUENTAS where cntcod='23680590' and cntvig = 2020;

select * from hosvital.CUENTAS WHERE EMPCOD='01';
select * from hosvital.NICUENTAS  WHERE EMPCOD='01';
select * from hosvital.NICUENTASH  WHERE EMPCOD='01';




