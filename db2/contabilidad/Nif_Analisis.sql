-- Esto es FUNDACION

select *  from hosvital.resmcue where rsmano=2019 and rsmmes=1 and rsmempcod='02' order by rsmctncon;

select substring(rsmctncon,1,4) cuenta,sum(rsmsalant)saldo_ant, sum(rsmdeb) debitos, sum(rsmcre) creditos,sum(rsmsalact) saldo_actual
from hosvital.resmcue 
where rsmano=2019 and rsmmes=5 and rsmempcod='02'
group by substring(rsmctncon,1,4)
order by substring(rsmctncon,1,4);

select * from hosvital.resmcue where rsmempcod='02'  and rsmano=2019  and rsmmes=5;


select substring(rsmctncon,1,4) cuenta,sum(rsmsalant)saldo_ant, sum(rsmdeb) debitos, sum(rsmcre) creditos,sum(rsmsalact) saldo_actual
from hosvital.resmcue 
where rsmano=2019 and rsmmes=5 and rsmempcod='01'
group by substring(rsmctncon,1,4)
order by substring(rsmctncon,1,4);


select * from hosvital.rsmaux where  rsmempcod='02' and rsmano=2019 and rsmmes=5 order by rsmctncon;

SELECT * FROM HOSVITAL.NIRSMGEN WHERE NIRCANIO=2019 AND NIRCMES=3 AND NIRCEMP='02';

select substring(nirccue,1,4) cuenta,sum(rsmsalant)saldo_ant, sum(rsmdeb) debitos, sum(rsmcre) creditos,sum(rsmsalact) saldo_actual
from HOSVITAL.NIRSMGEN 
where NIRCANIO=2019 and NIRCMES=5 and NIRCEMP='01'
group by substring(rsmctncon,1,4)
order by substring(rsmctncon,1,4);

-- Esto es Amparo de nilños


--  Veamos el documento Local

select * from hosvital.movcont2 where empcod='03' and doccod='SIF'  AND MVCNRO=1;

select substring(cntcod,1,4) cuenta,
sum(case when mvcnat = 'D' then mvcvlr end)        as debitos,
sum(case when mvcnat = 'C' then mvcvlr end)        as creditos 
from hosvital.movcont2 
 where empcod='03' and doccod='SIF'  
group by substring(cntcod,1,4)
order by substring(cntcod,1,4);

--  Veamos el documento NIIF

select * from hosvital.nimovcon2 where empcod='03' and doccod='SIF'  ;
select * from hosvital.nimovcon2 where empcod='03' and doccod='SIF'  AND TRCCOD='860025553' AND NIMC2VLR=1500000 ;

-- Documentos contables NIIF los del cargue

select substring(nicntcod,1,4) cuenta,
sum(case when nimc2nat = 'D' then nimc2vlr end)        as debitos,
sum(case when nimc2nat = 'C' then nimc2vlr end)        as creditos 
from hosvital.nimovcon2 
 where empcod='03' and doccod='SIF'   and nicntvig=2019  and nimc2anio=2019 and nimc2mes=1 
group by substring(nicntcod,1,4)
order by substring(nicntcod,1,4);

-- Movimiento de Enero del 2019

select substring(nicntcod,1,4) cuenta,
sum(case when nimc2nat = 'D' then nimc2vlr end)        as debitos,
sum(case when nimc2nat = 'C' then nimc2vlr end)        as creditos 
from hosvital.nimovcon2 
 where empcod='03' and doccod !='SIF'   and nicntvig=2019 and nimc2anio=2019 and nimc2mes=1
group by substring(nicntcod,1,4)
order by substring(nicntcod,1,4);


-- Documentos contables NIIF esto seria movimiento del mes de Enero del 2019

select substring(n2.nicntcod,1,4) cuenta,
sum(case when n2.nimc2nat = 'D' then n2.nimc2vlr end)        as debitos,
sum(case when n2.nimc2nat = 'C' then n2.nimc2vlr end)        as creditos
from hosvital.nimovcon2  n2 
where n2.empcod='03'  and  n2.mcdpto='003' and n2.doccod!='SIF'  and n2.nicntvig=2019 and  n2.nimc2anio=2019 and n2. nimc2mes=1 
group by substring(n2.nicntcod,1,4)
order by substring(n2.nicntcod,1,4);

-- Aqui opero teniendo en cuenta la cuenta

select substring(n2.nicntcod,1,4) cuenta,
sum(case when n2.nimc2nat = 'D' then n2.nimc2vlr end)        as debitos,
sum(case when n2.nimc2nat = 'C' then n2.nimc2vlr end)        as creditos  ,
sum(case when n.nicntnat = 'C' then case when n2.nimc2nat = 'C' then n2.nimc2vlr else -n2.nimc2vlr end 
                 when n.nicntnat =  'D' then case when n2.nimc2nat = 'D' then n2.nimc2vlr else -n2.nimc2vlr end end) as saldo 
