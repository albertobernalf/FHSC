select * from hosvital.hojobl where hojnumobl in  ('571909');  -- 860002184      / 860002183    

select * from hosvital.hojobl where hojnumobl in  ('572339','575779','575383','572720','575013','507289','509247','559732','559545');  	
select * from hosvital.hojobl where hojnumobl in  ('556902','560309');  	-- hascen falta 

 select * from hosvital.hojobl where hojnumobl in  ('575383','575779');  -- RNA  6788	

select * from hosvital.movcxc where mccnumobl ='573135' ;  -- esta en el DRC  23236	
select * from hosvital.movcxc where mccnumobl ='571124' ;  -- esta en el DRC  23236	

select * from hosvital.movban  where  mvbdocdet = 22236; --  esta en el RNA 5375

select * from hosvital.hojobl where hojnumobl in  ('565295','567296'); 

update hosvital.hojobl
set hojesthom='N'
 where hojnumobl  in    ('569782','574666','575852','575950','576587','576596','576606','576917','576996','577020','577067','577107','577429','577468','577568','577800','577835','577864','577943','577945','578147',
'578346','578353','578357','578358','578765','578779','579152','579340','579394','579430','579443','579509','579533','579720','579721','579722','579741','579926','579947','580406','580413','580415','580424','580435','580436',
'580437','580444','580579','581044','581067','581789','582120','582458') and  hojesthom ='';

select * from hosvital.terceros where trccod in ('860002183','860002184');      	

select * from hosvital.movban where doccod='RNA' and mvbnrocmp=6788;

-- solidadfio

 select * from hosvital.hojobl where hojnumobl in  ('560978');  

select * from hosvital.movcxc where mccnumobl='575421';
 select * from hosvital.hojobl where hojnumobl in  ('575421','576069');

select * from hosvital.hojobl where hojnumobl in  ('560978'); 

SELECT * FROM HOSVITAL.MOVBAN WHERE  MVBVLR=115334;  --- rna 6862	

select * from hosvital.hojobl where  cntvig = 2019 and clicod = '800251440' and hojtotdeb <> hojtotcre ;

select * from hosvital.hojobl where  cntvig=2019 and hojnumobl in    ('590550','594514','594517','594520','594521','594542','594624','594549','594668','594761','594899','594912','594913','594914','594997','595367','595384','595535')  ; -- and  hojesthom ='' order by hojnumobl; 

update hosvital.hojobl
set hojesthom='N'
 where  empcod='01' and cntvig=2019 and hojnumobl  in   ('590550','594514','594517','594520','594521','594542','594624','594549','594668','594761','594899','594912','594913','594914','594997','595367','595384','595535')  and  hojesthom ='';

SELECT * FROM HOSVITAL.HOJOBL;

SELECT * FROM HOSVITAL.HOJOBL WHERE CNTVIG = 2019 AND CLICOD='830113831' AND  HOJTOTCRE <> HOJTOTDEB  AND    hojesthom =''  ORDER BY HOJNUMOBL;

update hosvital.hojobl
set hojesthom='N'
 where  empcod='01' and cntvig=2019 and  CLICOD='830113831' AND  HOJTOTCRE <> HOJTOTDEB  AND    hojesthom ='';

SELECT * FROM HOSVITAL.HOJOBL WHERE CNTVIG = 2019 AND CLICOD='830113831' AND  HOJTOTCRE <> HOJTOTDEB  AND    hojesthom ='N'  ORDER BY HOJNUMOBL;

SELECT * FROM HOSVITAL.HOJOBL WHERE  HOJNUMOBL = '617244';

SELECT * FROM HOSVITAL.HOJOBL WHERE  CLICOD = '901097473' AND HOJFCHOBL >= '2020-01-01 00:00:00';



