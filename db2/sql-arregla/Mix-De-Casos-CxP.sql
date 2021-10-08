SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNuOb='BTA-411'

SELECT * FROM HOJOBLPRV WHERE PrvCod = '800053110' ORDER BY HOPFCHOBL

SELECT * FROM COMPCAB WHERE DOCCOD='COT'

SELECT * FROM ENTRALM WHERE DOCCOD='COT'
SELECT * FROM sys.TABLES

SELECT * FROM ORDTRAB WHERE DOCCOD='COT' AND  OrdTrbNro =   1875
SELECT * FROM ORDTRAB1 WHERE DOCCOD='COT' AND  OrdTrbNro =   1875

SELECT [OrdTrbEst],[DOCCOD], [EMPCOD], [PrvCod], [OrdTrbEst], [OrdTipDis], [OrdTrbNro], [OrdTrbDsc], [OrdTrbFch], [MCDpto] 
FROM [ORDTRAB] WITH (NOLOCK) 
WHERE ([EMPCOD] = '1'  and [PrvCod] =  '800053110' ) AND ([OrdTipDis] =  ''  or  ''  = '') AND ([OrdTrbEst] = 'O') AND 
([OrdTrbNro] >=  0  AND  [OrdTrbNro]=1875 )
 ORDER BY [EMPCOD], [PrvCod], [OrdTrbNro] DESC

  SELECT * FROM MOVCONT3 WHERE DOCCOD='COT' AND MvCNro  = 1875
 SELECT * FROM MOVCONT2 WHERE DOCCOD='COT' AND MvCNro  = 1875



 ,N,N'',N'',0

 select * from movcont2 where MvCDocRf1= 'BTA-411'

 -- Este es otro caso

 SELECT * FROM MOVCXC WHERE MCCNUMOBL = '2380041'
SELECT * FROM HOJOBL WHERE HOJNUMOBL = '2380041'  -- 800088702      
SELECT * FROM TERCEROS WHERE TrcCod= '800088702' --EPS Y MEDICINA PREPAGADA SURAMERICANA S.A.   
SELECT MASALCXC,* FROM MAEATE WHERE MPNFAC =   2380041           -- 210782.00    
SELECT * FROM TERCEROS WHERE TRCCOD= '2380041'

SELECT [CLICOD], [HojIndFac], [CntVig], [DOCCOD], [HojNumObl], [MCDpto], [EMPCOD], [HojTotCre], [HojTotDeb], [CntCod] FROM [HOJOBL] WITH (NOLOCK)
 WHERE ([EMPCOD] = '1' and [MCDpto] = '001' and [CntVig] = 2017) and ([HojNumObl] = '2380041') and ([DOCCOD] = 'FAC') ORDER BY [EMPCOD], [MCDpto], [CntVig]

 SELECT * FROM HOJOBL WHERE CntVig=2017


 -- tercer caso generacion de cuentas por pagar

 SELECT COUNT(*) FROM HOJOBLPRV WHERE CntVig=2017
 SELECT COUNT(*) FROM HOJOBLPRV WHERE CntVig=2016  -- 7487


 -- OTRO CASO :

 select * from HOJOBLPRV where CntVig=2016 and (HOPTotCre - HOPTotDEB) <>0   --hAY 1346  Obligaciones
 select * from HOJOBLPRV where CntVig=2017 and (HOPTotCre - HOPTotDEB) <>0   --Hy 1301

 SELECT * FROM HOJOBLPRV WHERE HOPNoObl= '39113'
 SELECT * FROM MOVCXP WHERE MVCXPNUOB= '39113'

 -- Primer Query

 SELECT A.PrvCod,A.CNTVIG,A.HOPNoObl,A.CNTCOD, A.HOPTotCrE,A.HOPTotDeb,B.CntVig,B.HOPNoObl,B.CNTCOD, B.HOPTotCrE,B.HOPTotDeB                     
 FROM HOJOBLPRV A, HOJOBLPRV B
 WHERE A.EMPCOD=B.EMPCOD AND A.PrvCod=B.PrvCod AND A.HOPNoObl= B.HOPNoObl AND A.MCDpto=B.MCDpto AND
        A.CntVig=2016 AND B.CntVig=2017 AND (A.HOPVLROBL<>B.HOPVLROBL OR A.HOPTotCre <> B.HOPTotCre OR A.HOPTotDeb<> B.HOPTotDeb)  -- Hay 29
ORDER BY A.HOPNOOBL


SELECT * FROM MOVCXP WHERE 

SELECT * FROM HOJOBLPRV WHERE HOPNoObl = '39113'

-- Segundo Query


SELECT * FROM MOVCXP
WHERE MVCXPNUOB IN (
 SELECT A.HOPNoObl
 FROM HOJOBLPRV A, HOJOBLPRV B
 WHERE A.EMPCOD=B.EMPCOD AND A.PrvCod=B.PrvCod AND A.HOPNoObl= B.HOPNoObl AND A.MCDpto=B.MCDpto AND
        A.CntVig=2016 AND B.CntVig=2017 AND (A.HOPVLROBL<>B.HOPVLROBL OR A.HOPTotCre <> B.HOPTotCre OR A.HOPTotDeb<> B.HOPTotDeb))  -- Hay 36

ORDER BY MVCXPNUOB




