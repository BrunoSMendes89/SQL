SELECT AXP_NuiChaveEscopo, AXP_CdiLogTransacao
FROM LogsTransacoesPrsAgsxEscs
INNER JOIN LogsTransacoes ON (AXP_CdiLogTransacao = LTR_CdiLogTransacao)
WHERE  AXP_NuiChaveEscopo = 20552
AND LTR_CdiTransacao = 24264
ORDER BY AXP_NuiChaveEscopo