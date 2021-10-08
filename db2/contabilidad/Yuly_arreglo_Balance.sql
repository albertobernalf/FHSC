select * from hosvital.cuentas where cntcod='51052520';

select * from hosvital.movcont2 where doccod='NCF' AND MVCNRO  = 6795 and  mvccsc=1 ; -- and cntcod ='';
UPDATE hosvital.movcont2  set cntcod= '13012501' where doccod='NCF' AND MVCNRO  = 6795 and mvccsc=1 and cntcod ='';

select * from hosvital.movcont2 where doccod='RCM' AND MVCNRO  = 303 and mvccsc=67;

UPDATE hosvital.movcont2  set cntcod= '51053520' where doccod='RCM' AND MVCNRO  = 303 and cntcod='51052520' and mvccsc=67;

select * from hosvital.nimovcon2 where doccod='NCF' and nimcnro=6795;

update hosvital.nimovcon2 
set nicntcod='13012501'
where doccod='NCF' and nimcnro=6795 and nicntcod='';

select * from hosvital.nimovcon2 where doccod='RCM' and nimcnro=303 and nimc2csc=67;

update hosvital.nimovcon2 
set nicntcod='51053520'
where doccod='RCM' and nimcnro=303 and   nimc2csc=67;

