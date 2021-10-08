SELECT * FROM SYSIBM.TABLES;

-- Comparando Objetos tablas y vistas  por esquema

SELECT TABLE_CATALOG,TABLE_SCHEMA,TABLE_TYPE,COUNT(*)
FROM SYSIBM.TABLES
GROUP BY TABLE_CATALOG,TABLE_SCHEMA,TABLE_TYPE
ORDER BY TABLE_CATALOG,TABLE_SCHEMA,TABLE_TYPE;



SELECT * FROM SYSIBM.TABLES_S;
SELECT * FROM SYSIBM.SQLTABLES;
SELECT * FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVITAL' and table_type='TABLE';

SELECT * FROM SYSIBM.SQLTABLES;
SELECT count(*)  FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVITAL' and table_type='TABLE'; -- 1474 Tablas
SELECT COUNT(*) FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVIPRU' and table_type='TABLE'; 
SELECT *  FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVITAL' and table_type='TABLE';
select count(*) from hosvital.hccom1;

SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_PARTITION,PARTITION_NUMBER, NUMBER_ROWS,NUMBER_PAGES,DATA_SIZE,NUMBER_DISTINCT_INDEXES,
SYSTEM_TABLE_SCHEMA,SYSTEM_TABLE_NAME, SYSTEM_TABLE_MEMBER
FROM SYSIBM.SYSPARTITIONSTAT 
--WHERE TABLE_SCHEMA LIKE ('%HOSVITAL%')
---ORDER BY TABLE_NAME
order by data_size desc;

SELECT * FROM SYSIBM.SQLTABLEPRIVILEGES WHERE GRANTEE LIKE ('%ABERNAL%');

-- Comparando privilegios

select table_cat,table_schem,grantee,table_name, count(*)
FROM SYSIBM.SQLTABLEPRIVILEGES 
WHERE GRANTEE LIKE ('%ABERNAL%')
group by table_cat,table_schem,grantee,table_name
order by table_schem;

SELECT * FROM SYSIBM.SQLSCHEMAS;

SET SCHEMA SYSPROC;
SELECT * FROM SYSPROC.SYSAUDIT_END;

SELECT * FROM SYSIBMADM.USER_INFO;

SELECT * FROM QGPL.QSRVSRC;
--Datos del servidor Sistema Operativo

SELECT * FROM SYSIBMADM.ENV_SYS_INFO;  --

-- Almacenamiento

SELECT * FROM SYSIBMADM.USER_STORAGE order by aspgrp, storage_used;

select aspgrp,sum(storage_used) from SYSIBMADM.USER_STORAGE group by aspgrp;

SELECT * FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVITAL' and table_type='TABLE'; 

SELECT * FROM SYSIBM.SQLTABLES where  TABLE_SCHEM='HOSVIPRU' and table_type='TABLE'; 

/*

*SYSBAS	1798472472	
IASP      	771110740	

QSYS	*SYSBAS	null	23237424	
QSECOFR	*SYSBAS	null	99528920	
HOSVITAL	*SYSBAS	null	681806772	
RMAESTRE	*SYSBAS	null	974920384	

ABERNAL	IASP      	null	41489292	
RMAESTRE	IASP      	null	189220764	
HOSVITAL	IASP      	null	536105404	




*/

SELECT ASPGRP,SUM(STORAGE_USED)
FROM SYSIBMADM.USER_STORAGE
GROUP BY ASPGRP;
	

	


-- Usuario 


SELECT * FROM SYSIBMADM.USER_INFO;

SELECT * FROM SYSIBMADM.SYSTEM_VALUE_INFO;

SELECT * FROM SYSIBMADM.FUNCTION_INFO;

SELECT * FROM SYSIBMADM.FUNCTION_USAGE;

SELECT COUNT(*) FROM HOSVITAL.ADMLOG;  -- 13945796	



SELECT  * FROM SYSIBM.SQLPROCEDURES WHERE PROCEDURE_SCHEM='HOSVITAL'; -- Aprox 15

SELECT  * FROM SYSIBM.SQLFUNCTIONS WHERE FUNCTION_SCHEM='HOSVITAL'; -- Aprox 1;

-- Comparando Procedures

select procedure_cat, procedure_schem,count(*)
FROM SYSIBM.SQLPROCEDURES
group by procedure_cat, procedure_schem
order by procedure_cat, procedure_schem ;

-- Comparando Funciones

SELECT  * FROM SYSIBM.SQLFUNCTIONS ORDER BY FUNCTION_SCHEM, FUNCTION_NAME;



SELECT * FROM QPRFDATA.QAPMJOBL;

------------- cONTEO DE oBJETOS
select * from SYSIBM.SYSPARTITIONSTAT  where table_name='ADMLOG';; --Tamaño 3011952640	

SELECT COUNT(*)  -- 1496	
FROM SYSIBM.SYSPARTITIONSTAT 
WHERE TABLE_SCHEMA LIKE ('%HOSVITAL%')
;
SELECT COUNT(*)  -- 1401
FROM SYSIBM.SYSPARTITIONSTAT 
WHERE TABLE_SCHEMA LIKE ('%HOSVITAL')
;

-- Comparando Primarykeys

select * from sysibm.sqlprimarykeys;

select table_cat,table_schem, count(*)
from sysibm.sqlprimarykeys
group by table_cat,table_schem
order by table_cat,table_schem;

-- Comparando Foreignykeys

select * from sysibm.sqlforeignkeys;

select pktable_cat,pktable_schem, count(*)
from sysibm.sqlforeignkeys
group by pktable_cat,pktable_schem
order by pktable_cat,pktable_schem;


-- Comparando Columnas

select * from sysibm.sqlcolumns;

select table_cat,table_schem,count(*)
from sysibm.sqlcolumns
WHERE TABLE_SCHEM='HOSVITAL'
group by table_cat,table_schem; -- 20095 Columnas



select table_cat,table_schem,TABLE_NAME,count(*)
from sysibm.sqlcolumns
WHERE TABLE_SCHEM='HOSVITAL' --AND TABLE_NAME='MAEPRO'
group by table_cat,table_schem,TABLE_NAME
ORDER BY COUNT(*)  DESC; -- 21475


-- Para ver la estructura de una tabla db2

Select *  from Sysibm.sqlcolumns; -- where tbname = 'maeate';  -- No funciona
