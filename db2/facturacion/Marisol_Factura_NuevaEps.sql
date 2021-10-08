select * from hosvital.maeate WHERE MPNFAC = 437713;  --  NC = 5730
SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL='437713';  --NCF , MCCVLR

select * from hosvital.admglo11 where mpnfac = 397452;
select * from hosvital.admglo01 where aglremnr in (16142,16143);

select * from hosvital.admglo01;
SELECT * FROM HOSVITAL.MAEEMP WHERE MENOMB LIKE ('%NUEVA%EPS%');

select m.mpnfac factura, cap.mpnomc usuario_facturado, cap.mptdoc as tipoId,cap.mpcedu as identificacion, i.ingfecegr as fechaDeEgreso,m.facfch as FechaFactura, 
	adm01.aglradfc as FecRadicacion,m.matotf as ValorBruto,0 as copagoPcte, m.mavapu as Moderadora,
	m.manrnotcr as numeroNotaCredito,
(select sum(case when mov.mccnat='C' then  mov.mccvlr when mov.mccnat ='D' then  -mov.mccvlr    end                 ) from hosvital.movcxc mov where mov.doccod='NCF' AND CAST(MOV.MCCNUMOBL AS INTEGER) = M.MPNFAC)
	as valorNc,
                             m.mavals as valorNeto

from hosvital.admglo01 adm01
inner join hosvital.admglo11 adm11 on (adm11.aglremnr=adm01.aglremnr)
inner join hosvital.maeate m on (m.mpnfac = adm11.mpnfac)
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving )

inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni and maeemp.menomb like ('%NUEVA%EPS%'))
where m.facfch>= '2021-01-01' and m.facfch <= '2021-05-31'  
order by m.mpnfac;

SELECT * FROM HOSVITAL.EMPRESS WHERE EMPDSC LIKE ('%NUEVA%EPS%');
SELECT * FROM HOSVITAL.MAEEMP WHERE MECNTR='900156264-2';

select m.mpnfac factura, cap.mpnomc usuario_facturado, cap.mptdoc as tipoId,cap.mpcedu as identificacion, i.ingfecegr as fechaDeEgreso,m.facfch as FechaFactura, 
	adm01.aglradfc as FecRadicacion,m.matotf as ValorBruto,0 as copagoPcte, m.mavapu as Moderadora,
	m.manrnotcr as numeroNotaCredito,
(select sum(case when mov.mccnat='C' then  mov.mccvlr when mov.mccnat ='D' then  -mov.mccvlr    end                 ) from hosvital.movcxc mov where mov.doccod='NCF' AND CAST(MOV.MCCNUMOBL AS INTEGER) = M.MPNFAC)
	as valorNc,
                             m.mavals as valorNeto

from hosvital.admglo01 adm01
inner join hosvital.admglo11 adm11 on (adm11.aglremnr=adm01.aglremnr)
inner join hosvital.maeate m on (m.mpnfac = adm11.mpnfac)
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving )

inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maeemp maeemp on (maeemp.mennit=m.mpmeni )
inner join hosvital.empress emp on (emp.mecntr=maeemp.mecntr)
where emp.mecntr = '900156264-2' and m.facfch>= '2016-01-01' and m.facfch <= '2021-05-31'  and m.maestf not in ('1','10') and M.MPNFAC =397452 and adm01.aglradfc<>'0001-01-01'
order by m.mpnfac;


select * from hosvital.maeate m
where m.matipdoc='5' and m.mpnfac not in (select r.resnum from hosvital.ressev r where r.restippro='FEC' and r.resfec >= '2020-07-29 00:00:00' )

order by m.facfch;

select * from hosvital.ressev -- 2020-07-29 00:00:00
 where restippro='FEC'   -- and resfec = '0001-01-01 00:00:00'  -- resret = 1 = enviado nO EXITOSA
order by resfec asc ;

select * from hosvital.ressev -- 2020-07-29 00:00:00
 where restippro='FEC'   and  resret = 1  -- = no enviado
order by resfec asc ;

select * from hosvital.maeate m
where m.matipdoc='5' and m.facfch >= '2020-07-29' and m.facfch <= '2021-05-31'   -- and  m.mpnfac = 60059	
 and m.mpnfac not in (select r.resnum from hosvital.ressev r where r.restippro='FEC'  )
