
select * from hosvital.ressev where resfec >= '2020-07-29 00:00:00';

-- Detalle No Exitosas

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET FROM hosvital.ressev where resfec >='2020-08-03 00:00:00' and resfec <= '2020-08-03 23:59:59' and restippro='FEC' AND RESTIP='FC' AND RESXMLRES LIKE ('%false%') order by RESTIPPRO,RESTIP,RESNUM;

-- Detalle Exitosas


SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET FROM hosvital.ressev where resfec >='2020-07-29 00:00:00' and resfec <= '2020-07-30 23:59:59' and restippro='FEC' AND RESTIP='FC' AND RESXMLRES LIKE ('%true%') order by RESTIPPRO,RESTIP,RESNUM;


-- Consolidado FEC

select year(resfec) as ano, month(resfec) as mes, day(resfec) as dia, restippro PROCESO, restip tipp_factura, case when  RESXMLRES LIKE ('%true%') then 'Exitosas'   when  RESXMLRES LIKE ('%false%') then 'No Exitosas'     end  ,  case when resret=0 then 'Enviadas' when resret=1 then 'No Enviadas'   end,   count(*) TOTAL
FROM hosvital.ressev
 where resfec >='2020-07-29 00:00:00' and resfec <= '2020-08-31 23:59:59' and restippro='FEC' AND RESTIP='FC'  
group by year(resfec) , month(resfec) , day(resfec) ,restippro, restip  ,case when  RESXMLRES LIKE ('%true%') then 'Exitosas'   when  RESXMLRES LIKE ('%false%') then 'No Exitosas'     end, case when resret=0 then 'Enviadas' when resret=1 then 'No Enviadas'   end
order by  year(resfec) , month(resfec) , day(resfec) , restippro, restip ;


--Consolidado Facturacion

select  year(facfch) as ano, month(facfch) as mes, day(facfch) as dia, case when matipdoc ='1' then 'Orden De Servicio'     when matipdoc ='5' then 'FEC'  end   ,case when maestf ='0' then 'Activa'  when maestf ='1' then '1' when maestf ='2' then '2' when maestf ='3' then 'Activa' when maestf ='3' then 'Activa' when maestf ='4' then '4'            end     ,count(*)
from hosvital.maeate
where facfch >= '2020-07-29'
group by year(facfch) , month(facfch) , day(facfch) , matipdoc,maestf
order by  year(facfch) , month(facfch) , day(facfch) , matipdoc,maestf;

-- QUERYS DE INCONSISTENCIAS 

--  Cuales facturas No se les ha hecho Proceso FEC

select m.facfch as fec_factura,m.mpnfac as factura,c.mpnomc as paciente, mae.menomb as contrato,m.matotf as valor, m.maestf as estado_fac
from hosvital.maeate m
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu=m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.facfch>= '2020-07-29' and m.facfch<= '2020-08-31'  and m.matipdoc=5 and  m.mpnfac not in (select resnum from hosvital.ressev where restippro='FEC' AND restip='FC')
ORDER BY M.MPNFAC;


-- Cuales Facturas se deben Reenviar


select * from hosvital.ressev where resfec >= '2020-07-29 00:00:00' and resret =1;


select m.facfch as fec_factura,m.mpnfac as factura,c.mpnomc as paciente, mae.menomb as contrato,m.matotf as valor,CASE when m.maestf='0' then 'ACTIVA'  else   concat('estado ', m.maestf) end as estado_fac from hosvital.maeate m inner join hosvital.capbas c on (c.mptdoc=m.mptdoc and c.mpcedu=m.mpcedu) inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni) where m.facfch>='2020-07-29' and m.facfch<='2020-07-31' and m.matipdoc = 5 and m.mpnfac not in (select resnum from hosvital.ressev where restippro='FEC' AND restip='FC') ORDER BY M.MPNFAC;

select * from hosvital.ressev where resnum=636635;