select * from hosvital.movcont3 where doccod='FAR' and mvcnro = 360419;
select * from hosvital.movcont2 where doccod='FAR' and mvcnro = 360419;
select *from hosvital.hojobl where hojnumobl ='360419' and cntvig=2019;
select * from hosvital.movcxc where mccnumobl= '360419' and cntcod='13023501';

select * from hosvital.admglo11 where mpnfac = 360419         	
;

update  hosvital.hojobl 
set hojtotdeb = 536940
where hojnumobl ='360419' and cntvig=2019 and  cntcod='13023501'; 

-- este es el UPDATE GENERAL

select hojnumobl,cntcod,hojtotdeb,hojtotcre from hosvital.hojobl where hojnumobl ='360419' and cntvig=2019;

--Este el el UPDATE general

update hosvital.hojobl h -- estaba en  536940
set h.hojtotdeb = (select ifnull(sum(m.mccvlr),0)
	from hosvital.movcxc m
	where m.empcod= h.empcod and m.mccnumobl=h.hojnumobl and m.cntcod=h.cntcod  and mccnat='D')
where   empcod='01' and h.cntvig=2019 and h.cntcod= '13023501' and h.hojnumobl in   ( '360419',  '361219',  '363373',  '364312',  '364799',  '365968',  '366372',  '366431',  '366531',  '367450',  '367968',  '368080',  '368279',  '370383',  '373665',  '373667',  '373691',  '375339',  '375491',  '375601',  '355221',  '377364',  '377373',  '377925',  '378863',  '380676',  '381628',  '352861',  '380400',  '381493',  '382422',  '364965',  '364978', 
 '366165',  '366223',  '367156',  '367318',  '369757',  '370038',  '370933',  '371106',  '371936',  '372737',  '372979',  '373256',  '374038', '374257',  '374357');


-- 352861         	
-- 364799
-- 382422      
-- 381628         	
   	


select hojnumobl,cntcod,hojtotdeb,hojtotcre , hojfchobl from hosvital.hojobl
where cntvig=2019 and hojnumobl in   ( '360419',  '361219',  '363373',  '364312',  '364799',  '365968',  '366372',  '366431',  '366531',  '367450',  '367968',  '368080',  '368279',  '370383',  '373665',  '373667',  '373691',  '375339',  '375491',  '375601',  '355221',  '377364',  '377373',  '377925',  '378863',  '380676',  '381628',  '352861',  '380400',  '381493',  '382422',  '364965',  '364978', 
 '366165',  '366223',  '367156',  '367318',  '369757',  '370038',  '370933',  '371106',  '371936',  '372737',  '372979',  '373256',  '374038', '374257',  '374357') and cntcod='13023501';

-- 48 filas


