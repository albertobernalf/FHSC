SELECT  HOSVITAL.REQUISICI.DOCCOD  AS Doc_Requisicion, HOSVITAL.REQUISICI.REQNRO AS Numero_Requisicion , HOSVITAL.REQUISI1.REQITEM ,  HOSVITAL.REQUISI1.REQULTEST AS Estado_Item, HOSVITAL.REQUISICI.REQFCH AS Fecha_Requisicion, CASE  HOSVITAL.REQUISICI.REQEST  WHEN  'A' THEN 'A-PROCESADA' WHEN 'N' THEN 'N-NEGAD' WHEN 'P' THEN 'P-PARCIALES' WHEN 'S' THEN 'S-SOLICITADA' WHEN 'X' THEN 'X-ANULADA' ELSE 'OTRO ESTADO' END AS Estado_Requisicion, HOSVITAL.REQUISICI.REQOBS AS Observacion, HOSVITAL.REQUISICI.REQUSUCOD as Cod_Usuario_Requisicion,  HOSVITAL.ADMUSR.AUSRDSC as Usr_Requisicion, HOSVITAL.REQUISICI.RECNCCOD as Centro_Costo_Requisicion , HOSVITAL.CENCOST.CNCDSC as Descr_Centr_Cost,  HOSVITAL.REQUISI1.REQCANAPR as Cant_Aprobada,  HOSVITAL.REQUISI1.REQCANENV as Cantidad_Enviada, HOSVITAL.REQUISI1.REQCANNEG  as Cantidad_Negada, HOSVITAL.REQUISI1.MSRESO As Codigo_Suministro ,  HOSVITAL.REQUISI1.REQNOMPRO AS  Descripcion_Suministro , HOSVITAL.MAESUM1.MSGRPCOD as Grupo_Suministro,    HOSVITAL.GRUPOS.GRPDSC as Descr_Grupo_Suministro , HOSVITAL.COMPCAB2.DOCCOD AS Codigo, HOSVITAL.COMPCAB2.ORDENRO as Numero_OC ,  HOSVITAL.COMPCAB2.ORDECNT AS Cantidad_OC, HOSVITAL.COMPCAB2.ORDEVLRU AS Valor_Unitario,   HOSVITAL.COMPCAB2.ORDEVLRI as Porcentaje_IVA ,    HOSVITAL.COMPCAB.ORDEFCH as Fecha_OC , HOSVITAL.TERCEROS.TRCCOD as Proveedor, HOSVITAL.TERCEROS.TRCRAZSOC as Descr_Proveedor ,  HOSVITAL.COMPCAB2.ORDECNT as Cant_Ordenada, HOSVITAL.COMPCAB2.ORDERCB as Cant_Recibida, HOSVITAL.COMPCAB2.ORDETTAL as Total_Orden_SinIVA, HOSVITAL.COMPCAB2.ORDETOTI as Total_Iva,   HOSVITAL.COMPCAB2.ORDETOTD as Total_Descuento,   (HOSVITAL.COMPCAB2.ORDETTAL + HOSVITAL.COMPCAB2.ORDETOTI - HOSVITAL.COMPCAB2.ORDETOTD ) as TOTAL ,  HOSVITAL.COMPCAB.ORDTIPCPLZ as Plazo_Pago, HOSVITAL.COMPCAB.ORDTIPDPLZ as Desc_Plazo_Pago,  CASE HOSVITAL.COMPCAB.ORDEEST WHEN 'A' THEN 'A-ANULADA' WHEN 'E' THEN 'E-ENTRADA_ALMACEN'  WHEN 'F' THEN 'F-FACTURADA' WHEN 'G' THEN 'G-GENERADA' WHEN'O' THEN 'O-PENDIENTE' WHEN  'P' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'S' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'Y' THEN 'RECIBIDO_ITEMS_CANCELADOS'  END as Estado_OC,   HOSVITAL.COMPCAB.ORDEUSUC AS Usr_OC , ADMUSR111.AUSRDSC as Dscr_Usu_OC   ,  HOSVITAL.REQUISI1.REQENVCMP  AS Enviado_Compras, (HOSVITAL.REQUISI1.REQCANAPR  -  HOSVITAL.COMPCAB2.ORDECNT -  HOSVITAL.REQUISI1.REQCANNEG) AS Pendiente_Por_Comprar  ,  MIN(CMB.FCHA)AS Fecha_Envio_Compra 
FROM HOSVITAL.REQUISICI 
 LEFT JOIN HOSVITAL.REQUISI1 ON  HOSVITAL.REQUISI1.REQNRO = HOSVITAL.REQUISICI.REQNRO  