order by m.facfch;   -- 60059	

--  Enviada No exitosa :

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM hosvital.ressev 
where resfec >='2021-01-01 00:00:00' and resfec <= '2021-06-30 23:59:59' 
and restippro='FEC' AND RESTIP='FC' AND RESRET = 1 
order by RESTIPPRO,RESTIP,RESNUM;

-- eNVIADA EXITOSA

SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,RESFECMOV, RESRET
FROM hosvital.ressev 
where resfec >='2021-01-01 00:00:00' and resfec <= '2021-06-30 23:59:59'  and restippro='FEC' AND RESTIP='FC' AND RESXMLRES LIKE ('%false%') 
order by RESTIPPRO,RESTIP,RESNUM;

-- Unida

select 'FEC','FC',MPNFAC, '0001-01-01 00:00:00' ,' ',DATE(FACFCH),0  from hosvital.maeate m
where m.matipdoc='5' and m.facfch >= '2020-07-29' and m.facfch <= '2021-05-31'   -- and  m.mpnfac = 60059	
 and m.mpnfac not in (select r.resnum from hosvital.ressev r where r.restippro='FEC'   AND R.RESNUM =  M.MPNFAC )
union
SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,DATE(RESFECMOV), RESRET
FROM hosvital.ressev 
where (resfec >='2021-01-01 00:00:00' and resfec <= '2021-06-30 23:59:59' and restippro='FEC' AND RESTIP='FC' AND RESRET = 1 ) or
	(resfec ='0001-01-01 00:00:00' and restippro='FEC' AND RESTIP='FC' AND RESRET = 1  )
order by 3;

-- NAF  ANULCION DE FACTURAS



SELECT * FROM HOSVITAL.MAEATE WHERE MPNFAC =65145 ;
	


select 'FEC','NC',MPNFAC, '0001-01-01 00:00:00' ,' ',DATE(MAFCHNOT),0  from hosvital.maeate m
where m.matipdoc='5' and m.facfch >= '2020-07-29' and m.facfch <= '2021-05-31'   -- and  m.mpnfac = 60059	
 and  m.MANRNOTCR  <> 0 AND  m.MPNFAC not in (select r.resnum from hosvital.ressev r where r.restippro='FEC'  AND RESTIP ='NC'  AND R.RESNUM =  M.MPNFAC  )
union
SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,DATE(RESFECMOV), RESRET
FROM hosvital.ressev 
where (resfec >='2021-01-01 00:00:00' and resfec <= '2021-06-30 23:59:59'  and restippro='FEC' AND RESTIP='NC' AND RESRET = 1 ) or
	(resfec <= '0001-01-01 00:00:00'  and restippro='FEC' AND RESTIP='NC' AND RESRET = 1)
order by 3;


SELECT DISTINCT RESTIP FROM HOSVITAL.RESSEV WHERE  restippro='FEC';

-- Glosas
--60059
SELECT * FROM HOSVITAL.RESSEV WHERE restip= 'N2'  and resret=1;

SELECT * FROM HOSVITAL.ADGLOSAS where matipdoc='5' ;

select 'FEC','N2',MPNFAC, '0001-01-01 00:00:00' ,' ',DATE(ad.glofchnot),0  
from hosvital.adglosas ad
where ad.matipdoc='5' and ad.glofchnot >= '2020-07-29' and ad.glofchnot  <= '2021-05-31'   -- and  m.mpnfac = 60059	
 and  ad.glonumdoc <> 0 AND  ad.MPNFAC not in (select r.resnum from hosvital.ressev r where r.restippro='FEC'  AND RESTIP ='N2'  AND R.RESNUM =  ad.MPNFAC  )
union
SELECT RESTIPPRO,RESTIP,RESNUM,RESFEC,RESXMLRES,DATE(RESFECMOV), RESRET
FROM hosvital.ressev 
where (resfec >='2021-01-01 00:00:00' and resfec <= '2021-06-30 23:59:59'  and restippro='FEC' AND RESTIP='N2' AND RESRET = 1 )  or
          (resfec ='0001-01-01 00:00:00'  and restippro='FEC' AND RESTIP='N2' AND RESRET = 1)
order by 3;


