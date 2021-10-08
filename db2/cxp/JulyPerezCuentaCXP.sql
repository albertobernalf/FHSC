select * from hosvital.terceros where trccod = '52066553';
select * from hosvital.cuentas where empcod='03' and cntcod in ('51050503','51050520') and cntvig=2020;
select * from hosvital.cuentas where empcod='03' order by cntcod;


/*
ESTABA null	
51050503            	 -
51050520            	

                	

*/

update hosvital.cuentas
set cntint='CXP', cntoblrf1='S' -- ESTABA EN N
 where empcod='03' and cntcod in ('51050503','51050520') and cntvig=2020;