LEFT JOIN  HOSVITAL.ADMUSR ON (HOSVITAL.ADMUSR.AUSRID = HOSVITAL.REQUISICI.REQUSUCOD) 
 LEFT JOIN  HOSVITAL.CENCOST ON HOSVITAL.REQUISICI.RECNCCOD = HOSVITAL.CENCOST.CNCCOD
 LEFT JOIN  HOSVITAL.MAESUM1 ON (HOSVITAL.REQUISI1.MSRESO =  HOSVITAL.MAESUM1.MSRESO)
  INNER JOIN HOSVITAL.GRUPOS ON (HOSVITAL.GRUPOS.GRPCOD = HOSVITAL.MAESUM1.MSGRPCOD) 
LEFT JOIN HOSVITAL.COMPCAB2 ON  (HOSVITAL.COMPCAB2.ORDREQNRO =HOSVITAL.REQUISI1.REQNRO ) AND (HOSVITAL.COMPCAB2.MSRESO=HOSVITAL.REQUISI1.MSRESO ) and (HOSVITAL.COMPCAB2.ORDREQITM = HOSVITAL.REQUISI1.REQITEM)
 LEFT JOIN HOSVITAL.COMPCAB ON  (HOSVITAL.COMPCAB2.DOCCOD = HOSVITAL.COMPCAB.DOCCOD ) AND (HOSVITAL.COMPCAB2.ORDENRO = HOSVITAL.COMPCAB.ORDENRO) 
LEFT  JOIN HOSVITAL.TERCEROS ON (HOSVITAL.TERCEROS.TRCCOD = HOSVITAL.COMPCAB.PRVCOD) LEFT  JOIN  HOSVITAL.ADMUSR AS ADMUSR111 ON (  ADMUSR111.AUSRID = HOSVITAL.COMPCAB.ORDEUSUC) 
LEFT JOIN HOSVITAL.REQUISITMP AS CMB ON CMB.DOCCOD = HOSVITAL.REQUISI1.DOCCOD AND CMB.REQNRO = CMB.REQNRO AND HOSVITAL.REQUISI1.REQITEM = CMB.REQITEM AND HOSVITAL.REQUISI1.MSRESO = CMB.MSRESO 
WHERE  (((DATE(HOSVITAL.REQUISICI.REQFCH)>= '2020-01-01') AND (DATE(HOSVITAL.REQUISICI.REQFCH)<= '2020-08-31'  ) )) AND HOSVITAL.REQUISI1.REQENVCMP = 'S'  
/*
GROUP BY   HOSVITAL.REQUISICI.DOCCOD , HOSVITAL.REQUISICI.REQNRO , HOSVITAL.REQUISI1.REQITEM ,  HOSVITAL.REQUISICI.REQFCH , HOSVITAL.REQUISICI.REQEST ,   HOSVITAL.REQUISICI.REQOBS,  HOSVITAL.REQUISICI.REQUSUCOD ,  HOSVITAL.ADMUSR.AUSRDSC , HOSVITAL.REQUISICI.RECNCCOD  , HOSVITAL.CENCOST.CNCDSC ,  HOSVITAL.REQUISI1.REQCANAPR ,  HOSVITAL.REQUISI1.REQCANENV , HOSVITAL.REQUISI1.REQCANNEG  , HOSVITAL.REQUISI1.MSRESO  ,  HOSVITAL.REQUISI1.REQNOMPRO , HOSVITAL.MAESUM1.MSGRPCOD ,    HOSVITAL.GRUPOS.GRPDSC , HOSVITAL.REQUISI1.REQORDCOM ,  HOSVITAL.COMPCAB.DOCCOD , HOSVITAL.COMPCAB.ORDENRO  ,    HOSVITAL.COMPCAB2.ORDECNT , HOSVITAL.COMPCAB2.ORDEVLRU ,   HOSVITAL.COMPCAB2.ORDEVLRI , HOSVITAL.COMPCAB.ORDEFCH , HOSVITAL.TERCEROS.TRCCOD , HOSVITAL.TERCEROS.TRCRAZSOC  ,  HOSVITAL.COMPCAB2.ORDECNT , HOSVITAL.COMPCAB2.ORDERCB , HOSVITAL.COMPCAB2.ORDETTAL , HOSVITAL.COMPCAB2.ORDETOTI ,   HOSVITAL.COMPCAB2.ORDETOTD ,   HOSVITAL.COMPCAB.ORDTIPCPLZ , HOSVITAL.COMPCAB2.ORDENRO , HOSVITAL.COMPCAB.ORDTIPDPLZ,    HOSVITAL.COMPCAB2.DOCCOD, HOSVITAL.COMPCAB.ORDEEST ,    HOSVITAL.REQUISI1.REQULTEST, HOSVITAL.COMPCAB.ORDEUSUC , ADMUSR111.AUSRDSC    ,  HOSVITAL.REQUISI1.REQENVCMP
*/
 ORDER BY HOSVITAL.REQUISICI.REQNRO   ,HOSVITAL.REQUISI1.REQITEM;

