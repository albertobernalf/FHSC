select * from hosvital.nicuentas where nicntvig=2020 and  empcod='01' and nicntcod >= '13301501' order by nicntcod;;  -- and 

select * from hosvipru.ingresos where ingfecadm>='2020-08-15 00:00:00';

select *    from hosvipru.tmprep; -- 133020     

select * from hosvipru.nirsmaux where nircanio=2020 and nircmes=1  ;     

select * from hosvipru.nirsmgen where nircanio>=2010  and nircmes>=1  and trccod='900156264' and nirccue = '13301501' ;

	      
	      

select * from hosvipru.nirsmgen  	 where nircanio=2020 and nircmes=1 and nirccue >= '13301501' order by nirccue;
select * from hosvipru.nirsmgen where nircemp='01' and nircanio = 2020  and nircmes=1  and trccod='900156264'  and   nirccue   in ('13301501','13302002','13302001') order  by nircmes,trccod;
select * from hosvipru.nimovcon2  where  nimc2anio>=2020 and nimc2mes=1 and trccod='900156264'  and nicntcod  in ('13301501','13302002','13302001')   order  by nicntcod ; 

select  *   from hosvipru.nimovcon1 where nimc1fch >= '2020-01-01 00:00:00' and nimc1fch <= '2020-01-31 23:59:59' and (doccod,nimcnro ) in (select doccod,nimcnro  from hosvipru.nimovcon2 where    trccod='900156264' and nimc2vl=392000) ;

select * from hosvipru.nimovcon2  where   nimc2anio>=2001 and  nimc2mes>=1 and trccod='900156264'  and   nicntcod='13301501';

select * from hosvipru.nimovcon2  where  nimc2anio>=2010 and nimc2mes>=1 and trccod='900156264' and  nimc2vl=392000;  


select * from  hosvipru.nirsmgen  where nircanio=2020 and nircmes=1 and   nircgant=392000;

-- SELECT *  FROM  HOSVIPRU.NIMOVCON1 WHERE DOCCOD='ACN' AND NIMCNRO=235;


SELECT *  FROM HOSVITAL.NIMOVCON2 ;
SELECT *  FROM  HOSVITAL.NICUENTAS;
SELECT COUNT(*)  FROM HOSVITAL.NIMOVCON2 WHERE EMPCOD='01' AND NIMC2ANIO=2020;  --5659871		
SELECT COUNT(*)  FROM  HOSVITAL.NICUENTAS  WHERE EMPCOD='01' AND NICNTVIG=2020;       -- 3622	
	



