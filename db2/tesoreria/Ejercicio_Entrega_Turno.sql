select * from hosvital.entturn where turcod= 13576;   -- estaba -237669.00	


update hosvital.entturn set turvlrtot= 0 where turcod= 13576;

select * from hosvital.entturn1
where turcod= 13576;


 update  hosvital.entturn1 set entvlrpag= 0 where turcod= 13576; -- estaba -237669.00


update hosvital.abonos set abosdo=0, aboapl=0, abovlr=0	  where abonum = 165290;

select * from hosvital.reiinter;



select * from hosvital.abonos where abonum = 165290;
select * from hosvital.abonos1 where abonum = 165290;
update  hosvital.abonos1  set  abovalpgo= 0 where abonum = 165290;

select * from hosvital.tmpfac4 where abonum = 165290;
update 
select * from hosvital.maeate4 where abonum = 165290;




select * from hosvital.abonos where abonum = 165289;  -- turno 13574
select * from hosvital.abonos where abonum = 165290;
select * from hosvital.tmpfac4 where abonum = 165290;
select * from hosvital.maeate4 where abonum = 165290;

select * from hosvital.entturn where turcod= 13574;   
select * from hosvital.entturn1 where turcod= 13574;

select * from  hosvital.abonos where abovlrrei=237669;
select * from  hosvital.abonos where abovlrrei=237669;

select * from hosvital.capbas where mpcedu = '52951458';

select * from hosvital.abonos where mpcedu= '52951458'; 

select * from hosvital.pagos where mpcedu= '52951458'; ;

update   hosvital.pagos set pagvlr = 0  where mpcedu= '52951458' and pagnum=241;  -- estaba 237669.00	

-- otro turno

select * from hosvital.entturn where turcod= 13574;   -- estaba -237669.00	


--update hosvital.entturn set turvlrtot= 0 where turcod= 13576;

select * from hosvital.entturn1 where turcod= 13574;

update  hosvital.entturn1 set entvlrpag= 1451013 where   turcod= 13574 and codpago='EF';  -- estaba 1688682.00	

  -- estaba  1688682.00	
select * from hosvital.abonos where turcod= 13574;  -- suma 707112

select * from hosvital.abonos where abonum= 165290; 
select * from hosvital.abonos1 where abonum= 165290; 


--- Caso No1

select * from hosvital.ABONOS WHERE ABONUM =168088 ;  -- turno  13625
select * from hosvital.ABONOS WHERE turcod= 13625 ; 

select * from hosvital.entturn where turcod= 13625;  

select * from hosvital.entturn1 where turcod= 13625;  	
select * from hosvital.ABONOS1 WHERE ABONUM =168088 ;

select * from hosvital.ABONOS WHERE MPCEDU= '79977855'; 


--
update hosvital.abonos set turcod=0 where  ABONUM =168088 ; 

update hosvital.entturn set turvlrtot=turvlrtot - 3200 where turcod= 13625;

update hosvital.entturn1 set entvlrpag=entvlrpag - 3200 where turcod= 13625 and codpago ='EF';

select * from hosvital.entturn1 where  turcod= 13625 and codpago ='EF';


