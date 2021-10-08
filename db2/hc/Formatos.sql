select * from hosvital.movcont2 where cntvig=2021 and trccod='19465673' order by mvcmes;

select * from hosvital.movcxp where prvcod='19465673' order by mvcxpfch;

SELECT r.RESDOCPAC AS CEDULA,c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA,m11.mmnomm as nombre_medico, e.ENCAGRDSC AS DESCRIPCION_FORMATO,
r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA,TIME(r.RESFECHOR) AS HORA,r1.resobser as puntaje_crivaje
from hosvital.resencu1 r1
inner join hosvital.resencu r on (r.empcod=r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac=r1.resfolpac and r.resctvre=r1.resctvre) 
inner join hosvital.capbas c on (c.mptdoc=r.restdopac and c.mpcedu=r.resdocpac) inner join hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey=c.mpcedu and h.hiscsec=r.resfolpac) 
inner join hosvital.maeemp m on (m.mennit = h.fhccodcto) inner join hosvital.encues1 e on (e.empcod=r.empcod and e.enccod=r.enccod and e.encver=r.encver)
inner join hosvital.ingresos i on (i.mptdoc=h.histipdoc and i.mpcedu=h.hisckey and i.ingcsc=h.hctvin1)
 inner join hosvital.maepab m1 on (m1.mpcodp=i.mpcodp)
inner join hosvital.maemed1 m11 on (m11.mmcodm=h.hiscmmed) 
where R.RESDOCPAC = '19245411' AND  -- r.enccod in  ('CONS1', 'NUT01', 'TADITR') AND 
DATE(r.RESFECHOR) BETWEEN '2001-01-01' AND '2021-01-31' --  and r1.resencctv=74 
group by r.RESDOCPAC,c.MPNOMC,m.MENOMB,m1.MPNOMP, i.MPNUMC,m11.mmnomm, e.ENCAGRDSC, r.RESFOLPAC,date(r.RESFECHOR),TIME(r.RESFECHOR),e.encagrord,e.enculcpr,r1.resobser
order by r.RESDOCPAC;

SELECT * FROM HOSVITAL.RESENCU WHERE RESDOCPAC='19245411'; --  RESTDOPAC, RESDOCPAC, RESFOLPAC,
SELECT * FROM HOSVITAL.RESENCU1 WHERE RESCTVRE= 47412; -- RESCTVRE , RESENCCTV  , RESTIPENC

SELECT r.enccod,r.encver,r.restdopac,r.resdocpac,r.resfolpac,r.resctvre,r1.resencctv,r1.restipenc,ep.ENCDSC, e1.encagrpr, e1.encagrdsc, e2.encpredsc, e3.encitmdsc, e4.encitcdsc
FROM HOSVITAL.RESENCU r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto = r.mcdpto and r1.encver=r.encver and r1.resctvre=r.resctvre and r1.ressele=1)
inner join hosvital.encuesp  ep on (ep.empcod=r.empcod and ep.enccod = r.enccod)
inner join hosvital.encues1  e1 on (e1.empcod=r.empcod and e1.enccod = r.enccod and e1.encver= r.encver)
inner join hosvital.encues2  e2 on (e2.empcod=r.empcod and e2.enccod = r.enccod and e2.encver= r.encver and e2.encagrpr=  e1.encagrpr)
inner join hosvital.encues3  e3 on (e3.empcod=r.empcod and e3.enccod = r.enccod and e3.encver= r.encver and e3.encagrpr=  e2.encagrpr and e3.encpre=e2.encpre)
inner join hosvital.encues4  e4 on (e4.empcod=r.empcod and e4.enccod = r.enccod and e4.encver= r.encver and e4.encagrpr=  e3.encagrpr and e4.encpre=e3.encpre and e4.encitcdsc='SI')
WHERE r.restdopac='CC' AND r.RESDOCPAC='19245411' and r.resfolpac=27
order by r1.resencctv;

-- Otra voz

