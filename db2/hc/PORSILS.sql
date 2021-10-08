-- Otra voz querys Terapias
-- TOCARIA LAS CONCLUSIONES EN OTRO QUERY


-- Excluyendo CANCELADAS

SELECT * FROM HOSVITAL.HCCOM2DES  WHERE HISCKEY='21075328' AND HISCSEC=80 AND HCPRCCOD in ('903110', '903839');
SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY='21075328' AND HISCSEC =80  AND HCPRCCOD  IN   ('903110', '903839');
SELECT * FROM HOSVITAL.HCCOM51R WHERE HISCKEY='21075328' AND HISCSEC =80  AND HCPRCCOD  IN   ('903110', '903839');



select h1.hiscsec as folio,  h5.hcprccod ,h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'  when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado,
h5.hiscpobs descripcion, h51.hcfchrap  as fecha_y_hora_aplicacion, h51.hcresult resultados,
concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod and h5.hcprstgr<>'C' and ( (h51.hcresult<>'' and  h5.hcprstgr <>  'N' ) or  (h51.hcresult = '' and  h5.hcprstgr not in ('N'))))
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=80  and  h5.hcprctip =  3 and h51.hcresult <> '';

--UNION

select h1.hiscsec as folio,  h5.hcprccod, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo' when h5.hcprstgr='E' THEN 'En Proceso' when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado, 
h5.hiscpobs descripcion,h51.hcfchrap  as fecha_y_hora_aplicacion ,
(SELECT des2.hcdscatr FROM hosvital.hccom2des des2 WHERE des2.histipdoc=h5.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec= h5.hiscsec and des2.hcprccod = h5.hcprccod and des2.hcprccns =  h51.hcprccns  AND DES2.HCDESATR ='HCResult') AS RESULTADOS,
(SELECT des22.hcdscatr  FROM hosvital.hccom2des des22  WHERE des22.histipdoc=h5.histipdoc and des22.hisckey=h1.hisckey and des22.hiscsec= h5.hiscsec and des22.hcprccod = h5.hcprccod and des22.hcprccns =  h51.hcprccns 
 AND DES22.HCDESATR ='HCConsul') AS CONCLUSIONES,
concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion
from hosvital.hccom5 h5 inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod and h5.hcprstgr<>'C'   )
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
 inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
--left join hosvital.hccom2des des2 on (des2.histipdoc=h5.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec= h5.hiscsec and des2.hcprccod = h5.hcprccod and des2.hcprccns =  h51.hcprccns )
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs) 
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=117  and  h5.hcprctip =  3  ;

--order by 2 ;
