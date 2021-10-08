select * from hosvital.hojobl where clicod='57417662' and cntvig=2019 and hojnumobl='2802';
select * from hosvital.movcxc where mccnumobl ='2802';

select * from hosvital.hojobl where clicod='57417662' and cntvig=2019 and hojnumobl='2802';

select * from hosvital.movcont2 where doccod='FV' AND MVCNRO=80 AND MVCNAT='D'  AND CNTCOD='13050501' ;  -- ORDER BY  ;  -- 110

select COUNT(*) from hosvital.hojobl where  EMPCOD='02' AND  cntvig=2019 and CNTCOD='13050501' AND HOJFCHOBL >= '2019-12-01 00:00:00'  ;  -- ORDER BY HOJNUMOBL;

select * from hosvital.hojobl where  EMPCOD='02' AND  cntvig=2019 and CNTCOD='13050501' AND HOJFCHOBL >= '2019-12-01 00:00:00'  ORDER BY HOJNUMOBL ;


UPDATE HOSVITAL.HOJOBL H
SET (H.HOJVLROBL , H.HOJTOTDEB) = (SELECT X.MVCVLR, X.MVCVLR
		           FROM HOSVITAL.MOVCONT2 X
		          WHERE X.EMPCOD=H.EMPCOD  AND X.CNTVIG=H.CNTVIG AND X.DOCCOD='FV' AND X.MVCNRO = 80 AND X.CNTCOD=H.CNTCOD  AND X.MVCDOCRF1   = H.HOJNUMOBL  AND X.MVCNAT='D')
where  H.EMPCOD='02' AND  H.cntvig=2019 and H.CNTCOD='13050501' AND H.HOJFCHOBL >= '2019-12-01 00:00:00' ; --  AND H.HOJNUMOBL='2802'  ;