SELECT r.enccod,r.encver,r.restdopac,r.resdocpac,r.resfolpac,r.resctvre,r1.resencctv,r1.restipenc,ep.ENCDSC, e1.encagrpr, e1.encagrdsc, e2.encpredsc --, e3.encitmdsc    -- ,  e4.encitcdsc--,e3.encitmdsc ,  e3.encitmdsc, e4.encitcdsc, 
,e4.encitcdsc,CASE  when r1.resSele = '0' then ' ' when r1.ressele = '1'  then 'SI' when r1.reSsele = '2'  then 'NO' END
FROM HOSVITAL.RESENCU r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto = r.mcdpto and r1.encver=r.encver and r1.resctvre=r.resctvre )  --  and r1.ressele=1)
inner join hosvital.encuesp  ep on (ep.empcod=r.empcod and ep.enccod = r.enccod)
inner  join hosvital.encues1  e1 on (e1.empcod=r.empcod and e1.enccod = r.enccod and e1.encver= r.encver)
left join hosvital.encues2  e2 on (e2.empcod=r.empcod and e2.enccod = r.enccod and e2.encver= r.encver and e2.encagrpr=  e1.encagrpr)
inner join hosvital.encues3  e3 on (e3.empcod=r.empcod and e3.enccod = r.enccod and e3.encver= r.encver and e3.encagrpr=  e2.encagrpr and e3.encpre=e2.encpre  and  e3.encctvres=r1.resencctv )
left join hosvital.encues4  e4 on (e4.empcod=r.empcod and e4.enccod = r.enccod and e4.encver= e2.encver and e4.encagrpr=  e2.encagrpr and e4.encpre=e2.encpre and e4.encitmcns=r1.ressele AND E4.encctcore = r1.resencctv)--   and --e4.encitmpre = e3.encitmpre  
WHERE r.restdopac='CC' AND r.RESDOCPAC='21075328' and r.resfolpac=544  -- and e2.encpre in (15,16,17,18)
group by r.enccod,r.encver,r.restdopac,r.resdocpac,r.resfolpac,r.resctvre,r1.resencctv,r1.restipenc,ep.ENCDSC, e1.encagrpr, e1.encagrdsc, e2.encpredsc ,e4.encitcdsc,r1.reSsele --, e3.encitmdsc
order by r1.resencctv ; --,e2.encpre,e2.encordpre, e3.encorditm ;  --,  e2.encpre.resencctv,e3.encitmpre ;


select * from hosvital.encues  where enccod='TADITR'  order by enculcag; -- EMPCOD, ENCCOD, ENCVER,ENCTIP,enculcag
SELECT * FROM HOSVITAL.ENCUESE;
--select * from hosvital.encuesdx;
--  select *  from hosvital.encuesu;
select * from hosvital.encues1 where enccod='TADITR' order by enculcpr; -- EMPCOD, ENCCOD, ENCVER, ENCAGRPR, ENCAGRDSC  ,  HY VARIBLES
select * from hosvital.encuesp where enccod='TADITR'; -- EMPCOD, ENCCOD, ENCDSC ,ENCINDACT=S/N  ,, EL NOMBRE DEL FORMATO
select * from hosvital.encuess where enccod='TADITR'; --  LAS VERSIONES, EMPCOD,ENCCOD,ENCVER
select * from hosvital.encues1 ;  --where enccod='TADITR'; -- DESDE AQUII 4 NIVELES    ENCAGRPR,, 
select * from hosvital.encues2  where enccod='TADITR' order by encpre;  --ENCAGRPR  , ENCPRE  - Estas son las preguntas y las posibles respuestas  ,, campo enculpr se asocia con campo encpre de encues2
select * from hosvital.encues3 where enccod='TADITR'  order by encpre,encitmpre;--ENCAGRPR  , ENCPRE , ENCITMPRE - - aquii estan las respuestas solitas sin pregunta
select * from hosvital.encues4  where enccod='TADITR' order by encpre; --ENCAGRPR  , ENCPRE , ENCITMPRE,   ENCITMCNS  -- aqui esta la respuesta si o No a la pregunta, es decir las ociones

-- Ultima version
-- Preguntas

SELECT * FROM HOSVITAL.RESENCU WHERE RESDOCPAC='21075328' and resfolpac = 544; 
SELECT * FROM HOSVITAL.RESENCU1 WHERE RESCTVRE= 50305			; 

select * from hosvital.resencu;

