SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNuOb='BTA-411'

SELECT * FROM HOJOBLPRV WHERE PrvCod = '800053110' ORDER BY HOPFCHOBL

SELECT * FROM COMPCAB WHERE DOCCOD='COT'

SELECT * FROM ENTRALM WHERE DOCCOD='COT'
SELECT * FROM sys.TABLES

SELECT * FROM ORDTRAB WHERE DOCCOD='COT' AND  OrdTrbNro =   1875
SELECT * FROM ORDTRAB1 WHERE DOCCOD='COT' AND  OrdTrbNro =   1875

SELECT [DOCCOD], [EMPCOD], [PrvCod], [OrdTrbEst], [OrdTipDis], [OrdTrbNro], [OrdTrbDsc], [OrdTrbFch], [MCDpto] 
FROM [ORDTRAB] WITH (NOLOCK) 
WHERE ([EMPCOD] = '1'  and [PrvCod] =  '800053110' ) AND ([OrdTipDis] =  ''  or  ''  = '') AND ([OrdTrbEst] = 'O') AND 
([OrdTrbNro] >=  0 AND  [OrdTrbNro]=1875 )
 ORDER BY [EMPCOD], [PrvCod], [OrdTrbNro] DESC

 SELECT * FROM MOVCONT3 WHERE DOCCOD='COT' AND MvCNro  = 1875
 SELECT * FROM MOVCONT2 WHERE DOCCOD='COT' AND MvCNro  = 1875

 BEGIN TRANSACTION;
 UPDATE ORDTRAB
 SET OrdTrbEst= 'O' -- EStaba en F
 WHERE DOCCOD='COT' AND  OrdTrbNro =   1875
 -- COMMIT
 -- ROLLBACK

 select * from movcont2 where MvCDocRf1= 'BTA-411'  -- 31926
 SELECT * FROM HOJOBLPRV WHERE PrvCod = '800053110' and hopnoobl= 'BTA-411' ORDER BY HOPFCHOBL
SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro= 31926


-- los arreglos son :

 BEGIN TRANSACTION;
 UPDATE HOJOBLPRV
 SET  HOPDocCau='CFA', HOPNroCau=31926
  WHERE PrvCod = '800053110' and hopnoobl= 'BTA-411'
  -- COMMIT;
  SELECT * FROM MOVCONT2

  BEGIN TRANSACTION;
  INSERT INTO MOVCXP
  SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MVCVLR,MVCVLR,CNUCOD,CNUSUB,CNCCOD,CntSub,'','','N','',''
  FROM MOVCONT2
  WHERE DOCCOD='CFA' AND MvCNro = 31926 AND MvCNat='C' AND CntCod='23353001'

  -- ROLLBACK;
  -- COMMIT
  SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNuOb='BTA-411'
   select * from movcont2 where MvCDocRf1= 'BTA-411'  -- 31926  --  133440.00
SELECT * FROM HOJOBLPRV WHERE PrvCod = '800053110' AND HOPNoObl ='BTA-411'  -- 133440.00