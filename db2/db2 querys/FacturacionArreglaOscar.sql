select * from hosvital.abonos where mpcedu ='23741256';
select * from hosvital.maeate  where mpcedu  = '23741256';

select * from hosvital.maeate4 where mpnfac = 571141;	

select * from hosvital.tmpfac where tfcedu  = '23741256';

select tfcedu, TFVaAb,TFVAPU ,TFVPaU ,TFVNPU from hosvital.tmpfac where tfcedu ='23741256';

select * from hosvital.maeate where mpcedu = '23741256';


--sdo caso


select * from hosvital.abonos where mpcedu ='1081014';
select * from hosvital.tmpfac4 where tfcedu = '1081014';
select * from hosvital.maeate  where mpcedu = '1081014';
select * from hosvital.maeate4 where mpnfac in ('566369','568992','569679','569702','569767','571100');	



update  hosvital.abonos
set abosdo= 1601869.00		
where mpcedu = '1081014' and abonum = 160271	
	 and abovlr= 1601869.00	
	
;


select * from hosvital.tmpfac where tfcedu  = '1081014';

select tfcedu, tmctving,TFVaAb,TFVAPU ,TFVPaU ,TFVNPU from hosvital.tmpfac where tfcedu ='1081014';

update hosvital.tmpfac
set TFVNPU= 0
 where tfcedu ='1081014' and tmctving=12;


select * from hosvital. tmpfac1   where tfcedu ='1081014' and tmctving=12 and tfvatp=3243069;

select * from hosvital. tmpfac2   where tfcedu ='1081014' and tmctving=12 and tfvats=3243069;


select * from hosvital.tmpfac4 where tfcedu  = '1081014';

select * from hosvital.tmpfac where tffchi >='2019-03-01';


select * from hosvital.abonos1 where abonum in (158375	,
158389	,
159480	,
159481	,
159639	,
159673	,
159897	,
159990	,
160271	
);

select * from hosvital.maepac where mpcedu = '1081014';

select * from hosvital.maeemp31 where mennit ='90';

select * from hosvital.portar1 where ptcodi='143' and prcodi ='772405'; 

SELECT * FROM HOSVITAL.MAEEMP32 WHERE MENNIT ='90';


SELECT * FROM HOSVITAL.PORTARS1 WHERE PSCODI='11' AND MSRESO;
SELECT * FROM HOSVITAL.PORTARS1 WHERE PSCODI='11' AND MSRESO ='MEDPICW08';

