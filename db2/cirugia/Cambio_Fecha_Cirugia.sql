select * from hosvital.procir where procircod=129553; -- profec = 2019-08-06	

update hosvital.procir 
set profec= '2020-12-21', profsep= '2020-12-21'
where procircod=129553;

select * from hosvital.procir1 where procircod=114878;
select * from hosvital.procir2 where procircod=114878;

select * from hosvital.turqui where procircod=114878 ;

update  hosvital.turqui   -- estaba 2019-08-06	
set tuqfching='2019-08-02', tuqfchsal = '2019-08-02'
where procircod=114878 ;

select * from hosvital.turqui1 where tuqcns = 90338 ; --   where procircod=114878 ;

select * from hosvital.descirmed where codcir= 114878;
select * from hosvital.descirmed1 where codcir= 114878;

update hosvital.descirmed set fecfincir='2019-08-02', fecinicir='2019-08-02'   where codcir= 114878;  -- estaba  2019-08-06
	
select * from hosvital.monrecans where procircod=114878 ; --  No hay Record Anestesico


