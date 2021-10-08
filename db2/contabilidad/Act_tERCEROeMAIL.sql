select * from hosvital.terceros;
select trccod, trcrazsoc, trcemail from hosvital.terceros where trcemail <> '';

select trccod, trcrazsoc, trcemail, length(trcemail) from hosvital.terceros where trcemail <> '';
select count(*) from hosvital.terceros;


SELECT  trccod, trcrazsoc, trcemail, length(trcemail), length(rtRIM( trcemail))
   FROM  hosvital.terceros 
 where trcemail <> '';


--SELECT  trccod, trcrazsoc, trcemail, length(trcemail), length(rtRIM( trcemail))
select count(*)
   FROM  hosvital.terceros 
 where trcemail <> '' and  length(trcemail) <> length(rtRIM( trcemail)) ;


update hosvital.terceros
set trcemail= rtrim(trcemail)
where  trccod= '900635852'   and trcemail <> ''  and  length(trcemail) <> length(rtRIM( trcemail)) ;


update hosvital.terceros
set trcemail= rtrim(trcemail)
where   trcemail <> ''  and  length(trcemail) <> length(rtRIM( trcemail)) ;