-- Nuevo Query

SELECT * FROM HOSVITAL.REQUISITMP;
SELECT * FROM HOSVITAL.REQUISITMP WHERE REQNRO=66490;	

SELECT * FROM HOSVITAL.COMPCAB WHERE ORDENRO = 26938;
SELECT * FROM HOSVITAL.COMPCAB2 WHERE ORDENRO = 26938;
select * from hosvital.requisici where reqnro=66490;
select * from hosvital.requisi1 where reqnro=66490;

UPDATE  HOSVITAL.COMPCAB2
SET ORDREQNRO=66490	,  ORDREQITM=1
 WHERE ORDENRO = 26938 AND MSRESO='0043MQ72';



SELECT  R.DOCCOD  AS Doc_Requisicion, R.REQNRO AS Numero_Requisicion , R1.REQITEM ,  R1.REQULTEST AS Estado_Item, R.REQFCH AS Fecha_Requisicion, CASE  R.REQEST  WHEN  'A' THEN 'A-PROCESADA' WHEN 'N' THEN 'N-NEGAD' WHEN 'P' THEN 'P-PARCIALES' WHEN 'S' THEN 'S-SOLICITADA' WHEN 'X' THEN 'X-ANULADA' ELSE 'OTRO ESTADO' END AS Estado_Requisicion,
 R.REQOBS AS Observacion, R.REQUSUCOD as Cod_Usuario_Requisicion,  USR.AUSRDSC as Usr_Requisicion, R.RECNCCOD as Centro_Costo_Requisicion ,CEN.CNCDSC as Descr_Centr_Cost,  R1.REQCANAPR as Cant_Aprobada,  R1.REQCANENV as Cantidad_Enviada, R1.REQCANNEG  as Cantidad_Negada,R1.MSRESO As Codigo_Suministro , R1.REQNOMPRO AS  Descripcion_Suministro ,M1.MSGRPCOD as Grupo_Suministro,    G.GRPDSC as Descr_Grupo_Suministro , C2.DOCCOD AS Codigo, C2.ORDENRO as Numero_OC ,  C2.ORDECNT AS Cantidad_OC, C2.ORDEVLRU AS Valor_Unitario,   C2.ORDEVLRI as Porcentaje_IVA ,    C.ORDEFCH as Fecha_OC , T.TRCCOD as Proveedor, T.TRCRAZSOC as Descr_Proveedor , C2.ORDECNT as Cant_Ordenada, C2.ORDERCB as Cant_Recibida, C2.ORDETTAL as Total_Orden_SinIVA, C2.ORDETOTI as Total_Iva,
  C2.ORDETOTD as Total_Descuento,   (C2.ORDETTAL + C2.ORDETOTI - C2.ORDETOTD ) as TOTAL ,  C.ORDTIPCPLZ as Plazo_Pago, C.ORDTIPDPLZ as Desc_Plazo_Pago,  CASE C.ORDEEST WHEN 'A' THEN 'A-ANULADA' WHEN 'E' THEN 'E-ENTRADA_ALMACEN'  WHEN 'F' THEN 'F-FACTURADA' WHEN 'G' THEN 'G-GENERADA' WHEN'O' THEN 'O-PENDIENTE' WHEN  'P' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'S' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'Y' THEN 'RECIBIDO_ITEMS_CANCELADOS'  END as Estado_OC,   C.ORDEUSUC AS Usr_OC , ADMUSR111.AUSRDSC as Dscr_Usu_OC   ,  R1.REQENVCMP  AS Enviado_Compras, (R1.REQCANAPR  -  C2.ORDECNT -  R1.REQCANNEG) AS Pendiente_Por_Comprar  ,  MIN(CMB.FCHA)AS Fecha_Envio_Compra 
