SELECT CON_CdiContratado, CON_DssNome, CON_VlnSalario, CAR_D1sCargo, CCU_D1sCentroCusto, TCU_D2sTipoCentroCusto
FROM Contratados
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN CentrosCustos ON (CON_CdiCentroCusto = CCU_CdiCentroCusto)
LEFT JOIN CentrosCustosFlexiveis ON (CCU_CdiCentroCusto = CCF_CdiCentroCusto)
LEFT JOIN TiposCentrosCustos ON (CCF_VlnConteudoFlexivel_09 = TCU_CdiTipoCentroCusto)
WHERE CON_CdiSituacao NOT IN (0,2,3,99)
AND CON_CdiFolha NOT IN (900,901,902)
ORDER BY TCU_D2sTipoCentroCusto, CCU_D1sCentroCusto