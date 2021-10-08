select * from hosvital.maepab11 where mpcedu= '38220022' order by hiscamfec,hiscamhor;
select * from hosvital.ingresos where mpcedu='38220022' order by ingcsc;  -- 705 -S
select * from hosvital.tmpfac where tfcedu='38220022' ; -- 705-S /  17

select * from hosvital.maepab1 where  MPNUMC IN ('705-S','704-S');

/*

UPDATE  hosvital.maepab1 
SET  MPDISP='1',MPUCED='38220022',MPUDOC='CC',MPCTVIN=1,MPC¡ULTCTVO=744
where  MPNUMC='705-S';

UPDATE  hosvital.maepab1 
SET  MPDISP='1',MPUCED='401182',MPUDOC='CC',MPCTVIN=6,MPC¡ULTCTVO=744
where  MPNUMC='609;


*/

select * from hosvital.maepab11 where mpcedu= '401182' order by hiscamfec,hiscamhor;
select MPTDOC,MPCEDU,MPCODP,MPNUMC,INGCSC from hosvital.ingresos where mpcedu='401182' order by ingcsc;  -- 705 -S
select TFTDOC,TFCEDU, TCM* from hosvital.tmpfac where tfcedu='401182' ; -- 705-S /  17

select * from hosvital.maepab1 where  MPNUMC IN ('609','704-S');