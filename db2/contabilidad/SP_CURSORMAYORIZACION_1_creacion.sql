SET SCHEMA HOSVINEW; --Cambiar Esquema


CREATE OR REPLACE PROCEDURE HOSVINEW.SP_CURSORMAYORIZACION_1 (IN v_EMPCOD CHAR(2),  IN v_DOCCOD CHAR(3),   IN v_MvCNro DECIMAL(15,0), IN v_MCDpto CHAR(9), IN v_MvCCsc INT,              IN v_MvCAnio SMALLINT, 
												   IN v_MvCMes SMALLINT, IN v_CNTCOD CHAR(20),  IN v_MvCCmpAj CHAR(1),     IN v_TpCCod CHAR(1), IN v_CnUCod CHAR(3),          IN v_CnUSub CHAR(3), 
                                                   IN v_CntSub CHAR(9),  IN v_TrcCod CHAR(15), 	IN v_CNCCOD CHAR(9),       IN v_MvCNat CHAR(1), IN v_MvCVlrLc  DECIMAL(17,2), IN v_MovTipo CHAR(1), /*L --> LOCAL /  N --> NIIF */
												   IN v_DELETE CHAR(1))
LANGUAGE SQL
BEGIN
    DECLARE v_TPCCLSCAP 			 CHAR(1);
    DECLARE v_mes_ant 				 SMALLINT;
    DECLARE v_anio_ant 				 SMALLINT;
    DECLARE v_CntNvl 				 SMALLINT;
    DECLARE v_MvDebito 				 DECIMAL(17,2);
    DECLARE v_MvCredito 			 DECIMAL(17,2);
    DECLARE v_RsAxDeb 				 DECIMAL(17,2);
    DECLARE v_RsAxCre 				 DECIMAL(17,2);
    DECLARE v_RsmDeb 				 DECIMAL(17,2);
    DECLARE v_RsmCre 				 DECIMAL(17,2);
    DECLARE v_RsAxSAct 				 DECIMAL(17,2);
	DECLARE v_SaldoActualMesAnterior DECIMAL(17,2);
    DECLARE v_RsAxSAnt 				 DECIMAL(17,2);
    DECLARE v_RsmSalAct 			 DECIMAL(17,2);
	DECLARE v_RsmSalAnt				 DECIMAL(17,2);
	DECLARE v_SaldoGenMesAnterior	 DECIMAL(17,2);
    DECLARE v_ULTIMOID 				 DECIMAL(18,0);
    DECLARE v_RsmIdx 				 DECIMAL(18,0);
    DECLARE v_RsmIdn 				 DECIMAL(18,0);
    DECLARE v_ParmDCieA 			 CHAR(3);
    DECLARE v_SWCie 				 CHAR(1);
	DECLARE v_CntVig				 SMALLINT;
    DECLARE v_CntNat				 CHAR(1);
	
	/*ACTUALIZA MESES*/
	DECLARE v_CntMes			SMALLINT;
	DECLARE v_CntAnio			SMALLINT;
	DECLARE v_SaldoAntRsmaux	DECIMAL(17,2);
	DECLARE v_SaldoAntResmcue	DECIMAL(17,2);

	/*NIIF*/
	DECLARE v_NIRCAANT	DECIMAL(17,2);
	DECLARE v_NIRCAACT	DECIMAL(17,2);
	DECLARE v_NIRCGACT	DECIMAL(17,2);
	DECLARE v_NIRCGANT	DECIMAL(17,2);
	DECLARE	v_NIRCGDEB	DECIMAL(17,2);
	DECLARE v_NIRCGCRE	DECIMAL(17,2);
	
   --INSERT INTO Temprep (Proceso, Descripcion,FechaAud) VALUES ('INS',CONCAT('entra v_MovTipo ---> ', v_MovTipo),CURRENT Timestamp); --LLENA TMP
   --INSERT INTO Temprep (Proceso, Descripcion,FechaAud) VALUES ('INS',CONCAT(' v_DELETE  -- ', v_DELETE),CURRENT Timestamp); --LLENA TMP
   /*CALCULO AÑO - MES ANTERIOR*/
    IF v_MvCMes = 1 THEN
    	SET v_anio_ant = v_MvCAnio - 1;
    	SET v_mes_ant  = 13;
    ELSEIF (v_MvCMes >= 2 AND v_MvCMes <= 11) THEN
       	SET v_anio_ant = v_MvCAnio;
       	SET v_mes_ant  = v_MvCMes - 1;
    ELSE
        IF(v_MvCMes = 12) THEN
       	   IF(v_MvCCmpAj = 'S') THEN
        	   SET v_anio_ant = v_MvCAnio;
        	   SET v_mes_ant  = 12;
        	   SET v_MvCMes  = 13;
           ELSE
               SET v_anio_ant = v_MvCAnio;
        	   SET v_mes_ant  = 11;
        	   SET v_MvCMes  = 12;
           END IF;
        END IF;
    END IF;

	
    /*Calculo SWCie*/
    SELECT ParmDCieA INTO v_ParmDCieA from PARMCON where EMPCOD = v_EMPCOD and tranapl = 'CONTABILIDAD'; --ParmDCieA
    
	IF(v_MovTipo = 'L') THEN
		IF((SELECT COUNT(*) 
			FROM HOSVINEW.MOVCONT3 M3, HOSVINEW.MOVCONT2 M2
			WHERE M2.EMPCOD = v_EMPCOD 	AND M2.DOCCOD = v_ParmDCieA AND M2.MvCAnio = v_anio_ant	AND M2.MvCMes = 12 AND M2.MvCCmpAj = 'S' AND M3.MvCEst = 'C'
			AND M3.EMPCOD = M2.EMPCOD 	AND M3.DOCCOD = M2.DOCCOD 	AND M3.MVCNRO = M2.MVCNRO 	AND M3.MCDPTO = M2.MCDPTO) > 0) THEN
			SET v_SWCie = 'S';
		ELSE
			SET v_SWCie = 'N';
		END IF;

		
		IF(v_DELETE = 'S') THEN
			SELECT	C.CntNat, /*NATURALEZA DE LA CUENTA*/
					(SELECT RsAxSAct FROM RSMAUX WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_anio_ant AND RsmMes = v_mes_ant),
					(SELECT RsmSalAct FROM RESMCUE WHERE RsmEmpCod = v_EMPCOD AND RsmAno = v_anio_ant AND RsmMes = v_mes_ant AND RsmCtnCon = v_CNTCOD AND
												         TrcCod = v_TrcCod    AND MCDpto = v_MCDpto   AND CnUCod = v_CnUCod  AND CnUSub = v_CnUSub)
			INTO v_CntNat, v_SaldoActualMesAnterior, v_SaldoGenMesAnterior
			FROM MOVCONT3 M3, MOVCONT2 M2, CUENTAS C
			WHERE M2.EMPCOD = v_EMPCOD AND M2.DOCCOD = v_DOCCOD AND M2.MvCNro = v_MvCNro AND M2.MCDPTO = v_MCDpto AND M2.MVCCSC = v_MvCCsc AND
					M3.EMPCOD = M2.EMPCOD AND M3.DOCCOD = M2.DOCCOD AND M3.MVCNRO = M2.MVCNRO AND M3.MCDpto = M2.MCDPTO AND
					M2.EMPCOD = C.EMPCOD AND M2.MvCAnio = C.CntVig AND M2.CntCod = C.CntCod;
					
			IF(v_SaldoActualMesAnterior IS NULL) THEN SET v_SaldoActualMesAnterior = 0; END IF;
			IF(v_SaldoGenMesAnterior 	IS NULL) THEN SET v_SaldoGenMesAnterior = 0; END IF;
			
			
			IF(v_MvCNat = 'D') THEN
				/*RSMAUX*/
				SELECT RsmIdx,
					   (RsAxDeb - v_MvCVlrLc), 
					   RsAxCre,
					   (CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + (CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) - ((CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) - v_MvCVlrLc)
							 WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + ((CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) - v_MvCVlrLc) - (CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) END)
				INTO v_RsmIdx, v_RsAxDeb, v_RsAxCre, v_RsAxCre, v_RsAxSAct
				FROM RSMAUX
				WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_MvCAnio AND RsmMes = v_MvCMes;

				/*RESMCUE*/
				SELECT RsmIdn,
					   (RsmDeb - v_MvCVlrLc),
					   RsmCre,
					   (CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + (CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) - ((CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END) - v_MvCVlrLc)
							 WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + ((CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END)- v_MvCVlrLc) - (CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) END)
				INTO v_RsmIdn, v_RsmDeb, v_RsmCre, v_RsmSalAct
				FROM RESMCUE
				WHERE RsmEmpCod = v_EMPCOD AND	RsmCtnCon = v_CNTCOD AND		MCDpto = v_MCDpto  AND
				CnUCod    = v_CnUCod AND	CnUSub    = v_CnUSub AND		CNCCOD = v_CNCCOD  AND
				CntSub    = v_CntSub AND	TrcCod    = v_TrcCod AND		RsmAno = v_MvCAnio AND RsmMes = v_MvCMes;

			ELSEIF(v_MvCNat = 'C') THEN
				/*RSMAUX*/
				SELECT RsmIdx,
					   (RsAxCre - v_MvCVlrLc),
					   RsAxDeb,
					   (CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + ((CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) - v_MvCVlrLc) - (CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END)
							 WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + (CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) - ((CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) - v_MvCVlrLc) END)
				INTO v_RsmIdx, v_RsAxCre, v_RsAxDeb, v_RsAxSAct
				FROM RSMAUX
				WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_MvCAnio AND RsmMes = v_MvCMes;

				/*RESMCUE*/
				SELECT RsmIdn,
					   RsmDeb,
					   (RsmCre - v_MvCVlrLc),
					   (CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + ((CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) - v_MvCVlrLc) - (CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END)
							 WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + (CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END) - ((CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) - v_MvCVlrLc) END)
				INTO v_RsmIdn, v_RsmDeb, v_RsmCre, v_RsmSalAct
				FROM RESMCUE
				WHERE	RsmEmpCod = v_EMPCOD AND	RsmCtnCon = v_CNTCOD AND		MCDpto = v_MCDpto  AND
						CnUCod    = v_CnUCod AND	CnUSub    = v_CnUSub AND		CNCCOD = v_CNCCOD  AND
						CntSub    = v_CntSub AND	TrcCod    = v_TrcCod AND		RsmAno = v_MvCAnio AND RsmMes = v_MvCMes;
			END IF;
			/*RSMAUX*/					
				UPDATE RSMAUX
				SET RsAxDeb  = v_RsAxDeb,
					RsAxCre  = v_RsAxCre,
					RsAxSAct = v_RsAxSAct
				WHERE RsmIdx = v_RsmIdx;

			/*RESMCUE*/
				UPDATE RESMCUE
				SET RsmDeb	  = v_RsmDeb,
					RsmCre	  = v_RsmCre,
					RsmSalAct = v_RsmSalAct
				WHERE RsmIdn = v_RsmIdn;

			/*MOVCONT3*/
			UPDATE MOVCONT3
			SET MvCMayAux = 'S', MvCMayGen = 'S'
			WHERE EMPCOD = v_EMPCOD AND DOCCOD = v_DOCCOD AND MvCNro = v_MvCNro AND MCDpto = v_MCDpto;

		ELSEIF (v_DELETE = 'N') THEN
			SELECT 	C.CntNvl, TP.TpCClsCap, C.CntNat,
					SUM(CASE WHEN M2.MVCNAT = 'D' THEN M2.MVCVLR ELSE 0 END),
					SUM(CASE WHEN M2.MVCNAT = 'C' THEN M2.MVCVLR ELSE 0 END),
					(SELECT RsAxSAct  FROM RSMAUX  WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_anio_ant AND RsmMes = v_mes_ant),
					(SELECT RsmSalAct FROM RESMCUE WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND  MCDpto = v_MCDpto AND CnUCod = v_CnUCod AND CnUSub = v_CnUSub AND 
													     CNCCOD = v_CNCCOD AND CntSub = v_CntSub AND TrcCod = v_TrcCod AND RsmAno = v_anio_ant AND RsmMes = v_mes_ant)
			INTO v_CntNvl, v_TPCCLSCAP, v_CntNat, v_MvDebito, v_MvCredito, v_SaldoActualMesAnterior, v_SaldoGenMesAnterior
			FROM MOVCONT3 M3, MOVCONT2 M2, CUENTAS C, TIPPCUE1 TP
			WHERE M2.EMPCOD = v_EMPCOD AND M2.DOCCOD = v_DOCCOD AND M2.MvCNro = v_MvCNro AND M2.MCDPTO = v_MCDpto AND M2.MVCCSC = v_MvCCsc AND
				  M3.EMPCOD = M2.EMPCOD AND M3.DOCCOD = M2.DOCCOD AND M3.MVCNRO = M2.MVCNRO AND M3.MCDpto = M2.MCDPTO AND
				  M2.EMPCOD = C.EMPCOD AND M2.MvCAnio = C.CntVig AND M2.CntCod = C.CntCod AND
				  TP.TpCCod = v_TpCCod AND TP.TpCCodCap = C.TpCCodCap
			GROUP BY C.CntNvl, TP.TpCClsCap, C.CntNat;
			
			------------/*RSMAUX */ ----------------
			IF(v_SaldoActualMesAnterior IS NULL) THEN SET v_SaldoActualMesAnterior = 0; END IF;

			SET v_RsAxSAnt  = HOSVINEW.FN_SALDOANTERIORMAYORIZACION (v_TPCCLSCAP, v_SWCie, v_SaldoActualMesAnterior, v_MvCMes); --RsAxSAnt
			
			SELECT	RsmIdx,
					SUM(RsAxDeb + v_MvDebito)  AS RsAxDeb,
					SUM(RsAxCre + v_MvCredito) AS RsAxCre,
					(CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + ((CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) + v_MvCredito) - ((CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) + v_MvDebito)
						  WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + ((CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) + v_MvDebito)  - ((CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) + v_MvCredito) END) AS RsAxSAct
			INTO v_RsmIdx, v_RsAxDeb, v_RsAxCre, v_RsAxSAct
			FROM RSMAUX
			WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_MvCAnio AND RsmMes = v_MvCMes
			GROUP BY RsmIdx, RsAxCre, RsAxDeb;

			IF(v_RsmIdx IS NOT NULL) THEN
				UPDATE RSMAUX 
				SET RsmNiv   = v_CntNvl,
					RsAxDeb  = v_RsAxDeb,
					RsAxCre  = v_RsAxCre,
					RsAxSAnt = v_RsAxSAnt,
					RsAxSAct = v_RsAxSAct
				WHERE RsmIdx = v_RsmIdx;
			ELSE
				IF(v_CntNat = 'C') THEN
				SET v_RsAxSAct = (v_SaldoActualMesAnterior + (v_MvCredito - v_MvDebito));
				ELSEIF(v_CntNat = 'D') THEN
				SET v_RsAxSAct = (v_SaldoActualMesAnterior + (v_MvDebito - v_MvCredito));
                END IF;
				
				SET v_ULTIMOID =  (SELECT CASE WHEN RSMIDX IS NULL THEN 1 ELSE RSMIDX + 1 END FROM RSMAUX ORDER BY RSMIDX DESC FETCH FIRST 1 ROW ONLY);--ULTIMO CONSECUTIVO
				IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
				
				INSERT INTO RSMAUX (RsmIdx, RsmEmpCod, RsmCtnCon, RsmAno, RsmMes, RsmNiv, RsAxDeb, RsAxCre, RsAxSAnt, RsAxSAct)
				VALUES (v_ULTIMOID, v_EMPCOD, v_cntcod, v_MvCAnio, v_MvCMes, v_CntNvl, v_MvDebito, v_MvCredito, v_RsAxSAnt, v_RsAxSAct);
			END IF;

			------------/*RESMCUE */ ----------------
			IF(v_SaldoGenMesAnterior IS NULL) THEN SET v_SaldoGenMesAnterior = 0; END IF;
			
			SET v_RsmSalAnt = HOSVINEW.FN_SALDOANTERIORMAYORIZACION (v_TPCCLSCAP, v_SWCie, v_SaldoGenMesAnterior, v_MvCMes); --RsmSalAnt
			
			SELECT RsmIdn,
				   SUM(RsmDeb + v_MvDebito)  AS RsmDeb,
				   SUM(RsmCre + v_MvCredito) AS RsmCre,
				   (CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + ((CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) + v_MvCredito) - ((CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END) + v_MvDebito)
						 WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + ((CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END) + v_MvDebito)  - ((CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) + v_MvCredito) END) AS RsmSalAct
			INTO v_RsmIdn, v_RsmDeb, v_RsmCre, v_RsmSalAct
			FROM RESMCUE
			WHERE RsmEmpCod = v_EMPCOD	AND RsmCtnCon 	= v_CNTCOD 	AND MCDpto = v_MCDpto 	AND
				  CnUCod 	= v_CnUCod  AND CnUSub 		= v_CnUSub  AND CNCCOD = v_CNCCOD 	AND
				  CntSub 	= v_CntSub  AND TrcCod 		= v_TrcCod  AND RsmAno = v_MvCAnio	AND RsmMes = v_MvCMes
			GROUP BY RsmIdn, RsmCre, RsmDeb;

			IF (v_RsmIdn IS NOT NULL) THEN
				UPDATE RESMCUE
				SET RsmNvl    = v_CntNvl,
					RsmDeb    = v_RsAxDeb,
					RsmCre    = v_RsAxCre,
					RsmSalAnt = v_RsmSalAnt,
					RsmSalAct = v_RsmSalAct,
					RsmInd    = 'M',
					RsSlAntEx = 0,
					RsSlActEx = 0
				WHERE RsmIdn = v_RsmIdn;
			ELSE
				IF(v_CntNat = 'C')THEN
				SET v_RsmSalAct = (v_SaldoGenMesAnterior + (v_MvCredito - v_MvDebito));
				ELSEIF (v_CntNat = 'D') THEN
				SET v_RsmSalAct = (v_SaldoGenMesAnterior + (v_MvDebito - v_MvCredito));
                END IF;
				
				SET v_ULTIMOID = (SELECT CASE WHEN RSMIDN IS NULL THEN 1 ELSE RSMIDN + 1 END FROM RESMCUE ORDER BY RSMIDN DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO
				IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
				
				INSERT INTO RESMCUE (RsmIdn, RsmEmpCod, RsmCtnCon, MCDpto, CnUCod, CnUSub, CNCCOD, CntSub, TrcCod, RsmAno, RsmMes, RsmNvl, RsmDeb, RsmCre, RsmSalAnt, RsmSalAct, RsmInd, RsSlAntEx, RsSlActEx)
				VALUES (v_ULTIMOID, v_EMPCOD, v_CNTCOD, v_MCDpto, v_CnUCod,v_CnUSub, v_CNCCOD, v_CntSub, v_TrcCod, v_MvCAnio, v_MvCMes, v_CntNvl, v_MvDebito, v_MvCredito, v_RsAxSAnt, v_RsmSalAct, 'M', 0.00, 0.00);
			END IF;

			/*-----MOVCONT3------*/
			UPDATE MOVCONT3
			SET MvCMayAux = 'S', MvCMayGen = 'S'
			WHERE EMPCOD = v_EMPCOD AND DOCCOD = v_DOCCOD AND MvCNro = v_MvCNro AND MCDpto = v_MCDpto;
		END IF;
		
		/*ACTUALIZAR SALDOS HASTA EL MES ACTUAL*/
		IF(v_MvCMes < MONTH(CURRENT DATE)) THEN
			SET v_CntMes = v_MvCMes;     SET v_CntAnio = v_MvCAnio;
			
			WHILE (v_CntMes = MONTH(CURRENT DATE)) DO
				/*CALCULAR SALDOS ANTERIORES RSMAUX / RESMCUE*/
				SELECT RsAxSAct INTO v_SaldoAntRsmaux FROM RSMAUX WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_CntAnio AND RsmMes = v_CntMes;  /*SALDO ANTERIOR RSMAUX*/
				
				SELECT RsmSalAct INTO v_SaldoAntResmcue
				FROM RESMCUE
				WHERE RsmEmpCod = v_EMPCOD AND	RsmCtnCon = v_CNTCOD AND		MCDpto = v_MCDpto  AND
					  CnUCod    = v_CnUCod AND	CnUSub    = v_CnUSub AND		CNCCOD = v_CNCCOD  AND
					  CntSub    = v_CntSub AND	TrcCod    = v_TrcCod AND		RsmAno = v_CntAnio AND RsmMes = v_CntMes; /*SALDO MES ANTERIOR RESMCUE*/
				
				SET v_CntMes = v_CntMes + 1; /*SIGUIENTE MES*/
				
				IF (v_CntMes = 13) THEN 	/*CAMBIO DE AÑO*/
					SET v_CntMes = 1;
					SET v_CntAnio = (v_CntAnio + 1);
				END IF;
				
				/****RSMAUX****/
				IF EXISTS(SELECT 1 FROM RSMAUX WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_CntAnio AND RsmMes = v_CntMes FETCH FIRST 1 ROW ONLY) THEN
					UPDATE RSMAUX
					SET RsAxSAnt = v_SaldoAntRsmaux,
						RsAxSAct = (CASE WHEN v_CntNat = 'C' THEN v_SaldoAntRsmaux + (CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) - (CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END)
										 WHEN v_CntNat = 'D' THEN v_SaldoAntRsmaux + (CASE WHEN RsAxDeb IS NULL THEN 0 ELSE RsAxDeb END) - (CASE WHEN RsAxCre IS NULL THEN 0 ELSE RsAxCre END) END)
					WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND RsmAno = v_CntAnio AND RsmMes = v_CntMes;
				ELSE
					/*Si no existe la cuenta en el mes siguiente*/
					SET v_ULTIMOID	= (SELECT CASE WHEN RsmIdx IS NULL THEN 1 ELSE RsmIdx + 1 END FROM RSMAUX ORDER BY RsmIdx DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO;
					IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;

					INSERT INTO RSMAUX (RsmIdx, RsmEmpCod, RsmCtnCon, RsmAno, RsmMes, RsmNiv, RsAxDeb, RsAxCre, RsAxSAnt, RsAxSAct)
					VALUES (v_ULTIMOID, v_EMPCOD, v_cntcod, v_InCntAnio, v_CntMes, v_CntNvl, 0, 0, v_SaldoAntRsmaux, v_SaldoAntRsmaux);
				END IF;
				
				/****RESMCUE****/
				IF EXISTS(SELECT 1
							FROM RESMCUE
							WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND MCDpto = v_MCDpto AND CnUCod = v_CnUCod  AND CnUSub = v_CnUSub AND
								  CNCCOD = v_CNCCOD	  AND CntSub = v_CntSub	  AND TrcCod = v_TrcCod AND RsmAno = v_CntAnio AND RsmMes = v_CntMes FETCH FIRST 1 ROWS ONLY) THEN
					UPDATE RESMCUE
					SET RsmSalAnt = v_SaldoAntResmcue,
						RsmSalAct = (CASE WHEN v_CntNat = 'C' THEN v_SaldoAntResmcue + (CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) - (CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END)
										  WHEN v_CntNat = 'D' THEN v_SaldoAntResmcue + (CASE WHEN RsmDeb IS NULL THEN 0 ELSE RsmDeb END) - (CASE WHEN RsmCre IS NULL THEN 0 ELSE RsmCre END) END)
					WHERE RsmEmpCod = v_EMPCOD AND RsmCtnCon = v_CNTCOD AND MCDpto = v_MCDpto AND CnUCod = v_CnUCod  AND CnUSub = v_CnUSub AND
						  CNCCOD = v_CNCCOD	  AND CntSub = v_CntSub	  AND TrcCod = v_TrcCod AND RsmAno = v_CntAnio AND RsmMes = v_CntMes;
				ELSE
                    /*Si no existe la cuenta en el mes siguiente*/
					SET v_ULTIMOID = (SELECT CASE WHEN RsmIdn IS NULL THEN 1 ELSE RsmIdn + 1 END FROM RESMCUE ORDER BY RsmIdn DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO;
					IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
					
					INSERT INTO RESMCUE (RsmIdn, RsmEmpCod, RsmCtnCon, MCDpto, CnUCod, CnUSub, CNCCOD, CntSub, TrcCod, RsmAno, RsmMes, RsmNvl, RsmDeb, RsmCre, RsmSalAnt, RsmSalAct, RsmInd, RsSlAntEx, RsSlActEx)
					VALUES	(v_ULTIMOID, v_EMPCOD, v_CNTCOD, v_MCDpto, v_CnUCod, v_CnUSub, v_CNCCOD, v_CntSub, v_TrcCod, v_CntAnio, v_CntMes, v_CntNvl, 0, 0, v_SaldoAntResmcue, v_SaldoAntResmcue, 'M', 0.00, 0.00);  --**Saldo actual = Saldo Anterior
				END IF;
			END WHILE;
		END IF;
    
	ELSEIF(v_MovTipo = 'N') THEN /*NIIF*/
		IF((SELECT COUNT(*) 
			FROM NIMOVCON1 M1, NIMOVCON2 M2
			WHERE M2.EMPCOD = v_EMPCOD 	AND M2.DOCCOD = v_ParmDCieA	AND M2.NIMC2SO = v_anio_ant 	AND M2.NIMC2MES = 12 AND M2.NIMC2AJS = 'S' AND M1.NIMC1EST = 'C'
			AND M1.EMPCOD = M2.EMPCOD 	AND M1.DOCCOD = M2.DOCCOD 	AND M1.NIMCNRO = M2.NIMCNRO	AND M1.MCDPTO   = M2.MCDPTO) > 0) THEN
			SET v_SWCie = 'S';
		ELSE
			SET v_SWCie = 'N';
		END IF;
        
        /*Homologacion de Cuentas Niif*/
        SELECT NICNTCOD INTO V_CNTCOD
	    FROM HOSVINEW.NICUENTASH
	    WHERE EMPCOD = V_EMPCOD AND CntVig = v_MvCAnio AND CntCod = V_CNTCOD;
	    
		IF(v_DELETE = 'S') THEN
			SELECT	C.NICNTNAT, /*NATURALEZA DE LA CUENTA*/
					(SELECT NIRCAACT FROM NIRSMAUX  WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_anio_ant AND NIRCMES = v_mes_ant),
					(SELECT NIRCGACT FROM NIRSMGEN WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND  MCDpto = v_MCDpto AND CnUCod = v_CnUCod AND CnUSub = v_CnUSub AND 
									                     CNCCOD = v_CNCCOD AND CntSub = v_CntSub AND TrcCod = v_TrcCod AND NIRCANIO = v_anio_ant AND NIRCMES = v_mes_ant)
			INTO v_CntNat, v_SaldoActualMesAnterior, v_SaldoGenMesAnterior
			FROM NIMOVCON1 M1, NIMOVCON2 M2, NICUENTAS C
			WHERE M2.EMPCOD = v_EMPCOD AND M2.DOCCOD = v_DOCCOD AND M2.NIMCNRO = v_MvCNro AND M2.MCDPTO = v_MCDpto AND M2.NIMC2CSC = v_MvCCsc AND
					M1.EMPCOD = M2.EMPCOD AND M1.DOCCOD = M2.DOCCOD AND M1.NIMCNRO = M2.NIMCNRO AND M1.MCDpto = M2.MCDPTO AND
					M2.EMPCOD = C.EMPCOD AND M2.NIMC2SO = C.NICNTVIG AND M2.NICNTCOD = C.NICNTCOD;

			IF(v_SaldoActualMesAnterior IS NULL) THEN SET v_SaldoActualMesAnterior = 0; END IF;
			IF(v_SaldoGenMesAnterior IS NULL) THEN SET v_SaldoGenMesAnterior = 0; END IF;
						
			IF(v_MvCNat = 'D') THEN
				/*NIRSMAUX*/
				SELECT	 NIRCIDX,
						 (NIRCADEB - v_MvCVlrLc), 
						 NIRCACRE,
						 (CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + (CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) - ((CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) - v_MvCVlrLc)
							   WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + ((CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) - v_MvCVlrLc) - (CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) END)
				INTO v_RsmIdx, v_RsAxDeb, v_RsAxCre, v_RsAxSAct
				FROM NIRSMAUX
				WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes;

				/*NIRSMGEN*/
				SELECT	 NIRCIDN,
						 (NIRCGDEB - v_MvCVlrLc),
						 NIRCGCRE,
						 (CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + (CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) - ((CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END) - v_MvCVlrLc)
							   WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + ((CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END)- v_MvCVlrLc) - (CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) END)
				INTO v_RsmIdn, v_RsmDeb, v_RsmCre, v_RsmSalAct
				FROM NIRSMGEN
				WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND	MCDpto   = v_MCDpto  AND
				      CnUCod  = v_CnUCod AND CnUSub  = v_CnUSub AND	CNCCOD   = v_CNCCOD  AND
				      CntSub  = v_CntSub AND TrcCod  = v_TrcCod AND	NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes;

			 ELSEIF(v_MvCNat = 'C') THEN
				/*NIRSMAUX*/
				SELECT NIRCIDX,
					   (NIRCACRE - v_MvCVlrLc),
					   NIRCADEB,
					  (CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + ((CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) - v_MvCVlrLc) - (CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END)
							WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + (CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) - ((CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) - v_MvCVlrLc) END)
				INTO v_RsmIdx, v_RsAxCre, v_RsAxDeb, v_RsAxSAct
				FROM NIRSMAUX
				WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes;

				/*NIRSMGEN*/
				SELECT NIRCIDN,
					   NIRCGDEB,
					   (NIRCGCRE - v_MvCVlrLc),
					   (CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + ((CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) - v_MvCVlrLc) - (CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END)
							 WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + (CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END) - ((CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) - v_MvCVlrLc) END)
				INTO v_RsmIdn, v_RsmDeb, v_RsmCre, v_RsmSalAct
				FROM NIRSMGEN
				WHERE	NIRCEMP = v_EMPCOD AND	NIRCCUE = v_CNTCOD AND MCDpto   = v_MCDpto  AND
						CnUCod  = v_CnUCod AND	CnUSub  = v_CnUSub AND CNCCOD   = v_CNCCOD  AND
						CntSub  = v_CntSub AND	TrcCod  = v_TrcCod AND NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes;
			END IF;
			/*NIRSMAUX*/					
				UPDATE NIRSMAUX
				SET NIRCADEB = v_RsAxDeb,
					NIRCACRE = v_RsAxCre,
					NIRCAACT = v_RsAxSAct
				WHERE NIRCIDX = v_RsmIdx;

			/*NIRSMGEN*/
				UPDATE NIRSMGEN
				SET NIRCGDEB = v_RsmDeb,
					NIRCGCRE = v_RsmCre,
					NIRCGACT = v_RsmSalAct
				WHERE NIRCIDN = v_RsmIdn;

			/*NIMOVCON1*/

			CALL DBMS_OUTPUT.PUT_LINE('VOY A ACTUALIZAR EL ESTADO DELAMAYORIZACION  \n ');  

			UPDATE NIMOVCON1
			SET NIMC1MA = 'S', NIMC1MG = 'S'
			WHERE EMPCOD = v_EMPCOD AND DOCCOD = v_DOCCOD AND NIMCNRO = v_MvCNro AND MCDpto = v_MCDpto;
		
		ELSE IF (v_DELETE = 'N') THEN
			SELECT 	C.NICNTNVL, TP.TpCClsCap, C.NICNTNAT,
				SUM(CASE WHEN M2.NIMC2NAT = 'D' THEN M2.NIMC2VL ELSE 0 END),
				SUM(CASE WHEN M2.NIMC2NAT = 'C' THEN M2.NIMC2VL ELSE 0 END),
				(SELECT NIRCAACT FROM NIRSMAUX WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_anio_ant AND NIRCMES = v_mes_ant),
				(SELECT NIRCGACT FROM NIRSMGEN WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND  MCDpto = v_MCDpto AND CnUCod = v_CnUCod AND CnUSub = v_CnUSub AND 
									                 CNCCOD = v_CNCCOD AND CntSub = v_CntSub AND TrcCod = v_TrcCod AND NIRCANIO = v_anio_ant AND NIRCMES = v_mes_ant)
			INTO v_CntNvl, v_TPCCLSCAP, v_CntNat, v_MvDebito, v_MvCredito, v_SaldoActualMesAnterior, v_SaldoGenMesAnterior
			FROM NIMOVCON1 M1, NIMOVCON2 M2, NICUENTAS C, TIPPCUE1 TP
			WHERE M2.EMPCOD = v_EMPCOD AND M2.DOCCOD = v_DOCCOD AND M2.NIMCNRO = v_MvCNro AND M2.MCDPTO = v_MCDpto AND M2.NIMC2CSC = v_MvCCsc AND
					  M1.EMPCOD = M2.EMPCOD AND M1.DOCCOD = M2.DOCCOD AND M1.NIMCNRO = M2.NIMCNRO AND M1.MCDpto = M2.MCDPTO AND
					  M2.EMPCOD = C.EMPCOD AND M2.NIMC2ANIO = C.NICNTVIG AND M2.NICNTCOD = C.NICNTCOD AND
					  TP.TpCCod = v_TpCCod AND TP.TpCCodCap = C.TpCCodCap
			GROUP BY C.NICNTNVL, TP.TpCClsCap,C.NICNTNAT;
			
				------------/*NIRSMAUX */ ----------------
			IF(v_SaldoActualMesAnterior IS NULL) THEN SET v_SaldoActualMesAnterior = 0; END IF;
			SET v_NIRCAANT  = HOSVINEW.FN_SALDOANTERIORMAYORIZACION (v_TPCCLSCAP, v_SWCie, v_SaldoActualMesAnterior, v_MvCMes); --RsAxSAnt
			
			SELECT	NIRCIDX,
					SUM(NIRCADEB + v_MvDebito),
					SUM(NIRCACRE + v_MvCredito),
					(CASE WHEN v_CntNat = 'C' THEN v_SaldoActualMesAnterior + ((CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) + v_MvCredito) - ((CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) + v_MvDebito)
						  WHEN v_CntNat = 'D' THEN v_SaldoActualMesAnterior + ((CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) + v_MvDebito)  - ((CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) + v_MvCredito)END)
			INTO v_RsmIdx, v_RsAxDeb, v_RsAxCre, v_NIRCAACT
			FROM NIRSMAUX			
			WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes
			GROUP BY NIRCIDX, NIRCACRE, NIRCADEB;

			IF(v_RsmIdx IS NOT NULL) THEN
			
			UPDATE NIRSMAUX 
				SET NIRCANIV = v_CntNvl,
					NIRCADEB = v_RsAxDeb,
					NIRCACRE = v_RsAxCre,
					NIRCAANT = v_NIRCAANT,
					NIRCAACT = v_NIRCAACT
				WHERE NIRCIDX = v_RsmIdx;
			ELSE
				IF(v_CntNat = 'C')THEN
					SET v_NIRCAACT = (v_SaldoActualMesAnterior + (v_MvCredito - v_MvDebito));
				ELSEIF(v_CntNat = 'D')THEN
					SET v_NIRCAACT = (v_SaldoActualMesAnterior + (v_MvDebito - v_MvCredito));
                END IF;
				
				SET v_ULTIMOID =  (SELECT CASE WHEN NIRCIDX IS NULL THEN 1 ELSE NIRCIDX + 1 END FROM NIRSMAUX ORDER BY NIRCIDX DESC FETCH FIRST 1 ROW ONLY);--ULTIMO CONSECUTIVO
				IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
				
				INSERT INTO NIRSMAUX (NIRCIDX, NIRCEMP, NIRCCUE, NIRCANIO, NIRCMES, NIRCANIV, NIRCADEB, NIRCACRE, NIRCAANT, NIRCAACT)
				VALUES	(v_ULTIMOID, v_EMPCOD, v_CNTCOD, v_MvCAnio, v_MvCMes, v_CntNvl, v_MvDebito, v_MvCredito, v_NIRCAANT, v_NIRCAACT);
			END IF;

			------------/*NIRSMGEN */ ----------------
			IF(v_SaldoGenMesAnterior IS NULL) THEN SET v_SaldoGenMesAnterior = 0; END IF;
			SET v_NIRCGANT = HOSVINEW.FN_SALDOANTERIORMAYORIZACION (v_TPCCLSCAP, v_SWCie, v_SaldoGenMesAnterior, v_MvCMes); --v_NIRCGANT
			
			SELECT	NIRCIDN,
					SUM(NIRCGDEB + v_MvDebito),
					SUM(NIRCGCRE + v_MvCredito),
					(CASE WHEN v_CntNat = 'C' THEN v_SaldoGenMesAnterior + ((CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) + v_MvCredito) - ((CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END) + v_MvDebito)
						  WHEN v_CntNat = 'D' THEN v_SaldoGenMesAnterior + ((CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END) + v_MvDebito ) - ((CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) + v_MvCredito) END)
			INTO v_RsmIdn, v_NIRCGDEB, v_NIRCGCRE, v_NIRCGACT
			FROM NIRSMGEN
			WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND	MCDpto  = v_MCDpto  AND
				  CnUCod = v_CnUCod  AND CnUSub = v_CnUSub AND CNCCOD   = v_CNCCOD  AND
				  CntSub = v_CntSub  AND TrcCod = v_TrcCod AND NIRCANIO = v_MvCAnio AND NIRCMES = v_MvCMes
			GROUP BY NIRCIDN, NIRCGCRE, NIRCGDEB;

			IF (v_RsmIdn IS NOT NULL) THEN
				UPDATE NIRSMGEN
				SET NIRCGNIV = v_CntNvl,
					NIRCGDEB = v_NIRCGDEB,
					NIRCGCRE = v_NIRCGCRE,
					NIRCGANT = v_NIRCGANT,
					NIRCGACT = v_NIRCGACT,
					NIRCGIND  = 'M',
					NIRCGANTE = 0,
					NIRCGACTE = 0
				WHERE NIRCIDN = v_RsmIdn;
			ELSE
				IF(v_CntNat = 'C')THEN
					SET v_NIRCGACT = (v_SaldoGenMesAnterior + (v_MvCredito - v_MvDebito));
				ELSEIF(v_CntNat = 'D')THEN
					SET v_NIRCGACT = (v_SaldoGenMesAnterior + (v_MvDebito - v_MvCredito));
                END IF;
				
				SET v_ULTIMOID = (SELECT CASE WHEN NIRCIDN IS NULL THEN 1 ELSE NIRCIDN + 1 END FROM NIRSMGEN ORDER BY NIRCIDN DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO
				IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
				
				INSERT INTO NIRSMGEN (NIRCIDN, NIRCEMP, NIRCCUE, MCDpto, CnUCod, CnUSub, CNCCOD, CntSub, TrcCod, NIRCANIO, NIRCMES, NIRCGNIV, NIRCGDEB, NIRCGCRE, NIRCGANT, NIRCGACT, NIRCGIND, NIRCGANTE, NIRCGACTE)
				VALUES	(v_ULTIMOID, v_EMPCOD, v_CNTCOD, v_MCDpto, v_CnUCod, v_CnUSub, v_CNCCOD, v_CntSub, v_TrcCod, v_MvCAnio, v_MvCMes, v_CntNvl, v_MvDebito, v_MvCredito, v_NIRCGANT, v_NIRCGACT, 'M', 0.00, 0.00);
			END IF;

			/*NIMOVCON1*/


			UPDATE NIMOVCON1
			SET NIMC1MA = 'S', NIMC1MG = 'S'
			WHERE EMPCOD = v_EMPCOD AND DOCCOD = v_DOCCOD AND NIMCNRO = v_MvCNro AND MCDpto = v_MCDpto;
		END IF;		
			
		/*ACTUALIZAR SALDOS HASTA EL MES ACTUAL*/
		IF(v_MvCMes < MONTH(CURRENT DATE)) THEN
			SET v_CntMes  = v_MvCMes;	SET v_CntAnio = v_MvCAnio;

			WHILE (v_CntMes = MONTH(CURRENT DATE)) DO
				/*SALDOS ANTERIORES NIRSMAUX / RESMCUE*/
				SELECT NIRCAACT INTO v_SaldoAntRsmaux FROM NIRSMAUX WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes;  /*SALDO ANTERIOR RSMAUX*/
				
				SELECT NIRCGACT INTO v_SaldoAntResmcue
				FROM NIRSMGEN 
				WHERE NIRCEMP = v_EMPCOD AND	NIRCCUE = v_CNTCOD AND MCDpto   = v_MCDpto  AND
					  CnUCod  = v_CnUCod AND	CnUSub  = v_CnUSub AND CNCCOD   = v_CNCCOD  AND
					  CntSub  = v_CntSub AND	TrcCod  = v_TrcCod AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes;
				
				SET v_CntMes = v_CntMes + 1;  /*SIGUIENTE MES*/

				IF(v_CntMes = 13) THEN
					SET v_CntMes = 1;
					SET v_CntAnio = (v_CntAnio + 1); /*CAMBIO DE AÑO*/
				END IF;

				/****NIRSMAUX****/
				IF EXISTS(SELECT 1 FROM NIRSMAUX WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes FETCH FIRST 1 ROWS ONLY) THEN
					UPDATE NIRSMAUX
					SET NIRCAANT = v_SaldoAntRsmaux,
						NIRCAACT = (CASE WHEN v_CntNat = 'C' THEN v_SaldoAntRsmaux + (CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) - (CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END)
										 WHEN v_CntNat = 'D' THEN v_SaldoAntRsmaux + (CASE WHEN NIRCADEB IS NULL THEN 0 ELSE NIRCADEB END) - (CASE WHEN NIRCACRE IS NULL THEN 0 ELSE NIRCACRE END) END)
					WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes;
				ELSE
					/*Si no existe la cuenta en el mes siguiente*/
					SET v_ULTIMOID	= (SELECT CASE WHEN NIRCIDX IS NULL THEN 1 ELSE NIRCIDX + 1 END FROM NIRSMAUX ORDER BY NIRCIDX DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO
					IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
					
					INSERT INTO NIRSMAUX (NIRCIDX, NIRCEMP, NIRCCUE, NIRCANIO, NIRCMES, NIRCANIV, NIRCADEB, NIRCACRE, NIRCAANT, NIRCAACT)
					VALUES (v_ULTIMOID, v_EMPCOD, v_cntcod, v_CntAnio, v_CntMes, v_CntNvl, 0, 0, v_SaldoAntRsmaux, v_SaldoAntRsmaux);
				END IF;

				/****NIRSMGEN****/
				IF EXISTS(SELECT 1 
							FROM NIRSMGEN
							WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND MCDpto = v_MCDpto AND CnUCod = v_CnUCod	   AND CnUSub = v_CnUSub AND
								  CNCCOD = v_CNCCOD  AND CntSub = v_CntSub  AND TrcCod = v_TrcCod AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes FETCH FIRST 1 ROWS ONLY) THEN
					UPDATE NIRSMGEN
					SET NIRCGANT = v_SaldoAntResmcue,
						NIRCGACT = (CASE WHEN v_CntNat = 'C' THEN v_SaldoAntResmcue + (CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) - (CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END)
										 WHEN v_CntNat = 'D' THEN v_SaldoAntResmcue + (CASE WHEN NIRCGDEB IS NULL THEN 0 ELSE NIRCGDEB END) - (CASE WHEN NIRCGCRE IS NULL THEN 0 ELSE NIRCGCRE END) END)
					WHERE NIRCEMP = v_EMPCOD AND NIRCCUE = v_CNTCOD AND MCDpto = v_MCDpto AND CnUCod = v_CnUCod    AND CnUSub = v_CnUSub AND
						  CNCCOD = v_CNCCOD	 AND CntSub = v_CntSub	AND TrcCod = v_TrcCod AND NIRCANIO = v_CntAnio AND NIRCMES = v_CntMes;
				ELSE
					/*Si no existe la cuenta en el mes siguiente*/
					SET v_ULTIMOID = (SELECT CASE WHEN NIRCIDX IS NULL THEN 1 ELSE NIRCIDX + 1 END FROM NIRSMAUX ORDER BY NIRCIDX DESC FETCH FIRST 1 ROW ONLY); --ULTIMO CONSECUTIVO
					IF(v_ULTIMOID IS NULL) THEN SET v_ULTIMOID = 1; END IF;
					
					INSERT INTO NIRSMGEN (NIRCIDN, NIRCEMP, NIRCCUE, MCDpto, CnUCod, CnUSub, CNCCOD, CntSub, TrcCod, NIRCANIO, NIRCMES, NIRCGNIV, NIRCGDEB, NIRCGCRE, NIRCGANT, NIRCGACT, NIRCGIND, NIRCGANTE, NIRCGACTE)
					VALUES (v_ULTIMOID, v_EMPCOD, v_CNTCOD, v_MCDpto, v_CnUCod, v_CnUSub, v_CNCCOD, v_CntSub, v_TrcCod, v_CntAnio, v_CntMes, v_CntNvl, 0, 0, v_SaldoAntResmcue, v_SaldoAntResmcue, 'M', 0.00, 0.00);  --**Saldo actual = Saldo Anterior
				END IF;
			END WHILE;
	   	   END IF;
	   END IF;
    END IF;
END;	º>