select * from hosvital.hccom1 where hisckey='21075328' and hiscsec = 544;

select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod, e2.encpre, e1.encagrdsc, e2.encpredsc  , ''
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit in (0,5) )
WHERE  e2.enccod='TADITR' --and e2.encpre in (15,16,17,18)     
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod,   e2.encpre,  e1.encagrdsc, e2.encpredsc ,
( select   CASE when r1.resSele = '1' then 'NO' when r1.ressele = '0'  then 'SI' when r1.reSsele = '2'  then 'NOPIS' END
	FROM HOSVITAL.RESENCU r
	inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto = r.mcdpto and r1.encver=r.encver and r1.resctvre=r.resctvre )  
	inner  join hosvital.encues1  e1 on (e1.empcod=r.empcod and e1.enccod = r.enccod and e1.encver= r.encver)
	left join hosvital.encues2  e22 on (e22.empcod=e1.empcod and e22.enccod = e1.enccod and e22.encver= e1.encver and e22.encagrpr=  e1.encagrpr)
	inner join hosvital.encues3  e3 on (e3.empcod=e22.empcod and e3.enccod = e22.enccod and e3.encver= e22.encver and e3.encagrpr=  e22.encagrpr and e3.encpre=e22.encpre  and  e3.encctvres=r1.resencctv )
	left join hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod = e3.enccod and e4.encver= e3.encver and e4.encagrpr=  e3.encagrpr and e4.encpre=e3.encpre and e4.encitmcns=r1.ressele AND E4.encctcore = r1.resencctv)
	WHERE r.restdopac='CC' AND r.RESDOCPAC='21075328' and r.resfolpac=544  and r1.empcod= e2.empcod and r1.enccod=e2.enccod and r1.encver= e2.encver  and  r1.resencctv = e2.encpre
	GROUP BY r1.ressele
)
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit not in (0,5) )
WHERE  e2.enccod='TADITR' -- and e2.encpre in (17,18,20,23)
order by 1,2,3,4,5;                                                                                                                                                       


SELECT distinct(enccod), count(*) FROM HOSVITAL.RESENCU WHERE RESfechor >= '2001-01-01 00:00:00'   group by enccod;
-- 1000033893     	FOLIO 51,76
-- 1000036669     	136,121

select * from hosvital.resencu where  RESfechor >= '2001-01-01 00:00:00'    and enccod='LIMDES';                                                                                                                                              
-- QUERY PARA FORMATO : LIMDES


SELECT * FROM HOSVITAL.RESENCU WHERE RESDOCPAC='1000033893' and resfolpac = 51; 
SELECT * FROM HOSVITAL.RESENCU1 WHERE RESCTVRE= 12995	;

select  distinct enccod, count(*) from hosvital.resencu1 group by enccod order by count(*);
		

select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, e1.ENCAGRDSC,
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, 'REALIZO LIMPIEZA Y DESINFECCION ? ',
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e2.empcod,e2.enccod, e2.encpredsc,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre   and  e4.encctcore = r1.resencctv and e4.encitmcns=1
),case when r1.ressele=0 then '-'  when r1.ressele=1 then 'X'  end,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre  and  e4.encctcore = (r1.resencctv+1) and e4.encitmcns=2),
(select case when r11.ressele=0 then '-'  when r11.ressele=1 then 'X'  end
 from hosvital.resencu1 r11
where r11.empcod=r1.empcod and r11.enccod= r1.enccod and r11.encver=r1.encver  and r11.resctvre= r1.resctvre  and r11.resencctv = (r1.resencctv+1) )
from hosvital.resencu r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto=r.mcdpto and r1.enccod= r.enccod  and r1.encver=r.encver and r1.resctvre= r.resctvre)
inner join hosvital.encues2 e2 on (e2.empcod=r1.empcod and e2.enccod= r1.enccod and e2.encver=r1.encver and e2.encpredsc <> '.')
inner join hosvital.encues3 e3 on (e3.empcod=r1.empcod and e3.enccod= r1.enccod and e3.encver=r1.encver and e3.encagrpr = e2.encagrpr and e3.encpre= e2.encpre )
INNER JoIN hosvital.hccom1 h1 on (h1.histipdoc = r1.restdopac and h1.hisckey = r1.resdocpac and h1.hiscsec = r1.resfolpac )
inner join  hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod= e3.enccod and e4.encver=e3.encver and e4.encagrpr = e3.encagrpr and e4.encpre= e3.encpre  and  e4.encctcore=r1.resencctv)
where   h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e2.enccod='LIMDES' and e4.encitmcns=1;

