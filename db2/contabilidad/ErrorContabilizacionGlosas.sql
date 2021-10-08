select * from hosvital.hojobl where cntvig=2020 and hojnumobl in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');

update hosvital.hojobl 
set clicod ='860002184'
where cntvig=2020 and hojnumobl in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');

select * from hosvital.movcxc where mccnumobl ='567605';

select * from hosvital.adglosas where mpnfac = '567605';

select * from hosvital.movcont3 where doccod='NGR' AND MVCNRO = 34178;
select * from hosvital.movcont2 where doccod='NGR' AND MVCNRO = 34178;

select * from hosvital.docucon where doccod='NGR';
select * from hosvital.adglosas where mpnfac  in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');
select * from hosvital.adglosas1 where mpnfac  in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');

UPDATE hosvital.adglosas
SET GLOEDOCONO='S' -- ESTABA EN N
where mpnfac  in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');

UPDATE hosvital.adglosas
SET GLOconnot='S' -- ESTABA EN N
where mpnfac  in ('567605','567897','571072','571862','571989','572720','577173','578097','578102','578269','578291','579612','584095','584115','584122','585017');

UPDATE hosvital.adglosas
SET GLOCONREC='S' -- ESTABA EN N
where mpnfac  in ('590484','5691525','593543','594665','596445','601676','604137','607875','616204','616302','616757');

select * from hosvital.adglosas where mpnfac  in ('590484','5691525','593543','594665','596445','601676','604137','607875','616204','616302','616757');

UPDATE hosvital.adglosas
SET GLOEDOCONO='S' -- ESTABA EN N
where mpnfac  in  ('590484','5691525','593543','594665','596445','601676','604137','607875','616204','616302','616757');

UPDATE hosvital.adglosas
SET GLOconnot='S' -- ESTABA EN N
where mpnfac  in  ('590484','5691525','593543','594665','596445','601676','604137','607875','616204','616302','616757');

UPDATE hosvital.adglosas
SET GLOCONREC='S' -- ESTABA EN N
where mpnfac  in ('590484','5691525','593543','594665','596445','601676','604137','607875','616204','616302','616757');




