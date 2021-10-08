select * from hosvital.nicuentas where empcod='01' and nicntvig=2019 and nicntcod like ( '1301%');
select * from hosvital.nicuentas where empcod='01' and nicntvig=2019 and nicntcod like ( '1302%');
select * from hosvital.nicuentas where empcod='01' and nicntvig=2019 and nicntcod like ( '1303%');


-- Primer reporte ,, con la sumatoria de las cuentas saldo actual Clientes Operacionales

select * from hosvital.terceros;
select * from HOSVITAL.NIRSMGEN where nircemp='01' and substring(nirccue,1,4) in ('1301','1302','1303') and nircanio=2019 and nircmes=8 and trccod='900156264' order by trccod;

select substring(n.nicntcod,1,4),ter.trccod,ter.trcrazsoc,sum(gen.nircgant)
FROM HOSVITAL.NICUENTAS   N, HOSVITAL.NIRSMGEN GEN, HOSVITAL.TERCEROS TER
WHERE N.EMPCOD='01' AND N.NICNTVIG=2019 AND N.EMPCOD = GEN.NIRCEMP AND  N.NICNTCOD=SUBSTRING( GEN.NIRCCUE ,1,4) AND GEN.NIRCANIO=2019 AND  GEN.NIRCMES=8 and
                GEN.TRCCOD=TER.TRCCOD AND  substring(N.NICNTCOD,1,4)  IN  ('1301','1302','1303') 
GROUP BY ter.trccod,ter.trcrazsoc,substring(n.nicntcod,1,4)
ORDER BY substring(n.nicntcod,1,4), TER.TRCRAZSOC;

-- Validacion

select * from hosvital.nirsmgen where nircemp='01' and nircanio=2019 and nircmes=8 and trccod='900156264' and  substring(nirccue,1,4)  IN  ('1301','1302','1303');


-- Segundo reporte saldo actual  y cada cuenta por separado

select * from HOSVITAL.NIRSMGEN where nircemp='01' and substring(nirccue,1,8) in ('22050501','22050502') and nircanio=2019 and nircmes=8  --and trccod='900156264' 
order by trccod;

select substring(n.nicntcod,1,8),ter.trccod,ter.trcrazsoc,sum(gen.nircgant)
FROM HOSVITAL.NICUENTAS   N, HOSVITAL.NIRSMGEN GEN, HOSVITAL.TERCEROS TER
WHERE N.EMPCOD='01' AND N.NICNTVIG=2019 AND N.EMPCOD = GEN.NIRCEMP AND  N.NICNTCOD=SUBSTRING( GEN.NIRCCUE ,1,8) AND GEN.NIRCANIO=2019 AND  GEN.NIRCMES=8 and
                GEN.TRCCOD=TER.TRCCOD AND  substring(N.NICNTCOD,1,8)  IN  ('22050501','22050502') 
GROUP BY ter.trccod,ter.trcrazsoc,substring(n.nicntcod,1,8)
ORDER BY substring(n.nicntcod,1,8), TER.TRCRAZSOC;


-- tercer reporte cuentas por aparte y  cuentas saldo actual

select * from HOSVITAL.NIRSMGEN where nircemp='01' and substring(nirccue,1,8) in ('23352501','23353001','23353002','23354501') and nircanio=2019 and nircmes=8  --and trccod='900156264' 
order by trccod;

select substring(n.nicntcod,1,8),ter.trccod,ter.trcrazsoc,sum(gen.nircgant)
FROM HOSVITAL.NICUENTAS   N, HOSVITAL.NIRSMGEN GEN, HOSVITAL.TERCEROS TER
WHERE N.EMPCOD='01' AND N.NICNTVIG=2019 AND N.EMPCOD = GEN.NIRCEMP AND  N.NICNTCOD=SUBSTRING( GEN.NIRCCUE ,1,8) AND GEN.NIRCANIO=2019 AND  GEN.NIRCMES=8 and
                GEN.TRCCOD=TER.TRCCOD AND  substring(N.NICNTCOD,1,8)  IN  ('23352501','23353001','23353002','23354501')  
GROUP BY ter.trccod,ter.trcrazsoc,substring(n.nicntcod,1,8)
ORDER BY substring(n.nicntcod,1,8), TER.TRCRAZSOC;

-- cuarto reporte sumatoria  creditos - debitos x tercero

select * from HOSVITAL.NIRSMGEN where nircemp='01' and substring(nirccue,1,2) in ('41') and nircanio=2019 and nircmes=8  --and trccod='900156264' 
order by trccod;



select substring(n.nicntcod,1,2),ter.trccod,ter.trcrazsoc,sum(gen.nircgdeb -  gen.nircgcre)
FROM HOSVITAL.NICUENTAS   N, HOSVITAL.NIRSMGEN GEN, HOSVITAL.TERCEROS TER
WHERE N.EMPCOD='01' AND N.NICNTVIG=2019 AND N.EMPCOD = GEN.NIRCEMP AND  N.NICNTCOD=SUBSTRING( GEN.NIRCCUE ,1,2) AND GEN.NIRCANIO=2019 AND  GEN.NIRCMES=8 and
                GEN.TRCCOD=TER.TRCCOD AND  substring(N.NICNTCOD,1,2)  IN   ('41')  
GROUP BY ter.trccod,ter.trcrazsoc,substring(n.nicntcod,1,2)
ORDER BY substring(n.nicntcod,1,2), TER.TRCRAZSOC;