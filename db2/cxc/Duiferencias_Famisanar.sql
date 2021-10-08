select * from hosvital.hojobl where hojnumobl = '430551'  and cntvig=2019;  --  10844241.00    104685.00	10844241.00	


select * from 
hosvital.movcxc
where mccnumobl = '407689' ; -- and cntcod='13020501' ;  -- and cntvig=2019;



select mccnumobl ,  case when mccnat='C' then sum(mccvlr) end as credito,  case when mccnat='D' then sum(mccvlr) end as debito
from hosvital.movcxc
where mccnumobl = '407689'   and cntcod='13020501'
group by mccnumobl,mccnat;


select hojnumobl, hojvlrobl,hojtotdeb, hojtotcre  from hosvital.hojobl where hojnumobl = '423872'  and cntvig=2019;  --  10844241.00    104685.00	10844241.00	


select doccod, mvcxcnro, cntvig, mccfch, mccnumobl, cntcod, mccnat, mccvlr
 from 
hosvital.movcxc
where mccnumobl = '481104'    ;  -- and cntcod='13020501' ;  -- and cntvig=2019;


-- ESTO LO MIRA EL REPORTEADOR

select mccnumobl ,  case when mccnat='C' then sum(mccvlr) end as credito,  case when mccnat='D' then sum(mccvlr) end as debito
from hosvital.movcxc
where mccnumobl = '423872'   and cntcod='13020501'
group by mccnumobl,mccnat; -- Las diferebcvias estan en las NGR

select * from hosvital.movcxc where   mccnumobl = '521993' ;

select  * from hosvital.movcxc where doccod='NGR' and mvcxcnro=31005 and mccnumobl= '423872';
-- Diferencias en NGR y  y RGLy DRC

select * from hosvital.maeate where mpnfac = 407689;

-- en contabilidad

select hojnumobl, hojtotdeb - hojtotcre
from hosvital.hojobl
where cntvig=2019 and hojnumobl in 
('364278','380364','407689','419062','419631','420153','423872','424838','427184','427651','430551','430556','430751','430795','430832','432652','434040','434265','435467','435581','438332','438580','438653','439684','441207','441704','443789','446010','446027','446062','447785','453616','455532','457613','459322','459709','460230','466271','467138','468310','468324','472557','473836','473932','477014','477935','481104','483396','484351','487092','487396','489362','490201','490292','490719','490907','493994','495647','499246','501136','506570','506698','506866','507600','508170','508284','509733','509826','509883','510179','511446','513708','513819','515228','516898','517015','517250','517694','517744','518063','518812','519177','520019','520708','520882','520889','521432','521477','521699','521840','521993');

-- Facturas con diferencias entre la Contabilidad y la pantalla de cartera

/*
489362,
490292,
490719,
507600,
499246
*/

SELECT HOJNUMOBL, CLICOD,CNTCOD, HOJVLROBL, HOJTOTDEB, HOJTOTCRE FROM HOSVITAL.HOJOBL where cntvig=2019 and hojnumobl in ('489362','490292','490719','507600','499246') ORDER BY HOJNUMOBL;
/*

489362         	940514.00	940514.00	959684.00	
489362         	940514.00	44073.00	24903.00	
490292         	2391997.00	2391997.00	2389843.00	
490292         	2389843.00	28247.00	30401.00	
490719         	28226444.00	28226444.00	20845368.25	
499246         	2114661.00	2114661.00	1706793.00	
499246         	2114661.00	1.00	0.00	
507600         	3030615.00	3030615.00	2585975.00	
507600         	3030615.00	444640.00	0.00	
*/

-- Como es ellio del saldo


-- Este es el Query del Reporteador devuelve el total de DEBITOS- CREDITOS incluyendo radicaciones, de la movcxc el juego completo

select mccnumobl,sum(case when mccnat='D' then mccvlr end) as Debitos, sum(case when mccnat='C' then mccvlr end) as Creditos,
(sum(case when mccnat='D' then mccvlr end)  -  sum(case when mccnat='C' then mccvlr end)) as Saldo
 from hosvital.movcxc
 where mccnumobl in 
('364278','380364','407689','419062','419631','420153','423872','424838','427184','427651','430551','430556','430751','430795','430832','432652','434040','434265','435467','435581','438332','438580','438653','439684','441207','441704','443789','446010','446027','446062','447785','453616','455532','457613','459322','459709','460230','466271','467138','468310','468324','472557','473836','473932','477014','477935','481104','483396','484351','487092','487396','489362','490201','490292','490719','490907','493994','495647','499246','501136','506570','506698','506866','507600','508170','508284','509733','509826','509883','510179','511446','513708','513819','515228','516898','517015','517250','517694','517744','518063','518812','519177','520019','520708','520882','520889','521432','521477','521699','521840','521993')
group by mccnumobl;


-- Vamos a cuentgas x cobrar

select * from hosvital.movcxc where mccnumobl = '423872' ;             -- and cntcod='13020501';

select mccnumobl,sum(case when mccnat='D' then mccvlr end) as Debitos, sum(case when mccnat='C' then mccvlr end) as Creditos,
(sum(case when mccnat='D' then mccvlr end)  -  sum(case when mccnat='C' then mccvlr end)) as Saldo
 from hosvital.movcxc
 where mccnumobl in ('423872') and  cntcod='13020501'
group by mccnumobl;

--  31.005 
