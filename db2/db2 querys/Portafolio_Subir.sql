CREATE TABLE HOSVITAL.COP_PORTAR1 (PTCODI CHARACTER	(3)	,
		PRCODI	CHARACTER	(9)	,
		TRFCOD	CHARACTER	(5)	,
		PTPORC	DECIMAL	(5,2)	,
		PTAPCO	DECIMAL	(1,0)	,
		PTAPMO	DECIMAL	(1,0)	,
		FORLIQCOD	CHARACTER	(3)	,	
		PTCNTUVR	DECIMAL	(8,0)                       ,
		FCTOCOD            CHARACTER	(2)                           ,	                    	                    
		PTRECARG	CHARACTER	(1)	,
		PTPORREC	DECIMAL	(5,2),	
		PTFACAGR	CHARACTER	(1),	
		PTVALLIB	CHARACTER	(1),	
		PTINDPAQ	CHARACTER	(1),	
		PTREQAUT	CHARACTER	(1),	
		PTINDEXC	CHARACTER	(1),	
		PTPESPRO	DECIMAL	(4,0)  ,	
		PTVLRRED	CHARACTER	(1  )           ,	
		PTOBSPRO	CHARACTER	(240  )           ,	
		PTVALSUS	DECIMAL	(17,2)	,
		PTCARAPRO	DECIMAL	(4,0)	,
		PTTIPAPRO	CHARACTER	(1)	,
		PTEDMNT	CHARACTER	(1)	,
		PTEDAMAX	DECIMAL	(3,0)	,
		PTEDMXT	CHARACTER	(1)	,
		PTTOPVAL	DECIMAL	(17,2)	,
		PTTOPCNT	DECIMAL	(17,2)	,
		PTCNTPER	DECIMAL	(1,0)	,
		PTEDAMIN	DECIMAL	(3,0)	,
		PTPRCSUB	DECIMAL	(5,2)	,
		PTREVAM	CHARACTER   (1))  	       ;            

SELECT * FROM HOSVITAL.COP_PORTAR1; 	

select  count(*) from hosvital.portar1 where ptcodi='002';      

select  count(*) from hosvital.cop_portar1 ;

insert into hosvital.cop_portar1
select  * from hosvital.portar1 where ptcodi='002';     

delete  from  hosvital.cop_portar1;
              