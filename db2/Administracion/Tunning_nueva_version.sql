SELECT PQCLASS,
       PQENDDT,
       PQSTARTDT,
       PQSTATUS,
       PQNAME,
       PQID,
       PQEMP,
       PQMESSAGE
    FROM PQUEUE
    WHERE (PQCLASS = ?
              OR PQCLASS = ?)
          AND (PQEMP = ?)
          AND (PQSTATUS = ?)
          AND (PQSTARTDT >= TIMESTAMP(?))
    ORDER BY PQID
    FOR FETCH ONLY;

--Query de Balancedeprueba


SELECT RsmMes,       RsmAno,       RsmCtnCon,       RsmEmpCod,       RsAxDeb,       RsmIdx
    FROM hosvital.RSMAUX
    WHERE (RsmEmpCod = '01')
          AND (RsmCtnCon >= '1')
          AND (RsmCtnCon <= '999999')
        -- AND (SUBSTR(RsmCtnCon, CAST(1 AS INTEGER), CAST(4 AS INTEGER)) = '5')
          AND (RsmAno = 2019)
          AND (RsmMes >= 9)
          AND (RsmMes <= 9)
    ORDER BY RsmEmpCod,             RsmCtnCon,             RsmAno,             RsmMes
    FOR FETCH ONLY


-- query de contabilizacion

SELECT C.CNTNVL,
       TP.TPCCLSCAP,
       C.CNTNAT,
       SUM(
           CASE
               WHEN M2.MVCNAT = 'D' THEN M2.MVCVLR
               ELSE 0
           END),
       SUM(
           CASE
               WHEN M2.MVCNAT = 'C' THEN M2.MVCVLR
               ELSE 0
           END),
       (SELECT RSAXSACT
               FROM RSMAUX
               WHERE RSMEMPCOD = :H :H
                     AND RSMCTNCON = :H :H
                     AND RSMANO = :H :H
                     AND RSMMES = :H :H),
       (SELECT RSMSALACT
               FROM RESMCUE
               WHERE RSMEMPCOD = :H :H
                     AND RSMCTNCON = :H :H
                     AND MCDPTO = :H :H
                     AND CNUCOD = :H :H
                     AND CNUSUB = :H :H
                     AND CNCCOD = :H :H
                     AND CNTSUB = :H :H
                     AND TRCCOD = :H :H
                     AND RSMANO = :H :H
                     AND RSMMES = :H :H)
    INTO : H: H,
         : H: H,
         : H: H,
         : H: H,
         : H: H,
         : H: H,
         : H: H
    FROM MOVCONT3 M3,
         MOVCONT2 M2,
         CUENTAS C,
         TIPPCUE1 TP
    WHERE M2.EMPCOD = :H :H
          AND M2.DOCCOD = :H :H
          AND M2.MVCNRO = :H :H
          AND M2.MCDPTO = :H :H
          AND M2.MVCCSC = :H :H
          AND M3.EMPCOD = M2.EMPCOD
          AND M3.DOCCOD = M2.DOCCOD
          AND M3.MVCNRO = M2.MVCNRO
          AND M3.MCDPTO = M2.MCDPTO
          AND M2.EMPCOD = C.EMPCOD
          AND M2.MVCANIO = C.CNTVIG
          AND M2.CNTCOD = C.CNTCOD
          AND TP.TPCCOD = :H :H
          AND TP.TPCCODCAP = C.TPCCODCAP
    GROUP BY C.CNTNVL,
             TP.TPCCLSCAP,
             C.CNTNAT
