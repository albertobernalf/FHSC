select * from hosvital.hojobl where empcod='01'and cntvig=2019 and hojnumobl='485239';

select * from hosvital.movcont2 where doccod='FAD' and mvcnro =1387;

update hosvital.hojobl 
set hojtotdeb= 18680484
where empcod='01'and cntvig=2019 and hojnumobl='485239'and cntcod='13026501';
