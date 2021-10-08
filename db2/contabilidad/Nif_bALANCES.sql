select substring(n2.nicntcod,1,4) cuenta,
sum(case when n2.nimc2nat = 'D' then n2.nimc2vlr end)        as debitos,
sum(case when n2.nimc2nat = 'C' then n2.nimc2vlr end)        as creditos ,
sum(case when n.nicntnat = 'C' then case when n2.nimc2nat = 'C' then n2.nimc2vlr else -  n2.nimc2vlr end 
             when n.nicntnat = 'D' then case when n2.nimc2nat = 'D' then n2.nimc2vlr else -  n2.nimc2vlr end  end) as saldo
from hosvital.nimovcon2  n2, hosvital.nicuentas n
 where n2.empcod='03' and n2.mcdpto='003' and n2.doccod='SIF'   and n2.nicntvig=2019 and  n2.nicntcod= n.nicntcod and nicnttrm='D'
group by substring(n2.nicntcod,1,4)
order by substring(n2.nicntcod,1,4);

select  * from hosvital.nicuentas;




select * from hosvital.nimovcon2 where empcod='03' and doccod <> 'SIF'  ORDER BY  NIMC2ANIO, NIMC2MES ;

select * from hosvital.nimovcon2 where empcod='03' and doccod = 'SIF'  ORDER BY  NIMC2ANIO, NIMC2MES ;


-- Documentos contables NIIF

select substring(n1.nicntcod,1,4) as cuenta, 
(
SELECT  sum(n2.nimc2vlr) 
from hosvital.nimovcon2 n2
where n1.empcod=n2.empcod and  n1.mcdpto=n2.mcdpto  and n1.doccod=n2.doccod and n1.nicntvig=n2.nicntvig and substring(n1.nicntcod,1,4)  =  substring(n2.nicntcod,1,4)  and n2.nimc2nat ='C'

) as creditos,
(
SELECT  sum(n2.nimc2vlr)  
from hosvital.nimovcon2 n2
where n1.empcod=n2.empcod  and n1.mcdpto=n2.mcdpto   and n1.doccod=n2.doccod and n1.nicntvig=n2.nicntvig and substring(n1.nicntcod,1,4)  =  substring(n2.nicntcod,1,4)   and n2.nimc2nat ='D'
) as debitos
from hosvital.nimovcon2  n1
where n1.empcod='03' and n1.mcdpto='003' and n1.doccod='SIF'   and n1.nicntvig=2019
group by substring(n1.nicntcod,1,4)
order by substring(n1.nicntcod,1,4);


-- Balance de prueba NIIF Amparo de niños  a enero/2019

select substring(nirccue,1,4) cuenta,sum(nircgant)saldo_ant, sum(nircgdeb) debitos, sum(nircgcre) creditos,sum(nircgact) saldo_actual
from HOSVITAL.NIRSMGEN 
where NIRCANIO=2019 and NIRCMES=1 and NIRCEMP='03'
group by substring(nirccue,1,4)
order by substring(nirccue,1,4);

-- CUAL DEBERIA SER EL BALANCE A ENERO 31 DEL 2019

SELECT * FROM  HOSVITAL.NIRSMGEN WHERE NIRCEMP='03' AND NIRCANIO=2019 AND NIRCMES=1   ORDER BY NIRCCUE;




