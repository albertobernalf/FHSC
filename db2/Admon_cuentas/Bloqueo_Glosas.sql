select * from hosvital.adglosas where mpnfac =624486;

select mpnfac , gloinduso, gloindusu , glousuncf, glousrmod
from hosvital.adglosas where glofchrec >='2020-01-01'  and  mpnfac =623024;


update hosvital.adglosas 
set gloinduso='', gloindusu=''	
where mpnfac =623024;


select * from hosvital.adglosas1 where mpnfac =624486;

select * from hosvital.maeate  where mpnfac =624486;