FROM HOSVITAL.REQUISICI R
 LEFT JOIN HOSVITAL.REQUISI1 R1 ON  (R1.REQNRO = R.REQNRO  )
LEFT JOIN  HOSVITAL.ADMUSR USR  ON (USR.AUSRID = R.REQUSUCOD) 
 LEFT JOIN  HOSVITAL.CENCOST  CEN ON(CEN.CNCCOD = R.RECNCCOD )
 LEFT JOIN  HOSVITAL.MAESUM1 M1  ON (M1.MSRESO = R1.MSRESO)
  INNER  JOIN HOSVITAL.GRUPOS G ON (G.GRPCOD = M1.MSGRPCOD) 
LEFT JOIN HOSVITAL.COMPCAB2 C2 ON  (C2.ORDREQNRO =R1.REQNRO  AND C2.MSRESO=R1.MSRESO  and C2.ORDREQITM = R1.REQITEM)
 LEFT JOIN HOSVITAL.COMPCAB C ON  (C2.DOCCOD = C.DOCCOD  AND C2.ORDENRO = C.ORDENRO) 
LEFT  JOIN HOSVITAL.TERCEROS T ON (T.TRCCOD = C.PRVCOD) 
LEFT  JOIN  HOSVITAL.ADMUSR AS ADMUSR111 ON (  ADMUSR111.AUSRID = C.ORDEUSUC) 
LEFT JOIN HOSVITAL.REQUISITMP   CMB ON (CMB.DOCCOD = R1.DOCCOD   AND CMB.REQNRO = CMB.REQNRO AND R1.REQITEM = CMB.REQITEM AND R1.MSRESO = CMB.MSRESO )
WHERE  DATE(R.REQFCH)>='2020-01-01'  AND DATE(R.REQFCH)<='2020-08-31'
AND C.ORDENRO IN (26938,24207,24212)
GROUP BY R.DOCCOD  , R.REQNRO  , R1.REQITEM ,  R1.REQULTEST , R.REQFCH , CASE  R.REQEST  WHEN  'A' THEN 'A-PROCESADA' WHEN 'N' THEN 'N-NEGAD' WHEN 'P' THEN 'P-PARCIALES' WHEN 'S' THEN 'S-SOLICITADA' WHEN 'X' THEN 'X-ANULADA' ELSE 'OTRO ESTADO' END ,
 R.REQOBS , R.REQUSUCOD ,  USR.AUSRDSC , R.RECNCCOD ,CEN.CNCDSC ,  R1.REQCANAPR ,  R1.REQCANENV , R1.REQCANNEG  ,R1.MSRESO  , R1.REQNOMPRO  ,M1.MSGRPCOD ,    G.GRPDSC, C2.DOCCOD , C2.ORDENRO  ,  C2.ORDECNT , C2.ORDEVLRU ,   C2.ORDEVLRI  ,    C.ORDEFCH   , T.TRCCOD , T.TRCRAZSOC  , C2.ORDECNT , C2.ORDERCB, C2.ORDETTAL , C2.ORDETOTI ,  C2.ORDETOTD ,   (C2.ORDETTAL + C2.ORDETOTI - C2.ORDETOTD )  ,  C.ORDTIPCPLZ , C.ORDTIPDPLZ ,  CASE C.ORDEEST WHEN 'A' THEN 'A-ANULADA' WHEN 'E' THEN 'E-ENTRADA_ALMACEN'  WHEN 'F' THEN 'F-FACTURADA' WHEN 'G' THEN 'G-GENERADA' WHEN'O' THEN 'O-PENDIENTE' WHEN  'P' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'S' THEN 'RECIBIDO_ITEMS_CANCELADOS'   WHEN  'Y' THEN 'RECIBIDO_ITEMS_CANCELADOS'  END ,   C.ORDEUSUC  , ADMUSR111.AUSRDSC   ,  R1.REQENVCMP  , (R1.REQCANAPR  -  C2.ORDECNT -  R1.REQCANNEG) 
 ORDER BY R.REQNRO   ,R1.REQITEM;


