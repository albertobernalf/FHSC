select * from hosvital.audserv  where doccod='AU8' ORDER BY AUTFECSOL, AUTHORSOL;
select facfch,count(*) from hosvital.maeate where facfch >= '2021-01-01' group by facfch;

select mvcnat, sum(mvcvlr) from hosvital.movcont2 where doccod='FAR' and mvcnro = 644785 group by mvcnat;

/*
C	332064.00	
D	361011.00	

*/

select * from hosvital.movcont2 where doccod='FAR' and mvcnro = 644785   order  by mvcnat;



select mvcnat, substring(mvcdet,1,10) , sum(mvcvlr)
 from hosvital.movcont2 
where doccod='FAR' and mvcnro = 644785   and mvcnat='C' 
group by mvcnat, substring(mvcdet,1,10) ;

/*
C	Suministro	48706.00	
C	Procedimie	283358.00	

*/

select sum(mavatp), sum(mavlrtot)
from hosvital.maeate2
where   mpnfac = 644785  and maesanup<>'S' and fcptpotrn='F';

select mvcnat, substring(mvcdet,1,10) , sum(mvcvlr)
 from hosvital.movcont2 
where doccod='FAR' and mvcnro = 644785   and mvcnat='C' 
group by mvcnat, substring(mvcdet,1,10) ;

SELECT prcodi,mavatp  from hosvital.maeate2
where mpnfac = 644785  and maesanup<>'S' and fcptpotrn='F' and mavatp not    in (select mvcvlr from hosvital.movcont2 where doccod = 'FAR' AND mvcnro = 644785 and substring(mvcdet,1,10) like ('%Procedi%')) ;

/* factura No  644785
error en :
901107	3814
903033	20288
907106	4845


*/

select * from hosvital.movcont2 where DOCCOD ='FAR' AND MVCNRO = 644785 and mvcnat='C'  AND substring(mvcdet,1,10) like ('%Procedi%901107%') ;


SELECT prcodi,mavatp  from hosvital.maeate2
where mpnfac = 646674 and maesanup<>'S' and fcptpotrn='F' and mavatp not    in (select mvcvlr from hosvital.movcont2 where doccod = 'FAR' AND mvcnro = 646674 and substring(mvcdet,1,10) like ('%Procedi%')) ;

/*
 factura No  644785

890413   	40000.00	
	

*/
