select * from hosvital.audserv where autcedu='390917';
SElect * from hosvital.audserv2 where doccod='AU7' AND AUTCSC IN (40636,40710); -- 879301
select * from hosvital.audserv where autcedu='390917';
SElect * from hosvital.audserv3 where doccod='AU7' AND AUTCSC IN  (40636,40710);
SELECT * FROM HOSVITAL.INGRESOS where mpcedu ='390917';

select * from hosvital.tmpfac where tfcedu ='390917';

update  hosvital.audserv
set autingcsc=2, autctvin=2
 where autcedu='34531877' and autcsc = 30167;

select mactving  from hosvital.maeate where mpcedu = '390917';

/* con sto solucione una 

update  hosvital.audserv
set autestado='A' --  cscvo en R = 40636	
 where autcedu='390917' and autcsc = 40636;


update  hosvital.audserv2
set autestreg='A' --  cscvo en R = 40636	
 where doccod='AU7'  and autcsc = 40636;

update  hosvital.audserv3
set AUTCPTEST='A' --  cscvo en R = 40636	
 where doccod='AU7'  and autcsc = 40636;