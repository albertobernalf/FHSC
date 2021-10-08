select * from hosvital.audserv  where autcedu='9512042';

select * from hosvital.audserv2  where autcsc in (31581	); -- and autserv='332201';
select * from hosvital.audserv3 where autcsc in (31581	);
select * from hosvital.audserv4 where autcsc in (31581	);

select * from hosvital.audserv2  where autcsc in (30954	); -- and autserv='332201';
select * from hosvital.audserv3 where autcsc in (30954	);
select * from hosvital.audserv4 where autcsc in (30954	);


select * from hosvital.procir where procircod =127483;
select * from hosvital.procir1 where procircod =127483;
select * from hosvital.procir2 where procircod =127483;
select * from hosvital.procir3 where procircod =127483;
select * from hosvital.procir4 where procircod =127483;


select * from hosvital.procir where procircod  IN (128140 ,128099 ,128081); -- estaba en 4

select * from hosvital.procir1 where procircod  IN (128140 ,128099 ); 
select * from hosvital.procir2 where procircod  IN (128140 ,128099 ); 

UPDATE hosvital.procir 
SET PROESTA =1
where procircod  IN  (128140 ,128099 );



select * from hosvital.procir1 where procircod =127390;
select * from hosvital.procir2 where procircod =127390;
select * from hosvital.procir3 where procircod =127390;
select * from hosvital.procir4 where procircod =127390;

SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU  = '9512042';

SELECT * FROM HOSVITAL.TURQUI where procircod =127483;;
SELECT * FROM HOSVITAL.TURQUI1; -- where procircod =127483;;


update hosvital.audserv2
set autestreg='A' -- ESTABA E
 where autcsc in (31581	) AND  autserv='332201' AND AUTSERVFCH= '2020-10-05 15:24:02.00000' AND autestreg='E'  ;