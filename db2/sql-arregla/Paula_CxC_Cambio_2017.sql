select * from hojobl
where cntvig=2016 and (hojtotdeb - hojtotcre) > 0 and
   HojFchObl >= '2016-01-01 13:48:59' and  HojFchObl <= '2016-12-26 16:31:52'



select SUM(hojtotdeb) - SUM(HojTotCre)
 from hojobl
where cntvig=2017 and (hojtotdeb - hojtotcre) > 0  and
   HojFchObl >= '2016-01-01 13:48:59' and  HojFchObl <= '2016-12-26 16:31:52'

--46100123055.75	18905486458.90
--46100112355.75	18905486458.90
--27194625896.85

-- 20050915543.15
-- 20050926243.15   -- 2016

-- diferencia 10700

select SUM(hojtotdeb) - SUM(HojTotCre)
 from hojobl
where cntvig=2016 and (hojtotdeb - hojtotcre) > 0  and
   HojFchObl >= '2016-01-01 13:48:59' and  HojFchObl <= '2016-12-26 16:31:52'

select * from hojobl
where cntvig=2016 and (hojtotdeb - hojtotcre) = 10700

select * from hojobl
where  HojNumObl  in ('2234856'   ,   '2390587'        ,'2218021'        )
order by hojnumobl


select * from TERCEROS where TrcCod='20191887'


select * from hojobl
where cntvig=2016 and (hojtotdeb - hojtotcre) > 0 and
   HojFchObl >= '2001-01-01 13:48:59' and  HojFchObl <= '2016-12-26 16:31:52'
   order by  HojFchObl

 select * from HOJOBL  where HojNumObl in ('1011606','1015758')