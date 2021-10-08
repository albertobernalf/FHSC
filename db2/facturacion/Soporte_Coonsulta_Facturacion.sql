select  count(*) from hosvital.admlog;


select * from hosvital.tmpfac where tfcedu = '20734023';
select * from hosvital.maepab11 where  mpnumc = 'SCI03'
order by hiscamfec,hiscamhor;

select * from hosvital.maepab11 where  mpnumc = 'OBH14'
order by hiscamfec,hiscamhor;

/*
34	505-A	1305	O	2019-04-28	22:17:14	1000253528     	CC 	F3ZIUCI   	1	
34	505-A	1306	L	2019-04-30	23:46:45	1000253528     	CC 	F3ZIUCI   	1	


41	SCI03	499	O	2019-05-08	07:17:15	1000253528     	CC 	,B>Ñ>,.?  	1	
*/
select * from hosvital.tmpfac where tfcedu = '1000469344';

select m11.mpnumc,year(m11.hiscamfec)||' '||month(m11.hiscamfec)||' '||day(m11.hiscamfec)||' '||m11.hiscamhor,m11.hiscamedo,m11.hiscnsing
 from hosvital.maepab11 m11
 where   m11.mpcedu = '1000256008'  and m11.hiscnsing = 2  and hiscamedo='O' and year(m11.hiscamfec)||' '||month(m11.hiscamfec)||' '||day(m11.hiscamfec)||' '||m11.hiscamhor =
		(select max(year(m111.hiscamfec)||' '||month(m111.hiscamfec)||' '||day(m111.hiscamfec)||' '||m111.hiscamhor)
		from hosvital.maepab11 m111
		 where  m111.mptdoc = m11.mptdoc and m111.mpcedu = m11.mpcedu and m111.hiscnsing = m11.hiscnsing  and m111.hiscamedo=m11.hiscamedo  and m111.mpcodp=m11.mpcodp and m111.mpnumc=m11.mpnumc)  and
     not exists ( select mx.mpnumc 
	from hosvital.maepab11  mx
	where mx.mptdoc=m11.mptdoc and mx.mpcedu = m11.mpcedu and mx.hiscnsing = m11.hiscnsing and mx.hiscamedo='L' and mx.mpcodp=m11.mpcodp and mx.mpnumc=m11.mpnumc and 
		(year(mx.hiscamfec)||' '||month(mx.hiscamfec)||' '||day(mx.hiscamfec)||' '||mx.hiscamhor) > (year(m11.hiscamfec)||' '||month(m11.hiscamfec)||' '||day(m11.hiscamfec)||' '||m11.hiscamhor)
              )


;

select * from hosvital.maepab11 where mpcedu = '20335773' order by hiscamfec,hiscamhor;
select * from hosvital.maepab1 where mpuced ='20335773';
select * from hosvital.ingresos where mpcedu = '20335773';
select * from hosvital.tmpfac where tfcedu = '20335773';
select * from hosvital.maepab;
select * from hosvital.capbas;