SELECT R.DOCCOD AS Doc_Requisicion, R.REQNRO AS Numero_Requisicion , R1.REQITEM,R1.REQULTEST AS Estado_Item, R.REQFCH AS Fecha_Requisicion,

 CASE  R.REQEST WHEN 'A' THEN 'A-PROCESADA' WHEN 'N' THEN 'N-NEGAD' WHEN 'P' THEN 'P-PARCIALES' WHEN 'S' THEN 'S-SOLICITADA' WHEN 'X' THEN 'X-ANULADA' ELSE 'OTRO ESTADO' END AS Estado_Requisicion,

 R.REQOBS AS Observacion, R.REQUSUCOD as Cod_Usuario_Requisicion, USR.AUSRDSC as Usr_Requisicion, R.RECNCCOD as Centro_Costo_Requisicion ,CEN.CNCDSC as Descr_Centr_Cost,R1.REQCANAPR as Cant_Aprobada, R1.REQCANENV as Cantidad_Enviada, R1.REQCANNEG as Cantidad_Negada,R1.MSRESO As Codigo_Suministro ,R1.REQNOMPRO AS  Descripcion_Suministro,M1.MSGRPCOD as Grupo_Suministro, G.GRPDSC as Descr_Grupo_Suministro ,C2.DOCCOD AS Codigo, C2.ORDENRO as Numero_OC ,C2.ORDECNT AS Cantidad_OC, C2.ORDEVLRU AS Valor_Unitario,C2.ORDEVLRI as Porcentaje_IVA ,C.ORDEFCH as Fecha_OC, T.TRCCOD as Proveedor,T.TRCRAZSOC as Descr_Proveedor,C2.ORDECNT as Cant_Ordenada, C2.ORDERCB as Cant_Recibida, C2.ORDETTAL as Total_Orden_SinIVA, C2.ORDETOTI as Total_Iva,C2.ORDETOTD as Total_Descuento,(C2.ORDETTAL + C2.ORDETOTI-C2.ORDETOTD ) as TOTAL, C.ORDTIPCPLZ as Plazo_Pago, C.ORDTIPDPLZ as Desc_Plazo_Pago,CASE C.ORDEEST WHEN 'A' THEN 'A-ANULADA' WHEN 'E' THEN 'E- ENTRADA_ALMACEN' WHEN 'F' THEN 'F-FACTURADA' WHEN 'G' THEN 'G-GENERADA' WHEN 'O' THEN 'O-PENDIENTE' WHEN  'P' THEN 'RECIBIDO_ITEMS_CANCELADOS' WHEN 'S' THEN 'RECIBIDO_ITEMS_CANCELADOS' WHEN 'Y' THEN 'RECIBIDO_ITEMS_CANCELADOS' END as Estado_OC, C.ORDEUSUC AS Usr_OC ,ADMUSR111.AUSRDSC as Dscr_Usu_OC, R1.REQENVCMP AS Enviado_Compras, (R1.REQCANAPR - C2.ORDECNT - R1.REQCANNEG) AS Pendiente_Por_Comprar, MIN (CMB.FCHA)AS Fecha_Envio_Compra FROM HOSVITAL.REQUISICI R LEFT JOIN HOSVITAL.REQUISI1 R1 ON (R1.REQNRO=R.REQNRO) LEFT JOIN HOSVITAL.ADMUSR USR ON (USR.AUSRID = R.REQUSUCOD) LEFT JOIN HOSVITAL.CENCOST CEN ON(CEN.CNCCOD = R.RECNCCOD) LEFT JOIN HOSVITAL.MAESUM1  M1 ON (M1.MSRESO=R1.MSRESO) INNER JOIN HOSVITAL.GRUPOS G ON (G.GRPCOD=M1.MSGRPCOD) LEFT JOIN HOSVITAL.COMPCAB2 C2 ON (C2.ORDREQNRO=R1.REQNRO AND C2.MSRESO=R1.MSRESO and C2.ORDREQITM = R1.REQITEM) LEFT JOIN HOSVITAL.COMPCAB C ON (C2.DOCCOD=C.DOCCOD AND C2.ORDENRO=C.ORDENRO) LEFT JOIN HOSVITAL.TERCEROS T ON (T.TRCCOD=C.PRVCOD) LEFT JOIN HOSVITAL.ADMUSR AS ADMUSR111 ON (ADMUSR111.AUSRID=C.ORDEUSUC) LEFT JOIN HOSVITAL.REQUISITMP CMB ON (CMB.DOCCOD=R1.DOCCOD AND CMB.REQNRO=CMB.REQNRO AND R1.REQITEM=CMB.REQITEM AND R1.MSRESO=CMB.MSRESO) WHERE DATE(R.REQFCH)>='2020-01-01' AND DATE(R.REQFCH)<='2020-08-31' AND C.ORDENRO IN (26938,24207,24212) 
