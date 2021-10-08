select * from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020  ANd rsmctncon  = '13012501' and trccod='900156264';
select * from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020  ANd rsmctncon  = '13012501' order by trccod;

select * from hosvital.movcont2 where mvcanio=2020 and trccod = '900156264' and cntcod = '13012501';
select * from hosvital.rsmaux where  rsmempcod='01' and  rsmano=2020  ANd rsmctncon  = '13012501' ;

SELECT * FROM HOSVItal.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO =627466;
SELECT * FROM HOSVITAL.MOVCONT3  WHERE DOCCOD='FAR' AND MVCNRO =627466;

-- Reportar
-- Tablas resmcue, movcont2
-- Impresion libro auxiliar a junio/junio  rlibaux11
-- impresion libro auxliar desde enero a julio7  rlibaux16
-- Pantalla de parametros de ejecucion de reporte
-- EN DESCARGAS IMAGE.PNG ES ELCASO RADICADO POR EL USUARIO



SELECT * FROM HOSVITAL.MOVCONT2 WHERE mvcanio=2020 and  trccod='900156264' and cntcod='13012501';

select * from hosvital.rsmaux where rsmempcod='01' and rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501';
select * from hosvital.rsmaux where rsmano=2020 and rsmmes=6 order by rsmctncon;  and rsmempcod  like ('%13012501%');

select * from hosvital.movcont2 where DOCCOD='FAR' AND MVCNRO='627466';
select * from hosvital.movcont2 where DOCCOD='FAD' AND MVCNRO='1595';

SELECT * from hosvital.hojobl where hojnumobl='627466';

select * from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501' ORDER BY TRCCOD;
select * from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501' ORDER BY TRCCOD;



select *  from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501';
select SUM(RSMDEB),SUM(RSMCRE) from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501';
select *  from hosvital.resmcue where  rsmempcod='01' and  rsmano=2020 and rsmmes=6 and rsmctncon  = '13012501' AND (RSMCRE>  0.0 OR RSMDEB > 0.0);


SELECT * FROM HOSVItal.MOVCxc WHERE  mccnumobl ='627466';
