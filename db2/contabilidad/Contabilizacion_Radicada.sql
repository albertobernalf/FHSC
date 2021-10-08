select * from hosvital.hojobl where hojnumobl ='645613';

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO IN (649107,649113);
SELECT * FROM HOSVITAL.MOVCXC WHERE DOCCOD='FAR' AND MCCNUMOBL  IN (645613);


update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='645613' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900298372'
 where empcod='01' and nihojno ='645613' and nicntvig=2021;

-- segunda

select * from hosvital.hojobl where hojnumobl ='645613';

update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='645615' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900298372'
 where empcod='01' and nihojno ='645615' and nicntvig=2021;

-- tercera

select * from hosvital.hojobl where hojnumobl ='645613';

update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='644798' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900298372'
 where empcod='01' and nihojno ='644798' and nicntvig=2021;


-- cuarta

select * from hosvital.hojobl where hojnumobl ='645613';

update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='646683' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900298372'
 where empcod='01' and nihojno ='646683' and nicntvig=2021;

-- quinta

select * from hosvital.hojobl where hojnumobl ='645613';

update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='646795' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900298372'
 where empcod='01' and nihojno ='646795' and nicntvig=2021;

-- sexta

select * from hosvital.hojobl where hojnumobl ='645613';

update hosvital.hojobl
set clicod='900156264'
 where empcod='01' and hojnumobl ='646833' and cntvig=2021;


select * from hosvital.nihojobl  where nihojno ='645613';

update hosvital.nihojobl
set clicod='900156264'
 where empcod='01' and nihojno ='646833' and nicntvig=2021;

-- septima

select * from hosvital.hojobl where hojnumobl ='565993';

update hosvital.hojobl
set clicod='900298372'
 where empcod='01' and hojnumobl ='565993' and cntvig=2021;

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO=565993;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO=648878;
select mpnfac,facfch  from hosvital.maeate where mpnfac = 565993;


select * from hosvital.admglo11 where mpnfac = 565993;
select * from hosvital.admglo01 where aglremnr= 22334;
select * from hosvital.hojobl where hojnumobl = '565993';
SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL  IN ('634284','634287','646833'	 );

select * from hosvital.admglo11 where aglfrdfac  >= '2021-01-01';
sele