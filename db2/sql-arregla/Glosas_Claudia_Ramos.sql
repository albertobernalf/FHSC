select MPEstPac,* from CAPBAS where MPNOMC like ('%Rafael%hernandez%criollo%')

begin transaction;
UPDATE CAPBAS
SET MPEstPAC='N'
WHERE   MPNOMC like ('%Rafael%hernandez%criollo%') AND MPCedu = '';
-- COMMIT;
-- ROLLBACK;