from hosvital.nimovcon2  n2, hosvital.nicuentas n
 where n2.empcod='03' and  n2.mcdpto='003' and n2.doccod !='SIF'   and n2.nicntvig=2019 and  n2.nimc2anio=2019 and n2. nimc2mes=1 and  n2.nicntcod= n.nicntcod  and nicnttrm='D' 
and n2.empcod= n.empcod  and n2.nicntvig=n.nicntvig
group by substring(n2.nicntcod,1,4)
order by substring(n2.nicntcod,1,4);

select * from hosvital.nicuentas where nicntvig=2019   and empcod='03' order by nicntcod;


-- Balance de prueba NIIF Amparo de niños  a enero/2019

select substring(nirccue,1,4) cuenta,sum(nircgant)saldo_ant, sum(nircgdeb) debitos, sum(nircgcre) creditos,sum(nircgact) saldo_actual
from HOSVITAL.NIRSMGEN 
where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03' and  mcdpto='003'
group by substring(nirccue,1,4)
order by substring(nirccue,1,4);

-- Aqui no hay saldos inciales


select * from HOSVITAL.NIRSMGEN where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03' and  mcdpto='003';

-- Veamos saldos iniclaes del auxiliar

select * from hosvital.nirsmaux where  NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03'  order by  nirccue ;
select * from hosvital.nirsmaux where  NIRCANIO=2019 and NIRCMES=3 and NIRCEMP='03'  order by  nirccue ;
select * from hosvital.nirsmauxx  where  NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03'  order by  nirccue ;

select substring(nirccue,1,4) cuenta,sum(nircaant)saldo_ant, sum(nircadeb) debitos, sum(nircacre) creditos,sum(nircaact) saldo_actual
from hosvital.nirsmaux 
where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03' 
group by substring(nirccue,1,4)
order by substring(nirccue,1,4);


-- Intentemos subir saldos a loa Auxiliars de niif

select nicntcod cuenta, nimc2nat, nimc2vlr 
from hosvital.nimovcon2 
where empcod='03' and doccod='SIF'  and nicntvig=2019  and nimc2anio=2019 and nimc2mes=1 
order by nicntcod;


select substring(n2.nicntcod,1,8) cuenta,
sum(case when n2.nimc2nat = 'D' then n2.nimc2vlr end)        as debitos,
sum(case when n2.nimc2nat = 'C' then n2.nimc2vlr end)        as creditos  ,
sum(case when n.nicntnat = 'C' then case when n2.nimc2nat = 'C' then n2.nimc2vlr else -n2.nimc2vlr end 
                 when n.nicntnat =  'D' then case when n2.nimc2nat = 'D' then n2.nimc2vlr else -n2.nimc2vlr end end) as saldo 
from hosvital.nimovcon2  n2, hosvital.nicuentas n
 where n2.empcod='03' and  n2.mcdpto='003' and n2.doccod ='SIF'   and n2.nicntvig=2019 and  n2.nimc2anio=2019 and n2. nimc2mes=1 and  n2.nicntcod= n.nicntcod  and nicnttrm='D' 
and n2.empcod= n.empcod  and n2.nicntvig=n.nicntvig
group by substring(n2.nicntcod,1,8)
order by substring(n2.nicntcod,1,8);


update hosvital.nirsmaux  n1
set n1.nircaant =	 (select sum(case when n.nicntnat = 'C' then case when n2.nimc2nat = 'C' then n2.nimc2vlr else -n2.nimc2vlr end 
		                 when n.nicntnat =  'D' then case when n2.nimc2nat = 'D' then n2.nimc2vlr else -n2.nimc2vlr end end) 
		from hosvital.nimovcon2  n2, hosvital.nicuentas n
		 where n2.empcod= n1.nircemp and n2.nicntcod= n1.nirccue and n2.nimc2anio=n1.nircanio and n2. nimc2mes=n1.nircmes and
		n2.empcod=n1.nircemp and n2.empcod='03' and  n2.mcdpto='003' and n2.doccod ='SIF'   and n2.nicntvig=2019 and  n2.nimc2anio=2019 and n2. nimc2mes=1 and  n2.nicntcod= n.nicntcod  and nicnttrm='D' 
		and n2.empcod= n.empcod  and n2.nicntvig=n.nicntvig
		)
