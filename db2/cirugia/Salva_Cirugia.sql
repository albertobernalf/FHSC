-- Query's de actualizacion de profec a partir de la cedula

select * from hosvital.procir where mpcedu='80071935';

select p.procircod,p.mpcedu, p.profsep, p.profec,mae.prcodi,mae.prnomb
 from hosvital.procir p
left join hosvital.procir1 p1 on (p1.procircod=p.procircod)
left join hosvital.maepro mae on (mae.prcodi=p1.crgcod)
where p.mpcedu='1077030';

update hosvital.procir set profec='2020-06-26' where procircod=124761	
		
;

--  Cero En hosvipru generar el insert

-- Query de Exportacion

select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('INSERT INTO hosvital.cir_procir_bak  values (', procircod) ,','),''''), cast(profsep as character(10))),''''),','),''''), cast(profec as character(10))),''''),');')
 from hosvipru.procir 
where profsep >= '2020-06-12'  and profsep <= '2020-06-25'
order by  procircod;

-- Primero 

delete from hosvital.cir_procir_bak;

SELECT COUNT(*) FROM hosvital.cir_procir_bak; -- 328

-- Segundo los INSERT A hosvital.cir_procir_bak

select procircod, mpcedu,prohsep,profsep, pfchrcnf, profec, profecf ,proesta  from hosvital.procir where profsep >= '2020-06-12' and profsep <= '2020-06-25'  and profec is null;
select procircod, mpcedu,prohsep,profsep, pfchrcnf, profec, profecf, proesta  from hosvital.procir where profsep >= '2020-06-26' ;

-- Ojo subir los  INSERT AQUI

-- Tercero Contar cuantos se van a subir

select count(*) from hosvital.cir_procir_bak; -- deben ser 328

select count(*)   from hosvital.procir where profsep >= '2020-06-12' and profsep <= '2020-06-25'  and profec is null; -- OPS 319  -- deben ser 320

SELECT  procircod, prohsep,profsep, pfchrcnf, profec, profecf, proesta FROM 	 hosvital.procir where profsep >= '2020-06-12' and profsep <= '2020-06-25'  and profec is NOT null;

/*
124440	08:12:25	2020-06-12	0001-01-01 00:00:00.000000	2020-06-26	2020-06-26	1	
124697	15:04:28	2020-06-23	2020-06-26 13:28:00.000000	2020-06-26	2020-06-26	4	
124735	15:08:24	2020-06-24	2020-06-26 08:06:19.000000	2020-06-26	2020-06-26	4	
124748	09:59:10	2020-06-25	2020-06-26 08:03:10.000000	2020-06-26	2020-06-26	4	
124751	10:03:05	2020-06-25	2020-06-26 11:13:30.000000	2020-06-26	2020-06-26	4	
124754	10:39:31	2020-06-25	0001-01-01 00:00:00.000000	2020-06-26	2020-06-26	1	
124755	11:09:46	2020-06-25	2020-06-26 17:34:17.000000	2020-06-26	2020-06-26	4	
124759	12:08:39	2020-06-25	2020-06-26 17:30:10.000000	2020-06-26	2020-06-26	2	


*/
select procircod, prohsep,profsep, pfchrcnf, profec, profecf, proesta   from hosvital.procir where profsep >= '2020-06-12' and profsep <= '2020-06-25'  and profec is null;
	
-- deben ser 319 registros Actualizacion Masiva

update hosvital.procir a
set a.profec =(select b.profec from hosvital.cir_procir_bak b where b.procircod=a.procircod)
where a.profsep >= '2020-06-12' and a.profsep <= '2020-06-25'  and a.profec is null; 

