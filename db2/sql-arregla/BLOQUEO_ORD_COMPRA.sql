Solicito el favor de revisar las entradas de almacen número 26189,26230,26243y 26293 de la factura de farmasanitas FAr1-1200435 que está siendo
 utilizada por el usuario 80800122, y no ha sido posible causar esta factura.

SELECT * FROM COMPCAB WHERE DOCCOD='CEC' AND ORDENRO = 31709 
31540 31480 y 31418 

-- Consulto la  Orden de Compra


select ordinduso,* from compcab -- LIMIT 10
where ordenro IN (25591            ) -- HOSPITECNICA LTDA

SELECT * FROM PROVEEDOR1
WHERE PRVCOD = '830131869'

begin transaction;
update hosvital.compcab
set ordinduso ='N'
where ordenro =22901          
-- COMMIT
-- ROLLBACK

-- PARA ENTRADAS A ALMACEN :
 25647 a la 26129 

-- Consulto la Entrada a Almacen

		select * from ENTRALM --  LIMIT 1
		where ENTANRO IN 
	--	(36177,36224,36117,36091,36070 )  
		(36011,35940,35878,35855,35836,35788,35780 )                                                                                               )
                                                                                             )

36177  
-- Actualizo el estado de la entrada a Almacen
select * from hosvital.ENTRALM
where   ENTANRO= 41294;

select * from ENTRALM1
where doccod = 'CEC' AND  ENTANRO= 46773



BEGIN TRANSACTION;
UPDATE ENTRALM
SET ENTINDUSO='N',ENTUSUUSO=''
where entanro IN 		
		(46773 )          
-- COMMIT

select * from ENTRALM where entanro IN (24832,24818,24770,24690,24655,24602,24557       )
-- ROLLBACK
-- COMMIT

select * from ENTRALM --  LIMIT 1
where ENTANRO IN 
--(25801 )
(26189,26230,26243, 26293   )



select * from ENTRALM1 --  LIMIT 1
where ENTNROCAU = 116907 IN (23898         )


select * from compcab
where ORDEUSUC= '1072638917' AND ORDINDUSO='S' 


select * from ENTRALM --  LIMIT 1
where ENTUSUUSO='1072638917' AND ENTINDUSO='S'