--DISINV	
select * from hosvital.resencu where  RESfechor >= '2001-01-01 00:00:00'    and enccod='DISINV';  

SELECT * FROM HOSVITAL.RESENCU WHERE RESDOCPAC='1000036669' and resfolpac = 87  and enccod='DISINV'; 
SELECT * FROM HOSVITAL.RESENCU1 WHERE RESCTVRE= 20825	;

select * from hosvital.encues1 where enccod='DISINV' order by enculcpr;
select * from hosvital.encuesp where enccod='DISINV'; 
select * from hosvital.encuess where enccod='DISINV'; 
select * from hosvital.encues1  where enccod='DISINV'; 
select * from hosvital.encues2  where enccod='DISINV' order by encpre; -- Estas son las preguntas y las posibles respuestas  ,, campo enculpr se asocia con campo encpre de encues2
select * from hosvital.encues3 where enccod='DISINV'  order by encpre,encitmpre;--ENCAGRPR  , ENCPRE , ENCITMPRE - - aquii LS RESUESTAS A SELECCIONAR
select * from hosvital.encues4  where enccod='DISINV' order by encpre; --ENCAGRPR  , ENCPRE , ENCITMPRE,   ENCITMCNS  -- aqui esta la respuesta si o No a la pregunta, es decir las ociones


select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
0 as valor1, ' ' as valor2, ' ' as valor3
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000036669' and h1.hiscsec = 87 and e1.enccod='DISINV'
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion, e2.encpre, e2.encpredsc,CASE WHEN e3.encitmdsc is null then e2.encpredsc else e3.encitmdsc end
from hosvital.encues2 e2   
INNER JoIN hosvital.hccom1 h1 on (1=1)
LEFT join hosvital.encues3 e3 on (e3.empcod=e2.empcod and e3.enccod= e2.enccod and e3.encver=e2.encver and e3.encagrpr = e2.encagrpr and e3.encpre= e2.encpre )
where  h1.histipdoc='CC'  and h1.hisckey='1000036669' and h1.hiscsec = 87 and e2.enccod='DISINV'
order by 1,2,3,4,5 desc ;

-- Ultima version

select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
0 as valor1, ' ' AS VALOR2 ,E1.ENCAGRDSC,  ' ' AS VALOR3,  date(cast ('0001-01-01 00:00:00 ' as varchar(10))) as valor5
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000036669' and h1.hiscsec = 87 and e1.enccod='DISINV'
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion, e2.encpre, e2.encpredsc,CASE WHEN e3.encitmdsc is null then e2.encpredsc else e3.encitmdsc end, r1.resobser, r1.resfch
from hosvital.resencu r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto=r.mcdpto and r1.enccod= r.enccod  and r1.encver=r.encver and r1.resctvre= r.resctvre)
LEFT join hosvital.encues2 e2 on (e2.empcod=r1.empcod and e2.enccod= r1.enccod and e2.encver=r1.encver and e2.encpredsc <> '.'  and e2.enculcit <> 0) 
INNER JoIN hosvital.hccom1 h1 on (h1.histipdoc = r1.restdopac and h1.hisckey = r1.resdocpac and h1.hiscsec = r1.resfolpac )
LEFT  join hosvital.encues3 e3 on (e3.empcod=e2.empcod and e3.enccod= e2.enccod and e3.encver=e2.encver and e3.encagrpr = e2.encagrpr and e3.encpre= e2.encpre )
--inner join  hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod= e3.enccod and e4.encver=e3.encver and e4.encagrpr = e3.encagrpr and e4.encpre= e3.encpre  and  e4.encctcore=r1.resencctv)
where  h1.histipdoc='CC'  and h1.hisckey='1000036669' and h1.hiscsec = 87 and r1.enccod='DISINV'
order by 1,2,3,4,5 desc ;

