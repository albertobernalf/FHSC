select * from hosvipru.cuentas;
select empcod,cntvig,count(*)  from hosvipru.cuentas where cntest='S' and cntvig >=2020 group by empcod, cntvig order by cntvig;

/*
2018	5126	
2019	5964	
2020	5973	
2021	3515	

niif

2018	5206	
2019	6026	
2020	6036	
2021	3606	



*/

select * from hosvital.nicuentas;
select nicntvig,count(*)  from hosvipru.nicuentas group by nicntvig order by nicntvig;

SELECT PRCVIGTRN, COUNT(*) FROM HOSVIPRU.CHEQUERA GROUP BY PRCVIGTRN;
SELECT PRCVIG, COUNT(*)  FROM HOSVIPRU.MAEPROV GROUP BY PRCVIG;

SELECT * FROM HOSVIPRU.FORLIQ;

-- Produccion :

select empcod,cntvig,count(*)  from hosvital.cuentas where cntest='S' and cntvig >=2020 group by empcod, cntvig order by cntvig;

select empcod,nicntvig,count(*)  from hosvital.nicuentas group by empcod,nicntvig order by empcod,nicntvig;


-- Asistenciales

select prcvig, count(*) from hosvital.maeprov group by prcvig order by prcvig;