GROUP BY R.DOCCOD,R.REQNRO,R1.REQITEM,R1.REQULTEST,R.REQFCH ,
/*
CASE  R.REQEST  WHEN 'A' THEN 'A-PROCESADA' WHEN 'N' THEN 'N- NEGAD'  WHEN 'P' THEN 'P-PARCIALES'  WHEN 'S' THEN 'S-SOLICITADA'  WHEN 'X' THEN 'X-ANULADA' ELSE 'OTRO ESTADO'  END, 
*/
R.REQEST,
R.REQOBS , R.REQUSUCOD ,USR.AUSRDSC,R.RECNCCOD ,CEN.CNCDSC ,R1.REQCANAPR ,R1.REQCANENV,R1.REQCANNEG ,R1.MSRESO,R1.REQNOMPRO,M1.MSGRPCOD,G.GRPDSC,C2.DOCCOD ,C2.ORDENRO ,C2.ORDECNT ,C2.ORDEVLRU ,C2.ORDEVLRI , C.ORDEFCH, T.TRCCOD ,T.TRCRAZSOC,C2.ORDECNT,C2.ORDERCB,C2.ORDETTAL ,C2.ORDETOTI ,C2.ORDETOTD ,(C2.ORDETTAL + C2.ORDETOTI - C2.ORDETOTD),C.ORDTIPCPLZ, C.ORDTIPDPLZ ,CASE C.ORDEEST WHEN 'A' THEN 'A-ANULADA' WHEN 'E' THEN 'E- ENTRADA_ALMACEN' WHEN 'F' THEN 'F-FACTURADA' WHEN 'G' THEN 'G-GENERADA' WHEN'O' THEN 'O-PENDIENTE' WHEN  'P' THEN 'RECIBIDO_ITEMS_CANCELADOS' WHEN 'S' THEN 'RECIBIDO_ITEMS_CANCELADOS' WHEN 'Y' THEN 'RECIBIDO_ITEMS_CANCELADOS' END, C.ORDEUSUC, ADMUSR111.AUSRDSC, R1.REQENVCMP , (R1.REQCANAPR- C2.ORDECNT- R1.REQCANNEG) ORDER BY R.REQNRO ,R1.REQITEM
;