where n1.nircemp='03' and n1.nircaant is null  and n1.nircanio=2019 and n1.nircmes = 1  -- and nirccue = '11100504' 
and   (n1.nircanio,n1.nircmes,n1.nirccue) in (select nimc2anio,nimc2mes,nicntcod from  hosvital.nimovcon2 n2 where n2.empcod='03' and n2.doccod='SIF'   and n2.nicntvig=2019  and n2.nimc2anio=2019 and n2.nimc2mes=1 );

select * from hosvital.nirsmaux where  NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03'  order by  nirccue ;

-- Para reversar 

update hosvital.nirsmaux  n1
set n1.nircaant = null
where n1.nircemp='03' and n1.nircanio=2019 and n1.nircmes = 1 ;

-- Ahora aqui el script por tercero en la General

select * from HOSVITAL.NIRSMGEN  where nircemp='03' and mcdpto='003' and nircanio=2019 and nircmes=1  order by nirccue, trccod;


select substring(nirccue,1,4) cuenta,sum(nircgant)saldo_ant, sum(nircgdeb) debitos, sum(nircgcre) creditos,sum(nircgact) saldo_actual
from HOSVITAL.NIRSMGEN 
where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03' and  mcdpto='003'
group by substring(nirccue,1,4)
order by substring(nirccue,1,4);

-- este seria ekl UPDATE

update hosvital.nirsmgen  n1
set n1.nircgant =	 (select sum(case when n.nicntnat = 'C' then case when n2.nimc2nat = 'C' then n2.nimc2vlr else -n2.nimc2vlr end 
		                 when n.nicntnat =  'D' then case when n2.nimc2nat = 'D' then n2.nimc2vlr else -n2.nimc2vlr end end) 
		from hosvital.nimovcon2  n2, hosvital.nicuentas n
		 where n2.empcod= n1.nircemp and n2.nicntcod= n1.nirccue and n2.trccod= n1.trccod and n2.nimc2anio=n1.nircanio and n2. nimc2mes=n1.nircmes and
		n2.empcod=n1.nircemp and n2.empcod='03' and  n2.mcdpto='003' and n2.doccod ='SIF'   and n2.nicntvig=2019 and  n2.nimc2anio=2019 and n2. nimc2mes=1 and  n2.nicntcod= n.nicntcod  and nicnttrm='D' 
		and n2.empcod= n.empcod  and n2.nicntvig=n.nicntvig
		)
where n1.nircemp='03' and  n1.nircgant is null  and n1.nircanio=2019 and n1.nircmes = 1 --  and nirccue = '11100504' 
and   (n1.nircanio,n1.nircmes,n1.nirccue,n1.trccod) in (select nimc2anio,nimc2mes,nicntcod,trccod from  hosvital.nimovcon2 n2 where n2.empcod='03' and n2.doccod='SIF'   and n2.nicntvig=2019  and n2.nimc2anio=2019 and n2.nimc2mes=1 );

select * from hosvital.nirsmgen where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03' and  mcdpto='003' order by  nirccue,trccod;

select * from hosvital.nimovcon2 where doccod= 'SIF' AND nicntcod='11100504'	order by trccod;  -- D	1257434.52

select * from hosvital.nicuentas where empcod='03' and nicntvig= 2019	order by nicntvig,nicntcod;

-- Para reversar 

update hosvital.nirsmgen  n1
set nircgant = null
where n1.nircemp='03' and n1.nircanio=2019 and n1.nircmes = 1 ;


 -- Este es el UPDATE quye actualizaria el saldo actual


update hosvital.nirsmgen  n1
set n1.nircgact =	 (select case when n.nicntnat = 'C' then n2.nircgant + n2.nircgcre - n2.nircgdeb  
		                 when n.nicntnat =  'D' then n2.nircgant - n2.nircgcre + n2.nircgdeb   end
		from hosvital.nirsmgen  n2, hosvital.nicuentas n
		 where n2.nircemp=n1.nircemp and n2.mcdpto= n1.mcdpto and n2.trccod=n1.trccod and n2.nircanio =n1.nircanio and n2.nircmes= n1.nircmes and n2.nirccue=n1.nirccue and  n.nicntcod=n1.nirccue  and n.nicnttrm='D' and n2.nircemp= n.empcod  
		)
where n1.nircemp='03' and  n1.nircgant is null  and n1.nircanio=2019 and n1.nircmes = 1  and nirccue = '11100504' 
and   (n1.nircanio,n1.nircmes,n1.nirccue,n1.trccod) in (select nimc2anio,nimc2mes,nicntcod,trccod from  hosvital.nimovcon2 n2 where n2.empcod='03' and n2.doccod='SIF'   and n2.nicntvig=2019  and n2.nimc2anio=2019 and n2.nimc2mes=1 );




select * from hosvital.nicuentash where empcod='03'   ; -- and nicntvig= 2019	order by nicntvig,nicntcod;
