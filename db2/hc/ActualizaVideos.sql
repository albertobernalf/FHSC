select * from hosvipru.terceros where trccod in ('57417662','79445890','900130719','5764219');

select * from hosvipru.maeate where mpcedu in 
('57417662','79445890','900130719','5764219');

select * from hosvipru.movcont3
where doccod='FV' AND MVCNRO=88;


select * from hosvipru.movcont2
where doccod='FV' AND MVCNRO=88;

select * from hosvipru.movcont2
where doccod='FV' AND MVCNRO=86;

select * from hosvipru.movcont2
where doccod='FV' AND MVCNRO=84 AND TRCCOD IN   ('57417662','79445890','900130719','5764219');

SELECT * FROM HOSVIPRU.HOJOBL WHERE HOJNUMOBL IN ('2914','2914','2918');
SELECT * FROM HOSVIPRU.HOJOBL WHERE CLICOD ='79445890';



select * from hosvipru.movcont3
where doccod='FV' AND MVCNRO=88;

select * from hosvipru.movcont2
where doccod='FV' AND MVCNRO=88;

SELECT * FROM HOSVIPRU.HOJOBL WHERE EMPCOD = '01' AND HOJFCHOBL >= '2020-02-18 00:00:00' ;  --  AND

select * from hosvital.maepro;

select * from hosvipru.rptrstp;
select * from hosvipru.videodx ORDER BY VDXFHRARC;

select * from hosvipru.IMAPER;

select * from hosvital.IMAPRONQ WHERE HISCKEY= '219549' ; --   AND HISCSEC =3 ;


select * from hosvital.IMAPRONQ WHERE IMAFECHOR>= '2020-01-01 00:00:00' ORDER BY IMAFECHOR ;

UPDATE hosvital.IMAPRONQ
SET  IMARUTPRO = '\\192.168.2.52\imagenes\3-219549-CC-3-881202-1.pdf'
where hisckey = '219549' and hiscsec= 3 and codpro='881202';

select * from hosvipru.IMAPRONQ where hisckey = '41889411' ; -- and hiscsec= 51;


