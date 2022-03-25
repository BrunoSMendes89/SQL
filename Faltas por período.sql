SELECT RPE_CdiContratado,CON_DssNome,CCU_D1sCentroCusto, RPE_DtiAno, RPE_CdiMes, RPE_DtdDataDia, RPE_CdiEventoPonto,EAP_D1sEventoPonto, RPE_QtnEventoPonto
FROM ConRCDiasPontoEventos
INNER JOIN Contratados ON (RPE_CdiContratado = CON_CdiContratado)
INNER JOIN CentrosCustos ON (CON_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN EventosPonto ON (RPE_CdiEventoPonto = EAP_CdiEventoPonto)
WHERE RPE_CdiEventoPonto in (34)
AND RPE_DtiAno = 2021
AND RPE_CdiMes = 12
and RPE_QtnEventoPonto_Jus > 0
AND CON_CdiSituacao NOT IN (0,2,3,99)
AND RPE_DtdDataDia between :De and :Ate
order by RPE_DtdDataDia, RPE_CdiContratado