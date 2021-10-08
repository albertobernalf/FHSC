select CONCAT('FAC-','',B.HOJNUMOBL) as no_doc , '001' as sede , convert(varchar(10),b.HojFchObl,120) as feca_obl,convert(varchar(10),b.HojFchRad, 120) as fecha_rad,
datediff(day,b.HojFchRad,CURRENT_TIMESTAMP) as dias,  
case when convert(varchar(10),b.HojFchRad, 120)='1753-01-01' then (b.HojTotDeb - b.hojtotcre) else 0 end as sin_radicar,
case when datediff (day,b.HojFchobl,current_timestamp) <= 30 then (b.HojTotDeb - b.hojtotcre) else  0 end as por_vencer,
p.[30],p.[60],p.[90],p.[180],p.[360],p.[99999] ,


  b.HojTipPag,
(HojTotDeb - hojtotcre),
/*
DE_0_30, DE_30_60,DE_60_90,DE_90_120,DE_120_180,DE_180_360,DE_360__999.
GLOSA,
*/
b.hojstaglo as GLS,
b.HojTipPag
from HOJOBL b
PIVOT
(
  sum(datediff(day,b.HojFchRad,CURRENT_TIMESTAMP)) FOR y.AntCod IN ([30],[60],[90],[180],[360],[99999])
) AS p;
where b.hojfchobl<= '2016-11-30' and b.CLICOD='860066942' and b.CntVig=2016 and HojTotDeb <> hojtotcre
order by  CONCAT('FAC-','',B.HOJNUMOBL)


SELECT * FROM terceros where TrcCod= '860066942'
select * from HOJOBL where HojNumObl= '2133659'
select * from HOJOBL where HojNumObl= '2343588'

SELECT * FROM ANTIG  -- ESTE ES EL TIPO
SELECT * FROM ANTIG1 -- ESTE ES EL PLAZO

-- oTRA FORMA DE VER EL QUERY



select CONCAT('FAC-','',j.HOJNUMOBL) as no_doc , '001' as sede , convert(varchar(10),j.HojFchObl,120) as feca_obl,convert(varchar(10),j.HojFchRad, 120) as fecha_rad,
datediff(day,j.HojFchRad,CURRENT_TIMESTAMP) as dias,  
case when convert(varchar(10),j.HojFchRad, 120)='1753-01-01' then (j.HojTotDeb - j.hojtotcre) else 0 end as sin_radicar,
case when datediff (day,j.HojFchobl,current_timestamp) <= 30 then (j.HojTotDeb - j.hojtotcre) else  0 end as por_vencer,
p.[30],p.[60],p.[90],p.[180],p.[360],p.[99999] ,
  j.HojTipPag,
(HojTotDeb - hojtotcre),
j.hojstaglo as GLS,
j.HojTipPag
from 
(
select CONCAT('FAC-','',p.HOJNUMOBL) as no_doc , '001' as sede , convert(varchar(10),p.HojFchObl,120) as feca_obl,convert(varchar(10),p.HojFchRad, 120) as fecha_rad,
datediff(day,p.HojFchRad,CURRENT_TIMESTAMP) as dias,  
case when convert(varchar(10),p.HojFchRad, 120)='1753-01-01' then (p.HojTotDeb - p.hojtotcre) else 0 end as sin_radicar,
case when datediff (day,p.HojFchobl,current_timestamp) <= 30 then (p.HojTotDeb - p.hojtotcre) else  0 end as por_vencer,
  b.HojTipPag,
(p.HojTotDeb - p.hojtotcre),
b.hojstaglo as GLS,
b.HojTipPag}from HOJOBL p
where p.hojfchobl<= '2016-11-30' and p.CLICOD='860066942' and p.CntVig=2016 and p.HojTotDeb <> p.hojtotcre
) j
PIVOT
(
  sum(datediff(day,b.HojFchRad,CURRENT_TIMESTAMP)) FOR y.AntCod IN ([30],[60],[90],[180],[360],[99999])
) AS p;



















 SELECT  X.cntcod,COALESCE("DEBITOS",0) AS DEB_MOVCONT2 , COALESCE("CREDITOS",0) AS CRE_MOVCONT2,q.rsaxdeb,q.rsaxcre,(COALESCE("DEBITOS",0) - q.rsaxdeb) AS DIF_DEBITOS,
(COALESCE("CREDITOS" ,0) - q.rsaxcre) DIF_CREDITOS
 from movcont2 X   
 inner join rsmaux q on (q.rsmano=2016 and q.rsmmes=8 and q.rsmctncon=x.cntcod)
  inner join  CROSSTAB ('SELECT P.cntcod,P.mvcnat,sum(P.MVCVLRLC)
				   FROM movcont2 P  
				   WHERE  P.cntvig=2016 and P.mvcanio=2016 and P.mvcmes = 8 GROUP BY 1,2 ORDER  BY 1',
'select distinct  mvcnat from MOVCONT2 order by 1 DESC') AS pepe ("Cntcod" varchar ,"DEBITOS" float,"CREDITOS" float)  on (pepe."Cntcod" = X.cntcod)
where  X.cntvig=2016 and X.mvcanio=2016 and X.mvcmes = 8 AND (COALESCE("CREDITOS" ,0) - q.rsaxcre)<>0.00
--AND X.CNTCOD='11100504'
group by X.cntcod,"DEBITOS" , "CREDITOS",q.rsaxdeb,q.rsaxcre
order by  X.cntcod
