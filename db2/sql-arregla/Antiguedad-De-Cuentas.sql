-- ESte e solo Compensar con el corte de la prueba

SELECT [EMPCOD], [CntCod], [MCCNumObl], [MCCFch], [MENNIT], [CLICOD], [MCDpto], [DOCCOD], [MvCxCNro], [MCCCsc], [CntVig
] FROM [MOVCXC] WITH (NOLOCK) WHERE ([CntCod] = '13050501') and ([MCCFch] <= convert( DATETIME,'2016-12-07 23:59:59',120)) and ([EMPCOD] = '1') and 
([CLICOD] = '860066942') ORDER BY [CntCod], [CLICOD], [MENNIT], [MCCFch], [MCCNumObl]

-- Este es de compensar con el corte de prueba


SELECT [EMPCOD], [CntCod], [MCCNumObl], [MCCFch], [MENNIT], [CLICOD], [MCDpto], [DOCCOD], [MvCxCNro], [MCCCsc], [CntVig] 
FROM [MOVCXC] WITH (NOLOCK)
 WHERE ([CntCod] = '13050501') and ([MCCFch] <= convert( DATETIME,'2016-11-30 23:59:59',120)) and ([EMPCOD] = '1') and 
([CLICOD] = '860066942') ORDER BY [CntCod], [CLICOD], [MENNIT], [MCCFch], [MCCNumObl]  -- 750161


-- ESste seria el consolidado para tosad

SELECT [EMPCOD], [CntCod], [MCCNumObl], [MCCFch], [MENNIT], [CLICOD], [MCDpto], [DOCCOD], [MvCxCNro], [MCCCsc], [CntVig] FROM [MOVCXC] WITH (NOLOCK)
 WHERE ([CntCod] = '13050501') and ([MCCFch] <= convert( DATETIME,'2016-11-30 23:59:59',120)) and ([EMPCOD] = '1') 
 --and ([CLICOD] = '860066942') 
 ORDER BY [CntCod], [CLICOD], [MENNIT], [MCCFch], [MCCNumObl] -- reg.total = 1949281

